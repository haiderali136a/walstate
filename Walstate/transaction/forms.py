from django import forms
from core import models

from core.utils import TRANSFER_BALANCE_CHOICES
from django.contrib.auth.hashers import check_password
from django.utils import timezone
from django.core.mail import send_mail
from bootstrap_modal_forms.forms import BSModalModelForm


class TransferBalanceForm(forms.ModelForm):
    type = forms.ChoiceField(choices=TRANSFER_BALANCE_CHOICES)

    class Meta:
        model = models.TransferBalanceHistory
        fields = ('amount', )

    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super(TransferBalanceForm, self).__init__(*args, **kwargs)

    def clean(self):
        cleaned_data = super(TransferBalanceForm, self).clean()
        if cleaned_data['type'] == 'team_earning':
            user_amount = models.TotalAmounts.objects.filter(
                user=self.request.user).first().team_earning
            if user_amount == 0:
                raise forms.ValidationError(
                    'No team earnings available'
                )
            elif (user_amount - ((user_amount * 0.025) + cleaned_data.get("amount"))) < 1:
                raise forms.ValidationError(
                    'At least one token must remain in team earnings.'
                )
        elif cleaned_data['type'] == 'salary':
            user_amount = models.TotalAmounts.objects.filter(
                user=self.request.user).first().salary
            if user_amount == 0:
                raise forms.ValidationError(
                    'No salary available'
                )
            elif (user_amount - ((user_amount * 0.05) + cleaned_data.get("amount"))) < 1:
                raise forms.ValidationError(
                    'At least one token must remain in salary.'
                )
        else:
            raise forms.ValidationError(
                'Please select a balance transfer choice.'
            )


class ShareBalanceGetUserInfoForm(forms.ModelForm):
    user = forms.CharField(label='Username')

    class Meta:
        model = models.ShareBalanceHistory
        fields = ('user',)

    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super(ShareBalanceGetUserInfoForm, self).__init__(*args, **kwargs)

    def clean(self):
        cleaned_data = super(ShareBalanceGetUserInfoForm, self).clean()
        # print(1111, self.request.user)
        if not cleaned_data.get("user"):
            raise forms.ValidationError(
                {'user': [], }
            )
        try:
            user = models.User.objects.get(
                username=cleaned_data.get('user'))
        except:
            user = 'not found'
        if user not in models.User.objects.exclude(id=self.request.user.id):
            raise forms.ValidationError(
                {'user': ['Enter Valid username.'], }
            )


class ShareBalanceForm(forms.ModelForm):
    username = forms.CharField()
    name = forms.CharField(label='Name')
    account_number = forms.IntegerField(label='Account No.')
    exchanger = forms.CharField(label='Exchanger')
    confirm_amount = forms.FloatField(label='Confirm Amount')

    class Meta:
        model = models.ShareBalanceHistory
        fields = ('account_number', 'exchanger', 'name',
                  'username', 'amount', 'confirm_amount')

    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super(ShareBalanceForm, self).__init__(*args, **kwargs)
        user_id = self.request.path.split('P')[1].split('\\')[0]
        receiver = models.User.objects.get(id=user_id)
        self.fields['name'].widget.attrs['value'] = receiver.full_name
        self.fields['username'].widget.attrs['value'] = receiver.username
        self.fields['account_number'].widget.attrs['value'] = receiver.personal_id
        if receiver.exchanger:
            self.fields['exchanger'].widget.attrs['value'] = 'True'
        else:
            self.fields['exchanger'].widget.attrs['value'] = 'False'
        self.fields['name'].widget.attrs['readonly'] = True
        self.fields['account_number'].widget.attrs['readonly'] = True
        self.fields['username'].widget.attrs['readonly'] = True
        self.fields['exchanger'].widget.attrs['readonly'] = True

    def clean(self):
        cleaned_data = super(ShareBalanceForm, self).clean()
        # print(1111,self.request.user)
        if not cleaned_data.get("amount"):
            raise forms.ValidationError(
                {'amount': [], }
            )
        if not cleaned_data.get("confirm_amount"):
            raise forms.ValidationError(
                {'confirm_amount': [], }
            )
        if cleaned_data.get("confirm_amount") != cleaned_data.get("amount"):
            raise forms.ValidationError(
                {'confirm_amount': [
                    'Amount and confirm amount should be same!'], }
            )
        # if not cleaned_data.get("username"):
        #     raise forms.ValidationError(
        #         {'username': [], }
        #     )
        amount = models.TotalAmounts.objects.filter(
            user=self.request.user.id).first()
        required_income = ((cleaned_data.get("amount") * 2.5) /
                           100) + cleaned_data.get("amount")
        # print(12211221,required_income)
        if required_income > amount.income:
            raise forms.ValidationError(
                'Insufficient Income Balance.'
            )
        if cleaned_data.get("amount") < 5:
            raise forms.ValidationError(
                'Invalid amount. Minimum 5 tokens allowed.'
            )
        if not models.User.objects.filter(username=cleaned_data.get("username")).first():
            raise forms.ValidationError(
                'Enter valid username/parent ID.'
            )


class OfficialDepositForm(forms.ModelForm):
    admin_trc20 = forms.CharField(max_length=255)

    class Meta:
        model = models.OfficialDeposit
        fields = ('amount', 'screenshot', )

    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super(OfficialDepositForm, self).__init__(*args, **kwargs)
        self.fields['admin_trc20'].disabled = True

    def clean(self):
        cleaned_data = super(OfficialDepositForm, self).clean()
        amount = cleaned_data['amount']
        if amount < 0:
            raise forms.ValidationError(
                'Invalid Amount'
            )
        if amount < 100:
            raise forms.ValidationError(
                'Amount must be at least 100'
            )


class OfficialWithdrawForm(forms.ModelForm):
    class Meta:
        model = models.OfficialWithdraw
        fields = ('amount', 'trc20_address', )

    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super(OfficialWithdrawForm, self).__init__(*args, **kwargs)

    def clean(self):
        cleaned_data = super(OfficialWithdrawForm, self).clean()
        amount = cleaned_data['amount']
        if amount < 0:
            raise forms.ValidationError(
                'Invalid Amount'
            )
        if amount < 5 or amount > 1000:
            raise forms.ValidationError(
                'Amount must be between 5 and 1000'
            )
        user_balance = models.TotalAmounts.objects.filter(
            user=self.request.user).first().income
        if user_balance < amount:
            raise forms.ValidationError(
                'Insufficient Balance'
            )


class GetEmailForm(forms.Form):
    username = forms.CharField(label='Username', max_length=100)


class AskPinForm(BSModalModelForm):
    Personal_pin = forms.CharField(
        label='Personal Pin', max_length=255, widget=forms.PasswordInput())

    class Meta:
        model = models.User
        fields = ['Personal_pin', ]

    def __init__(self, *args, **kwargs):
        super(AskPinForm, self).__init__(*args, **kwargs)

    def clean(self):
        if self.cleaned_data.get('Personal_pin') is None:
            raise forms.ValidationError(
                {'Personal_pin': ['', ]}
            )
        if str(self.cleaned_data.get('Personal_pin')) != models.User.objects.get(id=self.request.user.id).personal_pin:
            raise forms.ValidationError(
                {'Personal_pin': ['Please enter correct PIN.', ]}
            )
