from rest_framework import serializers
from django.contrib.auth.models import User
from .models import Podcast, PlayHistory, Comment

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email']


class LoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()

class PodcastSerializer(serializers.ModelSerializer):
    class Meta:
        model = Podcast
        fields = '__all__'


class PlayHistorySerializer(serializers.ModelSerializer):
    podcast = PodcastSerializer(read_only=True)

    class Meta:
        model = PlayHistory
        fields = '__all__'


class CommentSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True)

    class Meta:
        model = Comment
        fields = '__all__'
