from django.db import models

# Create your models here.
from django.conf import settings

class Podcast(models.Model):
    title = models.CharField(max_length=255)
    author = models.CharField(max_length=100)
    description = models.TextField(blank=True)
    cover = models.ImageField(upload_to='covers/', null=True, blank=True)
    audio_url = models.FileField(upload_to='audios/', null=True, blank=True)
    duration = models.IntegerField(default=0)  # 秒
    create_time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title


class PlayHistory(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    podcast = models.ForeignKey(Podcast, on_delete=models.CASCADE)
    progress = models.IntegerField(default=0)  # 秒
    last_play_time = models.DateTimeField(auto_now=True)


class Comment(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    podcast = models.ForeignKey(Podcast, on_delete=models.CASCADE)
    content = models.TextField()
    create_time = models.DateTimeField(auto_now_add=True)
