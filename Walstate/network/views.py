#from anytree import Node, RenderTree
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render
from django.views.generic import ListView, UpdateView
from core import models
from WALSTATE.settings import PAGINATE_BY

from core.utils import Node
from django.http import HttpResponseRedirect
from django.urls import reverse
from .forms import ReferralForm


class DirectReferralsView(LoginRequiredMixin, ListView):
    models = models.User
    # fields = ('pack', 'created_at', 'updated_at', )
    template_name = 'network/direct_referrals.html'
    context_object_name = 'data'
    paginate_by = PAGINATE_BY

    def get_queryset(self):
        personal_id = models.User.objects.filter(id=self.request.user.id).first()
        data = models.User.objects.filter(referal_id=personal_id)
        return data


class UnilevelTreeView(LoginRequiredMixin, ListView):
    models = models.User
    # fields = ('pack', 'created_at', 'updated_at', )
    template_name = 'network/tree.html'
    context_object_name = 'data'

    def get_queryset(self):
        udo = Node(self.request.user)
        data = GenerateTree(user=self.request.user, d=udo)
        return data


def GenerateTree(user, d):
    data = models.User.objects.filter(referal_id=user)
    if data.count() == 0:
        return d
    for u in data:
        n = Node(u)
        d.add_child(n)
        d.count = d.count + 1
        GenerateTree(u, n)
    return d


class ReferralView(LoginRequiredMixin, UpdateView):
    model = models.User
    form_class = ReferralForm
    template_name = 'settings/referral.html'

    def user_passes_test(self, request):
        if request.user.is_authenticated:
            self.object = self.get_object()
            return self.object == request.user
        return False

    def dispatch(self, request, *args, **kwargs):
        if not self.user_passes_test(request):
            return HttpResponseRedirect(reverse("show-referral", kwargs={'pk': self.request.user.id}))

        return super(ReferralView, self).dispatch(
            request, *args, **kwargs)
