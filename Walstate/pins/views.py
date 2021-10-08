from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic import CreateView, ListView

from core import models
from pins.forms import UserPinCreationForm, PinRefundForm
from core.models import UserPin
from pins.utils import random_generator

from WALSTATE.settings import PAGINATE_BY
from datetime import datetime
from bootstrap_modal_forms.generic import BSModalCreateView, BSModalUpdateView


class PinHistoryView(LoginRequiredMixin, ListView):
    models = models.UserPin
    # fields = ('pin', 'amount', 'created_at', 'refund_date',)
    template_name = 'pins/history.html'
    context_object_name = 'data'
    paginate_by = PAGINATE_BY

    def get_queryset(self):
        return models.UserPin.objects.filter(user=self.request.user).all().order_by('-created_at')


class PinCreationView(LoginRequiredMixin, CreateView):
    model = models.UserPin
    form_class = UserPinCreationForm
    template_name = 'pins/pins.html'
    success_url = reverse_lazy('pin-history')
    success_message = 'Pin Created Successfully'

    def form_valid(self, form):
        x = random_generator(size=30)
        exists = UserPin.objects.filter(pin=x).count()
        while exists > 0:
            x = random_generator(size=30)
            exists = UserPin.objects.filter(pin=x).count()
        form.instance.pin = x
        form.instance.user_id = self.request.user.id

        if form.is_valid():
            # get model object data from form here
            userpin = form.save(commit=False)
            userpin.save()
        user_obj = models.TotalAmounts.objects.filter(
            user=self.request.user).first()
        user_obj.income -= form.cleaned_data['amount']
        user_obj.income -= form.cleaned_data['amount']*0.0025
        user_obj.save()
        admin_obj = models.User.objects.filter(personal_id=12345678).first()
        admin_user_obj = models.TotalAmounts.objects.filter(
            user=admin_obj).first()
        admin_user_obj.income += form.cleaned_data['amount']*0.0025
        admin_user_obj.save()

        new_balance = models.TotalAmounts.objects.filter(
            user_id=self.request.user.id).first().income
        old_balance = new_balance + \
            form.cleaned_data['amount'] + form.cleaned_data['amount']*0.0025
        transaction = models.TransactionHistory(type1='Create Pin', credit_debit="Debit", amount=(form.cleaned_data['amount'] + form.cleaned_data['amount']*0.0025), old_balance=old_balance, new_balance=new_balance,
                                                details=f"Pin was created of amount {form.cleaned_data['amount']} From Income. Tax: {form.cleaned_data['amount']*0.0025}   ", date=datetime.now(), user=self.request.user)
        transaction.save()

        return super().form_valid(form)

    def get_form_kwargs(self):
        kw = super(PinCreationView, self).get_form_kwargs()
        kw['request'] = self.request  # the trick!
        return kw


class PinRefundView(LoginRequiredMixin, BSModalUpdateView):
    form_class = PinRefundForm
    template_name = 'pins/refund.html'
    success_message = 'Success: Pin was refunded.'
    success_url = reverse_lazy('pin-history')

    def get_queryset(self):
        id = self.request.get_full_path().split('/')[-2]
        # print(id)
        return models.UserPin.objects.filter(id=id)

    def form_valid(self, form):
        if self.request.is_ajax():
            # print(11, UserPin.objects.filter(
            #     id=self.request.path.split('/')[-2]).first().status)
            refunded_amount = form.cleaned_data['amount'] - \
                form.cleaned_data['amount']*0.0025
            tax = form.cleaned_data['amount']*0.0025
            amount_obj = models.TotalAmounts.objects.filter(
                user=self.request.user).first()
            amount_obj.income = amount_obj.income + refunded_amount
            amount_obj.save()
            admin_obj = models.User.objects.filter(
                personal_id=12345678).first()
            admin_amount_obj = models.TotalAmounts.objects.filter(
                user=admin_obj).first()
            admin_amount_obj.income = admin_amount_obj.income + tax
            admin_amount_obj.save()

        form.instance.status = 'Refunded'
        form.instance.refund_date = datetime.now()

        return super().form_valid(form)
