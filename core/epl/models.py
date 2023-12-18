from django.db import models

class EPL(models.Model):
    Position = models.CharField(max_length=250)
    Nation = models.CharField(max_length=250)
    Team = models.CharField(max_length=250)
    PlayerName = models.CharField(max_length=250)