"""WALSTATE URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from core import views
from django.contrib.auth import views as auth_views
from django.conf.urls.static import static
from django.conf import settings
from user.views import SignUpView, EditProfileView, DocumentUploadView, BecomeExchangerView, ShowReferralView
from django.views.generic.base import TemplateView


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', TemplateView.as_view(template_name='index.html'), name='home'),
    path('aboutus/', TemplateView.as_view(template_name='about-us.html'), name='about-us'),
    path('privacy/', TemplateView.as_view(template_name='privacy.html'), name='privacy'),
    path('terms/', TemplateView.as_view(template_name='terms.html'), name='terms'),
    path('whyus/', TemplateView.as_view(template_name='why-choose-us.html'), name='why-choose-us'),
    path('dashboard', views.index, name='dashboard'),
    path('login/', auth_views.LoginView.as_view(template_name='user/login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('user/edit/<int:pk>/', EditProfileView.as_view(), name='edit-user'),
    path('signup/', SignUpView.as_view(), name='signup'),
    path('verification/', DocumentUploadView.as_view(), name='upload-docs'),
    path('exchanger/<int:pk>/', BecomeExchangerView.as_view(), name='exchanger'),
    path('purchase/', include('purchases.urls')),
    path('pins/', include('pins.urls')),
    path('transaction/', include('transaction.urls')),
    path('network/', include('network.urls')),
    path('settings/', include('settings.urls')),
    path('ads/', include('ads.urls')),
    path('rank/', include('rank.urls')),
    path('password/reset/', auth_views.PasswordResetView.as_view(
        template_name='user/forget_password.html'), name="reset_password"),
    path('password/reset/email/sent',
         auth_views.PasswordResetDoneView.as_view(template_name='user/password_reset_sent.html'), name="password_reset_done"),
    path('password/reset/<uidb64>/<token>/',
         auth_views.PasswordResetConfirmView.as_view(template_name='user/password_change_template.html'), name="password_reset_confirm"),
    path('password/reset/complete/',
         auth_views.PasswordResetCompleteView.as_view(template_name="user/password_reset_complete.html"), name="password_reset_complete"),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
