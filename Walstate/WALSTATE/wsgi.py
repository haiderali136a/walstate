"""
WSGI config for WALSTATE project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/3.1/howto/deployment/wsgi/
"""
import re

import os
import subprocess

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'WALSTATE.settings')

import threading
from datetime import datetime

import schedule
import time
from core import models

from django.core.wsgi import get_wsgi_application

os.environ["DJANGO_ALLOW_ASYNC_UNSAFE"] = "true"

application = get_wsgi_application()


def run_continuously(interval=1):
    """Continuously run, while executing pending jobs at each
    elapsed time interval.
    @return cease_continuous_run: threading. Event which can
    be set to cease continuous run. Please note that it is
    *intended behavior that run_continuously() does not run
    missed jobs*. For example, if you've registered a job that
    should run every minute and you set a continuous run
    interval of one hour then your job won't be run 60 times
    at each interval but only once.
    """
    cease_continuous_run = threading.Event()

    class ScheduleThread(threading.Thread):
        @classmethod
        def run(cls):
            while not cease_continuous_run.is_set():
                schedule.run_pending()
                time.sleep(interval)

    continuous_thread = ScheduleThread()
    continuous_thread.start()
    return cease_continuous_run


def setAdsUnviewed():
    query = models.UserAdsView.objects.all().delete()
    print("done")


def salaryTransfer():
    if datetime.today().day == 1:
        query = models.User.objects.all()
        for it in query.iterator():
            if it.personal_id == 12345678:
                pass
            if it.rank:
                amount_obj = models.TotalAmounts.objects.filter(user=it).first()
                old_balance = amount_obj.salary
                amount_obj.salary += it.rank.salary
                amount_obj.save()
                new_balance = amount_obj.salary
                admin_obj = models.User.objects.filter(personal_id=12345678).first()
                admin_total_amount_obj = models.TotalAmounts.objects.filter(
                    user=admin_obj).first()
                admin_total_amount_obj.income -= it.rank.salary
                admin_total_amount_obj.save()
                amount_obj.save()
                transaction = models.TransactionHistory(type1='Salary', credit_debit="Credit",
                                                        amount=it.rank.salary, old_balance=old_balance,
                                                        new_balance=new_balance,
                                                        details=f"Got Salary {it.rank.salary}",
                                                        date=datetime.now(), user=it)
                transaction.save()
        print("salary transferred")
    else:
        return


def GenerateTree(user, amount):
    data = models.User.objects.filter(referal_id=user)
    packs = models.UserPack.objects.filter(user=user)
    for item in packs.iterator():
        amount += (item.pack.amount * item.quantity)
    if data.count() == 0:
        return amount
    for u in data:
        amount = GenerateTree(u, amount)
    return amount


def checkforSales():
    sales = models.UserSalesData.objects.all().distinct('user')
    for sale in sales.iterator():
        rank = sale.user.rank
        if not rank:
            required_rank = models.Rank.objects.filter(id=1).first()
        elif rank.id < 5:
            required_rank = models.Rank.objects.filter(id=(rank.id + 1)).first()
        else:
            continue
        amount_each = required_rank.required_sales / 3
        referrals_sales = models.UserSalesData.objects.filter(user=sale.user)
        for ref_sale in referrals_sales.iterator():
            amount = 0
            amount = GenerateTree(ref_sale.referral, amount)
            sales_obj = models.UserSalesData.objects.filter(user=sale.user, referral=ref_sale.referral).first()
            sales_obj.total_sales = amount
            if amount >= amount_each:
                sales_obj.current_target_achieved = True
            sales_obj.save()
        count = models.UserSalesData.objects.filter(user=sale.user, current_target_achieved=True).count()
        if count == 3:
            user = sale.user
            user.rank = required_rank
            amount_obj = models.TotalAmounts.objects.filter(user=user).first()
            old_balance = amount_obj.team_earning
            amount_obj.team_earning += required_rank.rewards
            amount_obj.save()
            new_balance = amount_obj.team_earning
            admin_obj = models.User.objects.filter(personal_id=12345678).first()
            admin_total_amount_obj = models.TotalAmounts.objects.filter(
                user=admin_obj).first()
            admin_total_amount_obj.income -= required_rank.rewards
            admin_total_amount_obj.save()
            amount_obj.save()
            transaction = models.TransactionHistory(type1='Rewards', credit_debit="Credit",
                                                    amount=required_rank.rewards, old_balance=old_balance,
                                                    new_balance=new_balance,
                                                    details=f"Achieved rewards {required_rank.rewards} for getting on the rank of '{required_rank.title}', to Team Earning",
                                                    date=datetime.now(), user=user)
            transaction.save()
            user.save()
            r = models.UserSalesData.objects.filter(user=sale.user).update(current_target_achieved=False)


def adsCommission():
    query = models.User.objects.all()
    for user in query.iterator():
        if user.personal_id == 12345678:
            pass
        amount = 0
        userpack = models.UserPack.objects.filter(user=user)
        if userpack:
            for item in userpack.iterator():
                amount += (item.pack.amount * item.quantity)
            profit = amount * 0.00235
            user_obj = models.TotalAmounts.objects.filter(user=user).first()
            old_balance = user_obj.income
            user_obj.income += profit
            new_balance = user_obj.income
            user_obj.save()
            transaction = models.TransactionHistory(type1="Ad Commission", credit_debit="Credit",
                                                    amount=profit, old_balance=old_balance,
                                                    new_balance=new_balance,
                                                    details=f"Ad Commission of {profit} added to Income",
                                                    date=datetime.now(), user=user)
            transaction.save()
            admin_obj = models.User.objects.filter(personal_id=12345678).first()
            admin_total_amount_obj = models.TotalAmounts.objects.filter(
                user=admin_obj).first()
            admin_total_amount_obj.income -= profit
            admin_total_amount_obj.save()


def backup_db():
    filename_re = 'db_backup'
    for root, dirs, files in os.walk('../', topdown=True):
        dirs.clear()  # with topdown true, this will prevent walk from going into subs
        for file in files:
            if re.search(filename_re, file):
                os.remove('../'+file)

    process = subprocess.Popen(
                ['pg_dump',
                 '--dbname=postgresql://{}:{}@{}:{}/{}'.format('postgres', 'postgres', 'localhost', '5432', 'walstate'),
                 '-Fc',
                 '-f', f'../db_backup_{datetime.now().date()}.sql',
                 '-v'],
                stdout=subprocess.PIPE
            )
    output = process.communicate()[0]


# schedule.every().hour.do(setAdsUnviewed)
# schedule.every().day.at("10:30").do(setAdsUnviewed)
schedule.every(2).minutes.do(backup_db)
schedule.every().day.at("01:00").do(setAdsUnviewed)
schedule.every(5).minutes.do(checkforSales)
schedule.every().day.at("08:00").do(salaryTransfer)
schedule.every().day.at("12:00").do(adsCommission)

stop_run_continuously = run_continuously()
