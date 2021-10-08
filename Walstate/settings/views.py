from django import forms
from django.shortcuts import render
from django.views.generic import CreateView, ListView, UpdateView, RedirectView
from .forms import PasswordChangeForm, PinChangeForm
from core import models
from django.urls import reverse_lazy
import random
import string
from django.contrib.auth.mixins import LoginRequiredMixin

from core.models import User
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.http import Http404


class PasswordChangeView(LoginRequiredMixin, UpdateView):
    model = models.User
    form_class = PasswordChangeForm
    template_name = 'settings/password_change.html'
    success_url = reverse_lazy('dashboard')
    success_message = 'Password Updated Successfully.'

    def form_valid(self, form):
        if form.is_valid():
            # get model object data from form here
            user = form.save(commit=False)

            # Cleaned(normalized) data
            password = form.cleaned_data['new_password']

            #  Use set_password here
            user.set_password(password)
            user.save()

        return super().form_valid(form)

    def get_form_kwargs(self):
        kw = super(PasswordChangeView, self).get_form_kwargs()
        kw['request'] = self.request  # the trick!
        return kw

    def user_passes_test(self, request):
        if request.user.is_authenticated:
            self.object = self.get_object()
            return self.object == request.user
        return False

    def dispatch(self, request, *args, **kwargs):
        if not self.user_passes_test(request):
            return HttpResponseRedirect(reverse("change-password", kwargs={'pk': self.request.user.id}))

        return super(PasswordChangeView, self).dispatch(
            request, *args, **kwargs)


class PinChangeView(LoginRequiredMixin, UpdateView):
    model = models.User
    form_class = PinChangeForm
    template_name = 'settings/change_pin.html'
    success_url = reverse_lazy('dashboard')
    success_message = 'Personal Pin Updated Successfully.'

    def form_valid(self, form):
        if form.is_valid():
            # get model object data from form here
            user = form.save(commit=False)
            user.save()

        return super().form_valid(form)

    def get_form_kwargs(self):
        kw = super(PinChangeView, self).get_form_kwargs()
        kw['request'] = self.request  # the trick!
        return kw

    def user_passes_test(self, request):
        if request.user.is_authenticated:
            self.object = self.get_object()
            return self.object == request.user
        return False

    def dispatch(self, request, *args, **kwargs):
        if not self.user_passes_test(request):
            return HttpResponseRedirect(reverse("change-pin", kwargs={'pk': self.request.user.id}))

        return super(PinChangeView, self).dispatch(
            request, *args, **kwargs)


# class ReferralView(LoginRequiredMixin, UpdateView):
#     model = models.User
#     form_class = ReferralForm
#     template_name = 'settings/referral.html'
#     success_url = reverse_lazy('dashboard')

#     def user_passes_test(self, request):
#         if request.user.is_authenticated:
#             self.object = self.get_object()
#             return self.object == request.user
#         return False

#     def dispatch(self, request, *args, **kwargs):
#         if not self.user_passes_test(request):
#             return HttpResponseRedirect(reverse("show-referral", kwargs={'pk': self.request.user.id}))

#         return super(ReferralView, self).dispatch(
#             request, *args, **kwargs)
