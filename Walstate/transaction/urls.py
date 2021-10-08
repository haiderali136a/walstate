from django.urls import path
from . import views

urlpatterns = [
    # Menu URLS

    path('', views.TransactionHistoryView.as_view(),
         name='transaction-history-view'),
    path('transfer/balance/', views.TransferBalanceView.as_view(),
         name='transfer-balance-view'),
    path('transfer/balance/history/', views.TransferBalanceHistoryView.as_view(),
         name='transfer-balance-history-view'),
    path('share/balance/', views.ShareBalanceHistoryView.as_view(),
         name='share-balance-list-view'),
    path(r'^share/balance/create/(?P<value>\d+)/$', views.ShareBalanceCreateView.as_view(),
         name='share-balance-create-view'),
    path('share/balance/user/info/<int:pk>/', views.ShareBalanceGetUserInfo.as_view(),
         name='share-balance-create-info'),
    path('deposit/', views.OfficialDepositView.as_view(),
         name='official-deposit-view'),
    path('withdraw/', views.OfficialWithdrawView.as_view(),
         name='official-withdraw-view'),
    path('deposit/history/', views.OfficialDepositHistoryView.as_view(),
         name='official-deposit-history-view'),
    path('withdraw/history/', views.OfficialWithdrawHistoryView.as_view(),
         name='official-withdraw-history-view'),
    path('share/balance/get/title', views.ShareBalanceGetTitleView.as_view(),
         name='share-balance-get-title-view'),
    path('ask/pin/<int:pk>/', views.AskPinView.as_view(), name='ask-pin'),
]
