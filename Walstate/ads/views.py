import json
from datetime import datetime

from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render
from django.views.generic import ListView
from core import models
from django.urls import reverse_lazy
import random, string
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic.base import View

from WALSTATE.settings import PAGINATE_BY


class ShowAdsView(LoginRequiredMixin, ListView):
    models = models.Ads
    fields = ('title', 'video', 'duration', 'created_at', )
    template_name = 'ads/view-ads.html'
    context_object_name = 'data'
    paginate_by = PAGINATE_BY

    def get_queryset(self):
        data = models.Ads.objects.all().order_by('-created_at')
        return data


class AdStatusUpdateView(LoginRequiredMixin, View):
    def post(self, request):
        data = request.body
        ad = json.loads(data)
        ad = ad['ad']
        ads = models.Ads.objects.filter(id=ad).first()
        ua = models.UserAdsView.objects.filter(user=request.user, ads=ads, viewed=True)
        if ua:
            return HttpResponse("Already Viewed")
        else:
            user_ad = models.UserAdsView(viewed=True, user=request.user, ads=ads)
            user_ad.save()
            # total_ads = models.Ads.objects.all().count()
            # current_user_ads = models.UserAdsView.objects.filter(user=request.user, viewed=True).count()
            # if total_ads == current_user_ads:
            #     amount = 0
            #     userpack = models.UserPack.objects.filter(user=request.user)
            #     for item in userpack.iterator():
            #         amount += (item.pack.amount * item.quantity)
            #         print(item)
            #     profit = amount * 0.00235
            #     user_obj = models.TotalAmounts.objects.filter(user=request.user).first()
            #     old_balance = user_obj.income
            #     user_obj.income += profit
            #     new_balance = user_obj.income
            #     user_obj.save()
            #     transaction = models.TransactionHistory(type1="Ad Commission", credit_debit="Credit",
            #                                             amount=profit, old_balance=old_balance,
            #                                             new_balance=new_balance,
            #                                             details=f"Ad Commission of {profit} added to Income",
            #                                             date=datetime.now(), user=self.request.user)
            #     transaction.save()
            #     admin_obj = models.User.objects.filter(personal_id=12345678).first()
            #     admin_total_amount_obj = models.TotalAmounts.objects.filter(
            #         user=admin_obj).first()
            #     admin_total_amount_obj.income -= profit
            #     admin_total_amount_obj.save()
            return HttpResponse("Successfully Added to Viewed")


class ViewedAdsView(LoginRequiredMixin, ListView):
    models = models.UserAdsView
    fields = ('ads', )
    template_name = 'ads/viewed-ads.html'
    context_object_name = 'data'
    paginate_by = PAGINATE_BY

    def get_queryset(self):
        data = models.UserAdsView.objects.filter(user=self.request.user, viewed=True)
        return data
