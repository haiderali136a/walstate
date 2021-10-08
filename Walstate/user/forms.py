from django import forms
from django.contrib.auth.hashers import check_password
from django.utils import timezone
from django.core.mail import send_mail
from core.models import User, UserPin, Documents

from core.utils import GENDERS


class UserSignupForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput())
    confirm_password = forms.CharField(widget=forms.PasswordInput())
    personal_pin = forms.CharField(widget=forms.PasswordInput())
    confirm_personal_pin = forms.CharField(widget=forms.PasswordInput())
    referal = forms.IntegerField(label="Referral")
    date_of_birth = forms.DateTimeField(widget=forms.TextInput(
        attrs={'type': 'date'}
    ))
    gender = forms.ChoiceField(choices=GENDERS)

    class Meta:
        model = User
        fields = ('referal', 'full_name', 'username', 'email', 'phone_number', 'gender', 'date_of_birth', 'address',
                  'postal_code', 'state', 'country', 'password', 'personal_pin')

    def clean(self):
        cleaned_data = super(UserSignupForm, self).clean()
        password = cleaned_data.get("password")
        confirm_password = cleaned_data.get("confirm_password")
        personal_pin = cleaned_data.get("personal_pin")
        confirm_personal_pin = cleaned_data.get("confirm_personal_pin")
        if "referal" not in cleaned_data.keys():
            raise forms.ValidationError(
                {"referal": ""}
            )

        obj = User.objects.filter(personal_id=cleaned_data['referal']).first()
        if not obj:
            raise forms.ValidationError(
                "Invalid Referral Id"
            )

        try:
            if len(password) < 8:
                raise forms.ValidationError(
                    "Password too short, minimum 8 letters required!"
                )
        except:
            pass
        try:
            if len(personal_pin) < 8:
                raise forms.ValidationError(
                    "Pin too short, minimum 8 letters required!"
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
        print(cleaned_data.get("referal"))
        referal_id = User.objects.filter(
            personal_id=cleaned_data.get("referal")).count()
        print(referal_id)
        if referal_id != 1:
            raise forms.ValidationError(
                'Invalid Referal ID.'
            )
        if password != confirm_password:
            raise forms.ValidationError(
                "Password and confirm_password does not match"
            )

        if personal_pin != confirm_personal_pin:
            raise forms.ValidationError(
                "Pins do not match"
            )


class EditUserProfileForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['full_name', 'username', 'email', 'phone_number', 'gender', 'date_of_birth', 'address', 'postal_code',
                  'state', 'country', 'image', ]

    gender = forms.CharField(widget=forms.TextInput(
        attrs={'readonly': 'readonly'}))
    date_of_birth = forms.CharField(
        widget=forms.TextInput(attrs={'readonly': 'readonly'}))


class ViewReferralForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['personal_id', ]

    personal_id = forms.CharField(widget=forms.TextInput(
        attrs={'readonly': 'readonly'}))


class DocumentUploadForm(forms.ModelForm):
    class Meta:
        model = Documents
        fields = ['id_doc', 'bill_doc', ]

    id_doc = forms.FileField(
        label='Choose File',
        help_text='CNIC/Passport/Driving License',
        required=False
    )

    bill_doc = forms.FileField(
        label='Choose File',
        help_text='Recent Bank or Utility Bill Document',
        required=False
    )


class BecomeExchangerForm(forms.ModelForm):
    pin = forms.CharField()

    class Meta:
        model = User
        fields = ('pin',)

    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super(BecomeExchangerForm, self).__init__(*args, **kwargs)

    def clean(self):
        cleaned_data = super(BecomeExchangerForm, self).clean()
        pin_obj = UserPin.objects.filter(
            pin=cleaned_data.get("pin")).first()
        if cleaned_data.get('pin') == None:
            raise forms.ValidationError(
                {"pin": ["", ]}
            )
        if pin_obj:
            if pin_obj.status == 'used':
                raise forms.ValidationError(
                    {"pin": ["Pin was already used!", ]}
                )
            if pin_obj.status == 'refunded':
                raise forms.ValidationError(
                    {"pin": ["Pin was refunded!", ]}
                )
        pins = UserPin.objects.filter(user=self.request.user.id)
        # print(pins)
        temp = 0
        for i in pins:
            # print(type(cleaned_data.get('pin')),type(i.pin), i.amount)
            if cleaned_data.get('pin') == str(i.pin) and i.amount == 100:
                # print(1111111)
                temp = 1
        # print(temp)
        if temp != 1:
            raise forms.ValidationError(
                {"pin": ["Pin shoulf be of 100 tokens!", ]}
            )
        pin_obj.status = 'used'
        pin_obj.save()
