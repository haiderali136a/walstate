import os
from pathlib import Path
from django.contrib import admin
from core import models
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.utils.translation import gettext as _
from core.models import User
from moviepy.video.io.VideoFileClip import VideoFileClip

from WALSTATE.settings import STATIC_ROOT

admin.site.site_header = 'Waltstate\'s Super Admin Panel'


class UserAdmin(BaseUserAdmin):
    ordering = ['id']
    list_display = ['username', 'email', 'full_name', 'personal_pin']
    list_filter = ('is_superuser', 'is_active',)
    search_fields = ('username',)  # replace email with username
    fieldsets = (
        (None, {'fields': ('username', 'email',
                           'phone_number', 'image', 'password', 'gender', 'date_of_birth', 'referal_id')}),
        (_('Personal Info'), {
         'fields': ('full_name', 'personal_id', 'exchanger', 'role', 'badge', 'rank', 'personal_pin',)}),
        (
            _('Permissions'),
            {'fields': ('is_active', 'is_staff', 'is_superuser')}
        ),
        (_('Important dates'), {'fields': ('last_login',)})
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('full_name', 'username', 'email', 'gender', 'date_of_birth', 'phone_number', 'is_staff', 'is_active', 'personal_pin', 'password1', 'password2', 'role', 'badge', 'rank')
        }),
    )


class AdsAdmin(admin.ModelAdmin):
    def save_model(self, request, obj, form, change):
        obj.user = request.user
        super().save_model(request, obj, form, change)
        print(obj.video.path)
        clip = VideoFileClip(obj.video.path)
        thumbnail_name = '/'.join('.'.join(obj.video.url.split('.')
                                           [0:-1]).split('/')[2:]) + '.jpg'
        thumbnail_path = '.'.join(obj.video.path.split('.')[0:-1]) + '.jpg'
        clip.save_frame(thumbnail_path, t=1.00)
        obj.thumbnail = thumbnail_name
        super().save_model(request, obj, form, change)

# Register your models here.


class tamounts(admin.ModelAdmin):
    list_display = ['user', 'salary', 'income', 'team_earning', 'master_pack']


class UPack(admin.ModelAdmin):
    list_display = ['user', 'pack', 'quantity', 'created_at', 'status']


class UPin(admin.ModelAdmin):
    list_display = ['user', 'pin', 'amount', 'created_at', 'status']


class UMembership(admin.ModelAdmin):
    list_display = ['user', 'membership', 'created_at', ]


class THistory(admin.ModelAdmin):
    list_display = ['user', 'type1', 'credit_debit',
                    'amount', 'old_balance', 'new_balance', 'details']


class USales(admin.ModelAdmin):
    list_display = ['user', 'referral', 'total_sales',
                    'current_target_achieved']


class URank(admin.ModelAdmin):
    list_display = ['title', 'rewards', 'required_sales',
                    'salary']


class SBHistory(admin.ModelAdmin):
    list_display = ['sender', 'recipient', 'amount',
                    'date']


class TBHistory(admin.ModelAdmin):
    list_display = ['user', 'amount',
                    'date']


class ODeposit(admin.ModelAdmin):
    list_display = ['user', 'amount',
                    'date', 'status']


class OWithdraw(admin.ModelAdmin):
    list_display = ['user', 'amount',
                    'date', 'status']

admin.site.register(models.User, UserAdmin)
admin.site.register(models.Pack)
admin.site.register(models.UserAdsView)
admin.site.register(models.Ads, AdsAdmin)
admin.site.register(models.UserPack, UPack)
admin.site.register(models.ShareBalanceHistory, SBHistory)
admin.site.register(models.TeamEarning)
admin.site.register(models.TransferBalanceHistory, TBHistory)
admin.site.register(models.Income)
admin.site.register(models.TotalAmounts, tamounts)
admin.site.register(models.TransactionHistory, THistory)
admin.site.register(models.UserMemberShip, UMembership)
admin.site.register(models.MemberShip)
admin.site.register(models.Documents)
admin.site.register(models.Badge)
admin.site.register(models.Role)
admin.site.register(models.UserPin, UPin)
admin.site.register(models.Rank, URank)
admin.site.register(models.OfficialDeposit, ODeposit)
admin.site.register(models.OfficialWithdraw, OWithdraw)
admin.site.register(models.UserSalesData, USales)
