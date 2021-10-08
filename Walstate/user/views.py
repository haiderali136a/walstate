from django import forms
from django.shortcuts import render
from django.views.generic import CreateView, ListView, UpdateView, RedirectView
from .forms import UserSignupForm, EditUserProfileForm, GENDERS, DocumentUploadForm, BecomeExchangerForm, \
    ViewReferralForm
from core import models
from django.urls import reverse_lazy
import random
import string
from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.mail import send_mail
from django.contrib.auth.views import redirect_to_login
from django.http import HttpResponseRedirect
from django.urls import reverse


# Create your views here.
from core.models import User

from core.models import Role

from core.models import Documents


class SignUpView(CreateView):
    model = models.User
    form_class = UserSignupForm
    template_name = 'user/signup.html'
    success_url = reverse_lazy('login')

    def get_initial(self):
        return {
            'referal': 69095981,
        }

    def form_valid(self, form):
        # role = Role.objects.filter(name='User').first()
        form.instance.role = models.Role(1)
        # print(form.cleaned_data['referal'])
        obj = User.objects.filter(
            personal_id=form.cleaned_data['referal']).first()
        form.instance.referal_id = models.User(obj.id)
        x = ''.join(random.choices(string.digits, k=9))
        exists = models.UserPin.objects.filter(pin=x).count()
        while exists > 0:
            x = ''.join(random.choices(string.digits, k=9))
            exists = models.UserPin.objects.filter(pin=x).count()
        form.instance.personal_id = x

        if form.is_valid():
            # get model object data from form here
            user = form.save(commit=False)

            # Cleaned(normalized) data
            username = form.cleaned_data['username'].lower()
            password = form.cleaned_data['password']

            #  Use set_password here
            user.set_password(password)
            user.save()
            total_amount_obj = models.TotalAmounts.objects.get_or_create(user=models.User(
                user.id), salary=0.0, income=0.0, team_earning=0.0, master_pack=0.0)

            sales_obj = models.UserSalesData.objects.filter(
                user=user.referal_id)
            if sales_obj:
                if sales_obj.count() < 3:
                    sales = models.UserSalesData.objects.get_or_create(user=user.referal_id, referral=user,
                                                                       total_sales=0)
            else:
                sales = models.UserSalesData.objects.get_or_create(user=user.referal_id, referral=user,
                                                                   total_sales=0)

        send_mail('Welcome to Walstate',
                  f'Dear {form.cleaned_data.get("full_name")}\n\nYou have successfully registered your account with username {form.cleaned_data.get("username")}\n\nWalstate.',
                  'support@walstate.com',
                  [form.cleaned_data.get("email")],
                  fail_silently=False)

        return super().form_valid(form)


class EditProfileView(LoginRequiredMixin, UpdateView):
    model = models.User
    form_class = EditUserProfileForm
    template_name = 'user/edit.html'
    success_message = 'Success: Profile Updated Successfully.'

    def user_passes_test(self, request):
        if request.user.is_authenticated:
            self.object = self.get_object()
            return self.object == request.user
        return False

    def dispatch(self, request, *args, **kwargs):
        if not self.user_passes_test(request):
            return HttpResponseRedirect(reverse("edit-user", kwargs={'pk': self.request.user.id}))

        return super(EditProfileView, self).dispatch(
            request, *args, **kwargs)

    def get_success_url(self):
        return reverse_lazy("edit-user", kwargs={'pk': self.request.path.split('/')[-2]})


class ShowReferralView(LoginRequiredMixin, UpdateView):
    model = models.User
    form_class = ViewReferralForm
    template_name = 'user/referral.html'
    success_url = reverse_lazy('dashboard')


class DocumentUploadView(LoginRequiredMixin, CreateView):
    model = models.Documents
    form_class = DocumentUploadForm
    template_name = 'user/upload_docs.html'
    success_url = reverse_lazy('upload-docs')

    def form_valid(self, form):
        form.instance.type = 'all'
        form.instance.user = self.request.user
        form.instance.status = 'pending'

        if form.is_valid():
            user = Documents.objects.filter(user=self.request.user)
            if user:
                user.delete()
            # get model object data from form here
            document = form.save(commit=False)
            document.save()

        return super().form_valid(form)

    def get_context_data(self, **kwargs):
        user = Documents.objects.filter(user_id=self.request.user)
        if user:
            kwargs['status'] = user.first().status
        else:
            kwargs['status'] = 'not_submitted'
        return super(DocumentUploadView, self).get_context_data(**kwargs)


class BecomeExchangerView(LoginRequiredMixin, UpdateView):
    model = models.User
    form_class = BecomeExchangerForm
    template_name = 'user/exchanger.html'
    # success_url = reverse_lazy('dashboard')
    success_message = 'Congratulations! You are now Exchanger.'

    def form_valid(self, form):
        if form.is_valid():
            # get model object data from form here
            user = form.save(commit=False)
            user.exchanger = True
            user.save()

        return super().form_valid(form)

    def user_passes_test(self, request):
        if request.user.is_authenticated:
            self.object = self.get_object()
            return self.object == request.user
        return False

    def get_form_kwargs(self):
        kw = super(BecomeExchangerView, self).get_form_kwargs()
        kw['request'] = self.request  # the trick!
        return kw

    def dispatch(self, request, *args, **kwargs):
        if not self.user_passes_test(request):
            return HttpResponseRedirect(reverse("exchanger", kwargs={'pk': self.request.user.id}))

        return super(BecomeExchangerView, self).dispatch(
            request, *args, **kwargs)

    def get_success_url(self):
        return reverse_lazy("exchanger", kwargs={'pk': self.request.path.split('/')[-2]})
