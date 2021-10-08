from bootstrap_modal_forms.forms import BSModalModelForm
from django import forms
from django.contrib.auth.hashers import check_password
from django.utils import timezone
from django.core.mail import send_mail
from core import models
from core.models import UserPin


class UserPinCreationForm(forms.ModelForm):

    class Meta:
        model = models.UserPin
        fields = ('amount', )

    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super(UserPinCreationForm, self).__init__(*args, **kwargs)

    def clean(self):
        cleaned_data = super(UserPinCreationForm, self).clean()
        amount = cleaned_data.get("amount")
        user = models.TotalAmounts.objects.filter(
            user=self.request.user.id).first()

        if amount is None:
            raise forms.ValidationError(
                {"amount": ['', ]}
            )

        if user.income < (amount + (0.0025 * amount)):
            raise forms.ValidationError(
                {"amount": ['Insufficient Balance.', ]}
            )
        if amount < 1 or amount > 1000:
            raise forms.ValidationError(
                {"amount": ["Amount must be between 1-1000.", ]}
            )


class PinRefundForm(BSModalModelForm):
    class Meta:
        model = UserPin
        fields = ['amount', ]

    def __init__(self, *args, **kwargs):
        super(PinRefundForm, self).__init__(*args, **kwargs)
        instance = getattr(self, 'instance', None)
        if instance and instance.pk:
            self.fields['amount'].widget.attrs['readonly'] = True
