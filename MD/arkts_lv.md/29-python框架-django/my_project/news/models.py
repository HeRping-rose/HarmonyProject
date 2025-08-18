from django.db import models

class News(models.Model):
    """新闻数据模型"""
    title = models.CharField(max_length=200, verbose_name="标题")
    content = models.TextField(verbose_name="内容")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")

    class Meta:
        verbose_name = "新闻"
        verbose_name_plural = "新闻"
        ordering = ['-created_at']  # 按创建时间倒序排列

    def __str__(self):
        return self.title
