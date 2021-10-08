from django.urls import path
from . import views

urlpatterns = [
    # Menu URLS
    path('membership/', views.MemberShipHistoryView.as_view(), name='membership-list-view'),
    path('membership/create/', views.MemberShipPurchase.as_view(), name='membership-purchase'),
    path('pack/', views.PackHistoryView.as_view(), name='pack-list-view'),
    path('pack/create/', views.PackPurchaseView.as_view(), name='pack-purchase'),
    path('pack/refund/<int:pk>/', views.PackRefundView.as_view(), name='pack-refund'),
]