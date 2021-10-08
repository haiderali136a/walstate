from django import forms
from django.contrib.auth.hashers import check_password
from django.utils import timezone
from django.core.mail import send_mail
from core.models import User


class ReferralForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('personal_id', )

    personal_id = forms.IntegerField(label="Personal Referral ID", widget=forms.TextInput(
        attrs={'readonly': 'readonly'}))