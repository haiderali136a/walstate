from django.core.exceptions import ValidationError
from moviepy.video.io.VideoFileClip import VideoFileClip
from datetime import datetime, timedelta, timezone

from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, \
    PermissionsMixin
import os
import uuid
import random
import string
from .utils import GENDERS, DOCUMENT_APPROVAL_CHOICES
from django.core.validators import FileExtensionValidator


def document_image_file_path(instance, filename):
    """Generate file path for new user image"""
    ext = filename.split('.')[-1]
    filename = f'{uuid.uuid4()}.{ext}'

    return os.path.join('uploads/document/', filename)


def ads_file_path(instance, filename):
    """Generate file path for new user image"""
    ext = filename.split('.')[-1]
    filename = f'{uuid.uuid4()}.{ext}'

    return os.path.join('uploads/ads/', filename)


def deposit_file_path(instance, filename):
    """Generate file path for new user image"""
    ext = filename.split('.')[-1]
    filename = f'{uuid.uuid4()}.{ext}'

    return os.path.join('uploads/deposit/', filename)


def badge_image_file_path(instance, filename):
    """Generate file path for new user image"""
    ext = filename.split('.')[-1]
    filename = f'{uuid.uuid4()}.{ext}'
    return os.path.join('uploads/badge/', filename)


def user_image_file_path(instance, filename):
    """Generate file path for new user image"""
    ext = filename.split('.')[-1]
    filename = f'{uuid.uuid4()}.{ext}'
    return os.path.join('uploads/user/', filename)


class UserManager(BaseUserManager):
    def create_user(self, username, password=None, **extra_fields):
        """Creates and saves a new user"""
        if not username:
            raise ValueError('Users must have an username')
        # change normalize_email to normalize_username
        user = self.model(username=username, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, username, password):
        """Creates and saves a new super user"""
        user = self.create_user(username, password)
        # user.personal_id = 12345679
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)
        return user


class Badge(models.Model):
    """Badge Model"""
    title = models.CharField(max_length=255, unique=True)
    no_of_referal = models.CharField(max_length=255)
    image = models.ImageField(upload_to=badge_image_file_path, null=True)


class Rank(models.Model):
    title = models.CharField(max_length=255, unique=True)
    rewards = models.FloatField()
    required_sales = models.FloatField()
    salary = models.FloatField()
    details = models.CharField(max_length=255)
    badge = models.ImageField(upload_to=badge_image_file_path, null=True, blank=True)


class Role(models.Model):
    name = models.CharField(unique=True, max_length=255)


class User(AbstractBaseUser, PermissionsMixin):
    """Custom user model"""
    username = models.CharField(max_length=255, unique=True)
    personal_id = models.BigIntegerField(unique=True, null=True)
    referal_id = models.ForeignKey(
        "User", on_delete=models.DO_NOTHING, null=True)
    full_name = models.CharField(max_length=255)
    email = models.EmailField(max_length=255, null=True, unique=True)
    image = models.ImageField(upload_to=user_image_file_path, blank=True)
    status = models.IntegerField(default=1)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    phone_number = models.BigIntegerField(null=True)
    date_of_birth = models.DateField(null=True)
    gender = models.CharField(max_length=255, choices=GENDERS)
    CNIC = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    postal_code = models.IntegerField(null=True)
    state = models.CharField(max_length=255)
    country = models.CharField(max_length=255)
    facebook_link = models.URLField(max_length=255)
    twitter_link = models.URLField(max_length=255)
    skype_link = models.URLField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    exchanger = models.BooleanField(default=False)
    personal_pin = models.CharField(max_length=255)

    role = models.ForeignKey('Role', on_delete=models.DO_NOTHING, null=True)
    rank = models.ForeignKey('Rank', on_delete=models.DO_NOTHING, null=True)
    badge = models.ForeignKey('Badge', on_delete=models.DO_NOTHING, null=True)

    objects = UserManager()
    USERNAME_FIELD = 'username'


class Documents(models.Model):
    type = models.CharField(max_length=255)
    id_doc = models.FileField(blank=True, upload_to=document_image_file_path, validators=[
                              FileExtensionValidator(['pdf', 'jpg', 'jpeg', 'png'])])
    bill_doc = models.FileField(blank=True, upload_to=document_image_file_path, validators=[
                                FileExtensionValidator(['pdf', 'jpg', 'jpeg', 'png'])])
    status = models.CharField(
        max_length=255, choices=DOCUMENT_APPROVAL_CHOICES)

    user = models.ForeignKey('User', on_delete=models.CASCADE)

    def __str__(self):
        return self.user.username


class UserPin(models.Model):
    pin = models.CharField(max_length=30, unique=True)
    amount = models.FloatField()
    created_at = models.DateTimeField(auto_now_add=True)
    refund_date = models.DateTimeField(null=True, blank=True)
    status = models.CharField(max_length=255, default='not used')

    user = models.ForeignKey('User', on_delete=models.CASCADE)

    class Meta:
        ordering = ['created_at', ]


class MemberShip(models.Model):
    name = models.CharField(max_length=255, unique=True)
    amount = models.FloatField()
    details = models.CharField(max_length=255)

    def __str__(self):
        return self.name


class UserMemberShip(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True)
    user = models.ForeignKey('User', on_delete=models.CASCADE)
    membership = models.ForeignKey('MemberShip', on_delete=models.CASCADE)

    class Meta:
        ordering = ['-created_at', ]

    def __str__(self):
        return f'{self.user}, {self.membership}'

    @property
    def is_expired(self):
        expire_after = timedelta(days=365)
        time_diff = datetime.now(timezone.utc) - self.created_at
        status = datetime.now(timezone.utc) - self.created_at >= expire_after
        return status


class TransactionHistory(models.Model):
    type1 = models.CharField(max_length=255)
    credit_debit = models.CharField(max_length=255)
    amount = models.FloatField()
    old_balance = models.FloatField()
    new_balance = models.FloatField()
    details = models.CharField(max_length=255)
    date = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey('User', on_delete=models.CASCADE)


class TotalAmounts(models.Model):
    user = models.ForeignKey('User', on_delete=models.CASCADE)
    salary = models.FloatField(null=True)
    income = models.FloatField(null=True)
    team_earning = models.FloatField(null=True)
    master_pack = models.FloatField(null=True)

    def __str__(self):
        return self.user.username


class TeamEarning(models.Model):
    referal_id = models.BigIntegerField()
    type1 = models.CharField(max_length=255)
    amount = models.FloatField()
    details = models.CharField(max_length=255)
    user = models.ForeignKey('User', on_delete=models.CASCADE)


class Income(models.Model):
    type1 = models.CharField(max_length=255)
    amount = models.FloatField()
    details = models.CharField(max_length=255)
    user = models.ForeignKey('User', on_delete=models.CASCADE)


class OfficialWithdraw(models.Model):
    amount = models.FloatField()
    trc20_address = models.CharField(max_length=255)
    status = models.CharField(default="Pending", max_length=255)
    date = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey('User', on_delete=models.CASCADE)


class OfficialDeposit(models.Model):
    amount = models.FloatField()
    status = models.CharField(default="Pending", max_length=255)
    date = models.DateTimeField(auto_now_add=True)
    screenshot = models.ImageField(upload_to=deposit_file_path, blank=True)
    user = models.ForeignKey('User', on_delete=models.CASCADE)


class TransferBalanceHistory(models.Model):
    amount = models.FloatField()
    date = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey('User', on_delete=models.CASCADE)


class ShareBalanceHistory(models.Model):
    amount = models.FloatField()
    date = models.DateTimeField(auto_now_add=True)
    sender = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='sender')
    recipient = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='receiver')


class Pack(models.Model):
    name = models.CharField(max_length=255, unique=True)
    amount = models.FloatField()
    details = models.CharField(max_length=255)
    # duration = models.CharField(default='1 year', max_length=255)
    duration = models.IntegerField(default=12, help_text='Months')

    def __str__(self):
        return f'{self.name} (amount 50 tokens)'


class UserPack(models.Model):
    quantity = models.IntegerField(
        default=1, help_text='Minimum 1 and maximum 50.')
    details = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    ended_at = models.DateTimeField(null=True)
    status = models.CharField(default="not refunded", max_length=255)
    user = models.ForeignKey('User', on_delete=models.CASCADE)
    pack = models.ForeignKey('Pack', on_delete=models.CASCADE)


class Ads(models.Model):
    title = models.CharField(max_length=255)
    video = models.FileField(blank=True, upload_to=ads_file_path, validators=[
                             FileExtensionValidator(['mov', 'avi', 'mp4'])])
    thumbnail = models.ImageField(blank=True, upload_to=ads_file_path)
    status = models.BooleanField()
    total_no_of_views = models.IntegerField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)


class UserAdsView(models.Model):
    viewed = models.BooleanField(blank=True, default=False)
    user = models.ForeignKey('User', on_delete=models.CASCADE)
    ads = models.ForeignKey('Ads', on_delete=models.CASCADE)


class UserSalesData(models.Model):
    user = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='+')
    referral = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='referral')
    total_sales = models.FloatField()
    current_target_achieved = models.BooleanField(default=False)
