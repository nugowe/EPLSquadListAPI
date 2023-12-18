from django.contrib import admin
from django.urls import path
from epl.api import epl

urlpatterns = [
    path('admin/', admin.site.urls),
    path('epl/', epl.urls)
]