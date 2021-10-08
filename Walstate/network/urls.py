from django.urls import path
from . import views

urlpatterns = [
    # Menu URLS
    path('direct/', views.DirectReferralsView.as_view(), name='direct-referrals-view'),
    path('tree/', views.UnilevelTreeView.as_view(), name='unilevel-tree-view'),
    path('referral/<int:pk>/', views.ReferralView.as_view(), name='show-referral')

]
