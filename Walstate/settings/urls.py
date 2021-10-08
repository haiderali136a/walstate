from django.urls import path
from . import views

urlpatterns = [
    path('password/reset/<int:pk>/', views.PasswordChangeView.as_view(), name='change-password'),
    path('pin/update/<int:pk>/', views.PinChangeView.as_view(), name='change-pin'),
    # path('referral/<int:pk>/', views.ReferralView.as_view(), name='show-referral')
]
