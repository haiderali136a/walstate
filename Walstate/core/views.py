from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .models import TotalAmounts


@login_required
def index(request):
    # if request.user.is_staff and request.user.restaurant_id.status == 'Approved':
    user = TotalAmounts.objects.get(user=request.user)
    # print(user.income, "request")
    return render(request, 'core/dashboard.html', {'total_income': user})  # {user: user})
    # return redirect("login")


@login_required
def redirect_view(request):
    return redirect("dashboard")
