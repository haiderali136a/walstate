from django import forms
from django.contrib.auth.hashers import check_password
from django.utils import timezone
from django.core.mail import send_mail
from core.models import MemberShip
from core import models
from bootstrap_modal_forms.forms import BSModalModelForm


class MemberShipForm(forms.ModelForm):
    pin = forms.CharField()

    class Meta:
        model = models.UserMemberShip
        fields = ('pin', 'membership',)

    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super(MemberShipForm, self).__init__(*args, **kwargs)

    def clean(self):
        cleaned_data = super(MemberShipForm, self).clean()
        pin_obj = models.UserPin.objects.filter(
            pin=cleaned_data.get("pin")).first()
        if pin_obj:
            if pin_obj.status == 'used':
                raise forms.ValidationError(
                    {"pin": ["Pin was already used!", ]}
                )
            if pin_obj.status == 'refunded':
                raise forms.ValidationError(
                    {"pin": ["Pin was refunded!", ]}
                )
        if cleaned_data.get("membership"):
            membership = models.MemberShip.objects.filter(
                id=cleaned_data.get("membership").id).first()
            pins = models.UserPin.objects.filter(user=self.request.user.id)
            # print(pins)
            temp = 0
            for i in pins:
                # print(type(cleaned_data.get('pin')),type(i.pin), i.amount)
                if cleaned_data.get('pin') == str(i.pin) and i.amount == membership.amount:
                    # print(1111111)
                    temp = 1
            # print(temp)
            if temp != 1:
                raise forms.ValidationError(
                    {"pin": [f"Pin should be of {membership.amount} tokens!", ]}
                )
            pin_obj.status = 'used'
            pin_obj.save()


class MasterPackForm(forms.ModelForm):
    pin = forms.CharField()

    class Meta:
        model = models.UserPack
        fields = ('pin', 'pack', 'quantity')

    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super(MasterPackForm, self).__init__(*args, **kwargs)

    def clean(self):
        cleaned_data = super(MasterPackForm, self).clean()
        pin_obj = models.UserPin.objects.filter(
            pin=cleaned_data.get("pin")).first()
        if pin_obj:
            if pin_obj.status == 'used':
                raise forms.ValidationError(
                    {"pin": ["Pin was already used!", ]}
                )
            if pin_obj.status == 'refunded':
                raise forms.ValidationError(
                    {"pin": ["Pin was refunded!", ]}
                )
        if cleaned_data.get('pack') is None:
            raise forms.ValidationError(
                {"pack": ["", ]}
            )
        if cleaned_data.get("quantity") < 1 or cleaned_data.get("quantity") > 50:
            raise forms.ValidationError(
                {"quantity": ['Enter quantity between 1 and 50.', ]}
            )
        pack = models.Pack.objects.filter(
            id=cleaned_data.get("pack").id).first()
        pins = models.UserPin.objects.filter(user=self.request.user.id)
        temp = 0
        for i in pins:
            # print(i.amount, cleaned_data.get("quantity")*pack.amount)
            if cleaned_data.get('pin') == str(i.pin) and i.amount == cleaned_data.get("quantity")*pack.amount:
                temp = 1
        if temp != 1:
            raise forms.ValidationError(
                {"pin": [
                    f"Pin should be of {cleaned_data.get('quantity')*pack.amount} tokens!", ]}
            )
        pin_obj.status = 'used'
        pin_obj.save()


class PackRefundForm(BSModalModelForm):
    class Meta:
        model = models.UserPack
        fields = ['quantity', ]
        # fields = '__all__'

    def __init__(self, *args, **kwargs):
        super(PackRefundForm, self).__init__(*args, **kwargs)
        instance = getattr(self, 'instance', None)
        if instance and instance.pk:
            self.fields['quantity'].widget.attrs['readonly'] = True
