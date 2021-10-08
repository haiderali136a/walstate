from django.urls import path
from . import views

urlpatterns = [
    # Menu URLS
    path('history/', views.PinHistoryView.as_view(), name='pin-history'),
    path('create/', views.PinCreationView.as_view(), name='pin-create'),
    path('refund/<int:pk>/', views.PinRefundView.as_view(), name='pin-refund'),
]