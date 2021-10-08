from django.shortcuts import reverse, render
from django.shortcuts import redirect
from django.http import HttpResponse, HttpResponseRedirect, Http404
from datetime import datetime
from django.shortcuts import render
from django.views.generic import CreateView, ListView, UpdateView, RedirectView
from .forms import TransferBalanceForm, ShareBalanceForm, OfficialWithdrawForm, OfficialDepositForm, GetEmailForm, AskPinForm, ShareBalanceGetUserInfoForm
from core import models
from django.urls import reverse_lazy
import random
import string
from django.contrib.auth.mixins import LoginRequiredMixin
from WALSTATE.settings import PAGINATE_BY, ADMIN_TRC20_ADDRESS
from django.core.mail import send_mail

from WALSTATE.settings import EMAIL_HOST_USER
from bootstrap_modal_forms.generic import BSModalCreateView, BSModalUpdateView


class TransferBalanceView(LoginRequiredMixin, CreateView):
    # model = models.UserMemberShip
    form_class = TransferBalanceForm
    # template_name = 'transaction/transfer-balance.html'
    success_url = reverse_lazy('transfer-balance-history-view')
    success_message = 'Balance Transferred Successfully.'

    def form_valid(self, form):
        form.instance.user = self.request.user
        if form.is_valid():
            # get model object data from form here
            user = form.save(commit=False)
            user.save()

        # updating income of admin adding tax
        admin_obj = models.User.objects.filter(personal_id=12345678).first()
        admin_total_amount_obj = models.TotalAmounts.objects.filter(
            user=admin_obj).first()

        # if transferring from team earning
        if form.cleaned_data['type'] == 'team_earning':
            user_obj = models.TotalAmounts.objects.filter(
                user=self.request.user).first()
            user_obj.team_earning = user_obj.team_earning - \
                ((form.cleaned_data['amount']) +
                 (form.cleaned_data['amount'] * 0.025))
            user_obj.income = user_obj.income + (form.cleaned_data['amount'])
            user_obj.save()
            admin_total_amount_obj.income += (
                form.cleaned_data['amount'] + (form.cleaned_data['amount'] * 0.025))

        # if transferring from salary
        elif form.cleaned_data['type'] == 'salary':
            user_obj = models.TotalAmounts.objects.filter(
                user=self.request.user).first()
            user_obj.salary = user_obj.salary - \
                ((form.cleaned_data['amount']) +
                 (form.cleaned_data['amount'] * 0.05))
            user_obj.income = user_obj.income + (form.cleaned_data['amount'])
            user_obj.save()
            admin_total_amount_obj.income += (
                form.cleaned_data['amount'] + (form.cleaned_data['amount'] * 0.05))

        # saving to transaction history
        new_balance = models.TotalAmounts.objects.filter(
            user_id=self.request.user.id).first().income
        old_balance = new_balance - form.cleaned_data['amount']
        transaction = models.TransactionHistory(type1=form.cleaned_data['type'], credit_debit="Credit", amount=form.cleaned_data['amount'], old_balance=old_balance, new_balance=new_balance,
                                                details=f"Transfer Amount {form.cleaned_data['amount']} From {form.cleaned_data['type']} to Income", date=datetime.now(), user=self.request.user)
        transaction.save()

        admin_total_amount_obj.save()

        return super().form_valid(form)

    def get_template_names(self):
        if self.request.META.get('HTTP_REFERER'):
            return 'transaction/transfer-balance.html'
        else:
            raise Http404

    def get_form_kwargs(self):
        kw = super(TransferBalanceView, self).get_form_kwargs()
        kw['request'] = self.request  # the trick!
        return kw


class TransactionHistoryView(LoginRequiredMixin, ListView):
    models = models.TransactionHistory
    fields = ('type1', 'credit_debit', 'amount', 'old_balance',
              'new_balance', 'details', 'date', )
    template_name = 'transaction/transaction-history.html'
    context_object_name = 'data'
    paginate_by = PAGINATE_BY

    def get_queryset(self):
        return models.TransactionHistory.objects.filter(user=self.request.user).all()


class TransferBalanceHistoryView(LoginRequiredMixin, ListView):
    models = models.TransferBalanceHistory
    fields = ('amount', 'date', )
    template_name = 'transaction/transfer-balance-history.html'
    context_object_name = 'data'
    paginate_by = PAGINATE_BY

    def get_queryset(self):
        return models.TransferBalanceHistory.objects.filter(user=self.request.user).all()


class ShareBalanceHistoryView(LoginRequiredMixin, ListView):
    models = models.ShareBalanceHistory
    # fields = ('pack', 'created_at', 'updated_at', )
    template_name = 'transaction/share_balance_history.html'
    context_object_name = 'data'
    paginate_by = PAGINATE_BY

    def get_queryset(self):
        return models.ShareBalanceHistory.objects.filter(sender=self.request.user).all()


class ShareBalanceGetTitleView(LoginRequiredMixin, ListView):
    model = models.User
    # fields = ('username',)
    template_name = 'transaction/share_balance_get_title.html'
    success_url = reverse_lazy('share-balance-create-view')

    def post(self, request, *args, **kwargs):
        print(request.POST.get('username'))
        return self.get(request, *args, **kwargs)


class ShareBalanceGetUserInfo(LoginRequiredMixin, UpdateView):
    form_class = ShareBalanceGetUserInfoForm
    # template_name = 'transaction/share_balance_info.html'
    # success_url = reverse_lazy('share-balance-create-view')

    def get_form_kwargs(self):
        kw = super(ShareBalanceGetUserInfo, self).get_form_kwargs()
        kw['request'] = self.request  # the trick!
        return kw

    def get_template_names(self):
        if self.request.META.get('HTTP_REFERER'):
            return 'transaction/share_balance_info.html'
        else:
            raise Http404

    def get_queryset(self):
        return models.User.objects.filter(id=self.request.user.id)

    def form_valid(self, form):
        self.form = form
        return HttpResponseRedirect(self.get_success_url())

    def get_success_url(self):
        user = models.User.objects.get(
            username=self.form.cleaned_data['user'])
        return reverse_lazy('share-balance-create-view', kwargs={'value': user.id})

    def get_context_data(self, **kwargs):
        ctx = super(ShareBalanceGetUserInfo, self).get_context_data(**kwargs)
        user_docs = models.Documents.objects.filter(user=self.request.user)
        user_membership = models.UserMemberShip.objects.filter(
            user=self.request.user)
        if not user_docs:
            ctx['verified'] = False
        else:
            if user_docs.first().status == 'verified':
                ctx['verified'] = True
            else:
                ctx['verified'] = False
        if not user_membership:
            ctx['member'] = False
        else:
            if user_membership.first().is_expired:
                ctx['member'] = False
            else:
                ctx['member'] = True
        return ctx


class ShareBalanceCreateView(LoginRequiredMixin, CreateView):
    # model = models.UserMemberShip
    form_class = ShareBalanceForm
    # template_name = 'transaction/share_balance.html'
    success_url = reverse_lazy('share-balance-list-view')

    def form_valid(self, form):
        form.instance.sender = self.request.user
        user_obj = models.User.objects.filter(
            username=form.cleaned_data['username']).first()
        form.instance.recipient = user_obj

        if form.is_valid():
            # get model object data from form here
            user = form.save(commit=False)
            user.save()

        temp = False
        temp1 = False
        admin_tax = 0.0
        receiver_tax = 0.0
        sender_tax = 0.0
        # Receiver
        user_obj_receiver = models.User.objects.filter(
            username=form.cleaned_data['username']).first()
        if user_obj_receiver.exchanger == True:
            temp = True
        # Sender
        user_obj = models.User.objects.filter(id=self.request.user.id).first()
        if user_obj.exchanger == True:
            temp1 = True
        if temp1 and not temp:
            pass
        elif temp and temp1:
            admin_tax = 1.0
            sender_tax = 1.0
        elif temp and not temp1:
            admin_tax = 1.25
            receiver_tax = 1.25
            sender_tax = 2.5
        else:
            admin_tax = 2.5
            sender_tax = 2.5

        # updating income of receiver
        # user_obj_receiver = models.User.objects.filter(username=form.cleaned_data['username']).first()
        receiver_amount_obj = models.TotalAmounts.objects.filter(
            user=user_obj_receiver).first()
        receiver_amount_obj.income += form.cleaned_data['amount'] + (
            (form.cleaned_data['amount'] * receiver_tax)/100)
        receiver_amount_obj.save()

        # updating income of sender
        # user_obj = models.User.objects.filter(id=self.request.user.id).first()
        total_amount_obj = models.TotalAmounts.objects.filter(
            user=user_obj).first()
        old_balance = total_amount_obj.income
        total_amount_obj.income = total_amount_obj.income - \
            ((form.cleaned_data['amount'] * sender_tax) /
             100) - form.cleaned_data['amount']
        total_amount_obj.save()

        # updating income of admin adding tax
        admin_obj = models.User.objects.filter(personal_id=12345678).first()
        admin_total_amount_obj = models.TotalAmounts.objects.filter(
            user=admin_obj).first()
        admin_total_amount_obj.income += (
            form.cleaned_data['amount'] * admin_tax)/100
        admin_total_amount_obj.save()

        # saving to transaction history
        new_balance = models.TotalAmounts.objects.filter(
            user_id=self.request.user.id).first().income
        # old_balance = new_balance - form.cleaned_data['amount']
        transaction = models.TransactionHistory(type1='Share Balance', credit_debit="Debit", amount=form.cleaned_data['amount'], old_balance=old_balance, new_balance=new_balance,
                                                details=f"Share Amount {form.cleaned_data['amount']} From Income to {form.cleaned_data['username']}", date=datetime.now(), user=self.request.user)
        transaction.save()
        return super().form_valid(form)

    def get_template_names(self):
        if self.request.META.get('HTTP_REFERER'):
            return 'transaction/share_balance.html'
        else:
            raise Http404

    def get_form_kwargs(self):
        kw = super(ShareBalanceCreateView, self).get_form_kwargs()
        kw['request'] = self.request  # the trick!
        return kw

    def get_context_data(self, **kwargs):
        ctx = super(ShareBalanceCreateView, self).get_context_data(**kwargs)
        user_docs = models.Documents.objects.filter(user=self.request.user)
        user_membership = models.UserMemberShip.objects.filter(
            user=self.request.user)
        if not user_docs:
            ctx['verified'] = False
        else:
            if user_docs.first().status == 'verified':
                ctx['verified'] = True
            else:
                ctx['verified'] = False
        if not user_membership:
            ctx['member'] = False
        else:
            if user_membership.first().is_expired:
                ctx['member'] = False
            else:
                ctx['member'] = True
        return ctx


class OfficialDepositView(LoginRequiredMixin, CreateView):
    # model = models.UserMemberShip
    form_class = OfficialDepositForm
    template_name = 'transaction/official-deposit.html'
    success_url = reverse_lazy('official-deposit-history-view')
    success_message = 'Deposit Request Sent'

    def get_initial(self):
        self.initial.update({
            'admin_trc20': ADMIN_TRC20_ADDRESS
        })
        return super(OfficialDepositView, self).get_initial()

    def form_valid(self, form):
        form.instance.user = self.request.user
        amount = form.cleaned_data['amount']
        form.instance.amount = amount

        if form.is_valid():
            # get model object data from form here
            user = form.save(commit=False)
            user.save()

        return super().form_valid(form)

    def get_form_kwargs(self):
        kw = super(OfficialDepositView, self).get_form_kwargs()
        kw['request'] = self.request  # the trick!
        return kw


class OfficialWithdrawView(LoginRequiredMixin, CreateView):
    # model = models.UserMemberShip
    form_class = OfficialWithdrawForm
    template_name = 'transaction/official-withdraw.html'
    success_url = reverse_lazy('official-withdraw-history-view')
    success_message = 'Withdrawal Request Sent.'

    def form_valid(self, form):
        form.instance.user = self.request.user
        amount = form.cleaned_data['amount']
        form.instance.amount = amount
        form.instance.trc20_address = form.cleaned_data['trc20_address']

        if form.is_valid():
            # get model object data from form here
            user = form.save(commit=False)
            user.save()

        admin_obj = models.User.objects.filter(personal_id=12345678).first()
        admin_total_amount_obj = models.TotalAmounts.objects.filter(
            user=admin_obj).first()

        user_obj = models.TotalAmounts.objects.filter(
            user=self.request.user).first()
        user_obj.income = user_obj.income - (form.cleaned_data['amount'])
        user_obj.save()
        admin_total_amount_obj.income += (form.cleaned_data['amount'])
        admin_total_amount_obj.save()

        recipient_list = [admin_obj.email, ]

        message = f"A Withdrawal Request for\nTokens: {form.cleaned_data['amount']} was made by\nName: {self.request.user.full_name} with\nTRC20_Address: {form.cleaned_data['trc20_address']} at\nDate/Time: {datetime.now()}"
        try:
            send_mail("Withdraw Request", message,
                      'support@walstate.com', recipient_list)
        except:
            pass
        return super().form_valid(form)

    def get_form_kwargs(self):
        kw = super(OfficialWithdrawView, self).get_form_kwargs()
        kw['request'] = self.request  # the trick!
        return kw

    def get_context_data(self, **kwargs):
        ctx = super(OfficialWithdrawView, self).get_context_data(**kwargs)
        user_docs = models.Documents.objects.filter(user=self.request.user)
        user_membership = models.UserMemberShip.objects.filter(
            user=self.request.user)
        if not user_docs:
            ctx['verified'] = False
        else:
            if user_docs.first().status == 'verified':
                ctx['verified'] = True
            else:
                ctx['verified'] = False
        if not user_membership:
            ctx['member'] = False
        else:
            if user_membership.first().is_expired:
                ctx['member'] = False
            else:
                ctx['member'] = True
        return ctx


class OfficialWithdrawHistoryView(LoginRequiredMixin, ListView):
    models = models.OfficialWithdraw
    fields = ('amount', 'trc20_address', 'status', 'date', )
    template_name = 'transaction/official-withdraw-history.html'
    context_object_name = 'data'
    paginate_by = PAGINATE_BY

    def get_queryset(self):
        data = models.OfficialWithdraw.objects.filter(
            user=self.request.user).order_by('-date')
        return data


class OfficialDepositHistoryView(LoginRequiredMixin, ListView):
    models = models.OfficialDeposit
    fields = ('amount', 'status', 'date', )
    template_name = 'transaction/official-deposit-history.html'
    context_object_name = 'data'
    paginate_by = PAGINATE_BY

    def get_queryset(self):
        data = models.OfficialDeposit.objects.filter(
            user=self.request.user).order_by('-date')
        return data


class AskPinView(LoginRequiredMixin, BSModalUpdateView):
    form_class = AskPinForm
    template_name = 'transaction/ask_pin.html'
    success_message = 'Success: Personal ID was correct.'
    # success_url = reverse_lazy('share-balance-create-view')

    def get_queryset(self):
        return models.User.objects.filter(id=self.request.user.id)

    def form_valid(self, form):
        return super().form_valid(form)

    def get_form_kwargs(self):
        kw = super(AskPinView, self).get_form_kwargs()
        kw['request'] = self.request  # the trick!
        return kw

    def get_success_url(self):
        if self.request.META.get('HTTP_REFERER').split('walstate.com')[1] == '/transaction/share/balance/':
            # return reverse_lazy('share-balance-create-view')
            return reverse_lazy('share-balance-create-info', kwargs={'pk': self.request.user.id})
        elif self.request.META.get('HTTP_REFERER').split('walstate.com')[1] == '/transaction/transfer/balance/history/':
            return reverse_lazy('transfer-balance-view')

