from django.urls import path
from django.views.decorators.csrf import csrf_exempt

from . import views

urlpatterns = [
    # Menu URLS
    path('view/', views.ShowAdsView.as_view(), name='show-ads-view'),
    path('update/status/', views.AdStatusUpdateView.as_view(), name='ad-status-view'),
    path('viewed/', views.ViewedAdsView.as_view(), name='viewed-ads-view'),
]
