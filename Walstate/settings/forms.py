from django import forms
from django.contrib.auth.hashers import check_password
from django.utils import timezone
from django.core.mail import send_mail
from core.models import User


class PasswordChangeForm(forms.ModelForm):
    old_password = forms.CharField(widget=forms.PasswordInput())
    new_password = forms.CharField(widget=forms.PasswordInput())
    confirm_new_password = forms.CharField(widget=forms.PasswordInput())

    class Meta:
        model = User
        fields = ('old_password', 'new_password', 'confirm_new_password',)

    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super(PasswordChangeForm, self).__init__(*args, **kwargs)

    def clean(self):
        cleaned_data = super(PasswordChangeForm, self).clean()
        old_pass = cleaned_data.get('old_password')
        if not self.request.user.check_password(old_pass):
            raise forms.ValidationError(
                "Old password is wrong!"
            )
        password = cleaned_data.get("new_password")
        confirm_password = cleaned_data.get("confirm_new_password")
        try:
            if len(password) < 8:
                raise forms.ValidationError(
                    "Password too short, minimum 8 letters required!"
                )
        except:
            pass
        alpha = False
        number = False
        special_character = False
        special_characters = '[.@_!#$%^&*()<>?/\|}{~:]'
        if password is not None:
            for i in password:
                if i.isalpha():
                    alpha = True
                if i.isdigit():
                    number = True
                if i in special_characters:
                    special_character = True
        # print(alpha, number, special_character)
        if number is False or alpha is False or special_character is False:
            raise forms.ValidationError(
                "Password should be alphanumeric and should contain alteast one special character!"
            )
        if password != confirm_password:
            raise forms.ValidationError(
                "Password and confirm_password does not match"
            )


class PinChangeForm(forms.ModelForm):
    old_personal_pin = forms.CharField(widget=forms.PasswordInput())
    new_personal_pin = forms.CharField(widget=forms.PasswordInput())
    confirm_new_personal_pin = forms.CharField(widget=forms.PasswordInput())

    class Meta:
        model = User
        fields = ('old_personal_pin', 'new_personal_pin', 'confirm_new_personal_pin')

    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super(PinChangeForm, self).__init__(*args, **kwargs)

    def clean(self):
        cleaned_data = super(PinChangeForm, self).clean()
        personal_pin = cleaned_data.get("new_personal_pin")
        old_pin = cleaned_data.get("old_personal_pin")
        if self.request.user.personal_pin != old_pin:
            raise forms.ValidationError(
                "Old personal pin is wrong!"
            )
        confirm_personal_pin = cleaned_data.get("confirm_new_personal_pin")
        if personal_pin != confirm_personal_pin:
            raise forms.ValidationError(
                "Personal pins do not match"
            )


# class ReferralForm(forms.ModelForm):
#     class Meta:
#         model = User
#         fields = ('personal_id', )

#     personal_id = forms.IntegerField(widget=forms.TextInput(
#         attrs={'readonly': 'readonly'}))
