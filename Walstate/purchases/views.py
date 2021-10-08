from django.shortcuts import render
from django.views.generic import CreateView, ListView, UpdateView, RedirectView
from .forms import MemberShipForm, MasterPackForm, PackRefundForm
from core import models
from django.urls import reverse_lazy
import random, string
from django.contrib.auth.mixins import LoginRequiredMixin
from WALSTATE.settings import PAGINATE_BY
import os
from datetime import datetime, date
from bootstrap_modal_forms.generic import BSModalCreateView, BSModalUpdateView


class MemberShipHistoryView(LoginRequiredMixin, ListView):
    models = models.UserMemberShip
    fields = ('membership', 'created_at', 'updated_at',)
    template_name = 'purchases/home.html'
    context_object_name = 'data'
    paginate_by = PAGINATE_BY

    def get_queryset(self):
        return models.UserMemberShip.objects.filter(user=self.request.user).all()


class MemberShipPurchase(LoginRequiredMixin, CreateView):
    model = models.UserMemberShip
    form_class = MemberShipForm
    template_name = 'purchases/membership.html'
    success_url = reverse_lazy('membership-purchase')
    success_message = 'Membership Purchased Successfully.'

    def form_valid(self, form):
        form.instance.user = self.request.user
        # print(self.request.user)
        if form.is_valid():
            # get model object data from form here
            user = form.save(commit=False)
            user.save()
        
        return super().form_valid(form)

    def get_form_kwargs(self):
        kw = super(MemberShipPurchase, self).get_form_kwargs()
        kw['request'] = self.request  # the trick!
        return kw

    def get_context_data(self, **kwargs):
        user = models.UserMemberShip.objects.filter(user_id=self.request.user)
        if user:
            if user.first().is_expired:
                kwargs['status'] = False
            else:
                kwargs['status'] = True
                kwargs['membership'] = models.UserMemberShip.objects.filter(user=self.request.user).first()
        else:
            kwargs['status'] = False
        return super(MemberShipPurchase, self).get_context_data(**kwargs)

class PackHistoryView(LoginRequiredMixin, ListView):
    models = models.UserPack
    fields = ('pack', 'created_at', 'updated_at',)
    template_name = 'purchases/pack.html'
    context_object_name = 'data'
    paginate_by = PAGINATE_BY

    def get_queryset(self):
        return models.UserPack.objects.filter(user=self.request.user).all().order_by('id')

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(**kwargs)
        lst = []
        dct = dict()
        lst.append(dct)
        for i in context['data']:
            a = str(date.today() - i.created_at.date())
            a = a.split(',')[0].split(' ')[0]
            try:
                if float(a) < 182.5:
                    lst[0][i.id] = 0
                else:
                    lst[0][i.id] = 1
            except:
                lst[0][i.id] = 0
        context['lst'] = lst
        # print(context)
        return context


class PackRefundView(LoginRequiredMixin, BSModalUpdateView):
    form_class = PackRefundForm
    template_name = 'purchases/refund_pack.html'
    success_message = 'Success: Pack was refunded.'
    success_url = reverse_lazy('pack-list-view')

    def get_queryset(self):
        id = self.request.get_full_path().split('/')[-2]
        # print(id)
        return models.UserPack.objects.filter(id=id)

    def form_valid(self, form):
        if self.request.is_ajax():
            amount = form.instance.pack.amount * form.instance.quantity
            if int(str(date.today() - form.instance.created_at.date()).split(',')[0].split(' ')[0]) > 273.75:
                refunded_amount = amount - amount * 0.1
                tax = amount * 0.1
                print(refunded_amount, tax, 2)
            else:
                refunded_amount = amount - amount * 0.3
                tax = amount * 0.3
                print(refunded_amount, tax, 1, form.instance.pack.amount * form.instance.quantity)
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
        form.instance.ended_at = datetime.now()
        # print(form.instance.status)
        # print(form.instance.quantity)
        # print(form.instance.pack.amount)
        # print(str(date.today() - form.instance.created_at.date()).split(',')[0].split(' ')[0])


        return super().form_valid(form)

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(**kwargs)
        # print(context['userpack'].created_at)
        a = str(date.today() - context['userpack'].created_at.date())
        a = a.split(',')[0].split(' ')[0]
        # print(a)
        if float(a) > 182.5:
            context['days'] = '6 months'
            context['tax'] = '30%'
        else:
            context['days'] = '9 months'
            context['tax'] = '10%'
        # print(context)
        return context


class PackPurchaseView(LoginRequiredMixin, CreateView):
    # model = models.UserMemberShip
    form_class = MasterPackForm
    template_name = 'purchases/add_pack.html'
    success_url = reverse_lazy('pack-list-view')
    success_message = 'Pack Purchased Successfully'

    def form_valid(self, form):
        form.instance.user = self.request.user
        pack = models.Pack.objects.filter(name=form.instance.pack.name).first()

        year = int(str(datetime.now())[0:4])
        month = int(str(datetime.now())[5:7])
        day = int(str(datetime.now())[8:10])
        i = int(pack.duration)
        while i > 0:
            if month <= 12:
                month += 1
                if month == 13:
                    month = 1
                    year += 1
            # print(i, month)
            i -= 1
        date = (str(year) + '-' + '0' + str(month) + '-' + str(day))
        # form.instance.ended_at = date
        total = form.cleaned_data['quantity'] * form.instance.pack.amount
        admin_obj = models.User.objects.filter(personal_id=12345678).first()
        admin_total_amount_obj = models.TotalAmounts.objects.filter(user=admin_obj).first()
        d = GenerateTree(req=self.request.user, user=self.request.user, level=0, count=0, admin=admin_total_amount_obj, amount=total)
        if form.is_valid():
            # get model object data from form here
            user = form.save(commit=False)
            user.save()
        total_amount_object = models.TotalAmounts.objects.get(user=self.request.user)
        total_amount_object.master_pack += float(form.cleaned_data['quantity'])
        total_amount_object.save()
        return super().form_valid(form)

    def get_form_kwargs(self):
        kw = super(PackPurchaseView, self).get_form_kwargs()
        kw['request'] = self.request  # the trick!
        return kw


def GenerateTree(req, user, level, count, admin, amount):
    level += 1
    u = user.referal_id
    if not u or u.personal_id == 12345678:
        return user
    if level >= 2:
        count += 1
        if count > 5:
            return user
        else:
            # amount = 0
            # userpack = models.UserPack.objects.filter(user=u)
            # for item in userpack.iterator():
            #     amount += (item.pack.amount * item.quantity)
            #     print(item)
            profit = amount * 0.0025
            user_obj = models.TotalAmounts.objects.filter(user=u).first()
            old_balance = user_obj.team_earning
            user_obj.team_earning += profit
            new_balance = user_obj.team_earning
            user_obj.save()
            transaction = models.TransactionHistory(type1='Pack Purchase Commission', credit_debit="Credit",
                                                    amount=profit, old_balance=old_balance,
                                                    new_balance=new_balance,
                                                    details=f"Retrieved Commission amount {profit} through Indirect Referral in team_earning {req}",
                                                    date=datetime.now(), user=user_obj.user)
            transaction.save()
            admin.team_earning -= profit
            admin.save()

    else:
        # amount = 0
        # userpack = models.UserPack.objects.filter(user=u)
        # for item in userpack.iterator():
        #     amount += (item.pack.amount * item.quantity)
        #     print(item)
        profit = amount * 0.08
        user_obj = models.TotalAmounts.objects.filter(user=u).first()
        old_balance = user_obj.team_earning
        user_obj.team_earning += profit
        new_balance = user_obj.team_earning
        user_obj.save()
        transaction = models.TransactionHistory(type1='Pack Purchase Commission', credit_debit="Credit",
                                                amount=profit, old_balance=old_balance,
                                                new_balance=new_balance,
                                                details=f"Retrieved Commission amount {profit} through Direct Referral in team_earning {req}",
                                                date=datetime.now(), user=user_obj.user)
        transaction.save()
        admin.team_earning -= profit
        admin.save()
    GenerateTree(req, u, level, count, admin, amount)
    return user
