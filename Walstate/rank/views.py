from datetime import datetime
from django.shortcuts import render
from django.views.generic import CreateView, ListView, UpdateView, RedirectView
from core import models
from django.urls import reverse_lazy
import random
import string
from django.contrib.auth.mixins import LoginRequiredMixin
from WALSTATE.settings import PAGINATE_BY


class RankDetailsView(LoginRequiredMixin, ListView):
    models = models.UserSalesData
    fields = ('referral', 'total_sales', )
    template_name = 'rank/rank-details.html'
    context_object_name = 'data'

    def get_queryset(self):
        data = models.UserSalesData.objects.filter(user=self.request.user)
        return data

    def get_context_data(self, **kwargs):
        ctx = super(RankDetailsView, self).get_context_data(**kwargs)
        user_sales = models.UserSalesData.objects.filter(user=self.request.user)
        if user_sales.count() < 3:
            ctx['rank'] = False
        else:
            ctx['rank'] = True
            user_rank = self.request.user.rank
            if user_rank:
                ctx['rank_title'] = user_rank.title
                if user_rank.id >= 5:
                    ctx['next_rank'] = ''
                    ctx['required_sales'] = 0
                    ctx['rewards'] = 0
                    ctx['salary'] = 0
                else:
                    r = models.Rank.objects.filter(id=user_rank.id+1).first()
                    ctx['next_rank'] = r.title
                    ctx['required_sales'] = r.required_sales
                    ctx['rewards'] = r.rewards
                    ctx['salary'] = r.salary
            else:
                ctx['rank_title'] = 'No Rank'
                ctx['current_salary'] = 0
                ctx['required_sales'] = models.Rank(1).required_sales
                ctx['rewards'] = models.Rank(1).rewards
                ctx['salary'] = models.Rank(1).salary
                ctx['next_rank'] = models.Rank(1).title
        return ctx


class AllRanksView(LoginRequiredMixin, ListView):
    models = models.Rank
    fields = ('title', 'badge', )
    template_name = 'rank/all-ranks.html'
    context_object_name = 'data'

    def get_queryset(self):
        data = models.Rank.objects.all().order_by('id')
        return data

    def get_context_data(self, **kwargs):
        ctx = super(AllRanksView, self).get_context_data(**kwargs)
        user_rank = self.request.user.rank
        ctx['user_rank'] = user_rank
        return ctx