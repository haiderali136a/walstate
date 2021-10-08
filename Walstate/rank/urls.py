from django.urls import path
from . import views

urlpatterns = [
    # Menu URLS
    path('', views.RankDetailsView.as_view(), name='rank-details-view'),
    path('details', views.AllRanksView.as_view(), name='all-ranks-view'),
]
