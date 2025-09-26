# استخدم نسخة Python Slim عامة بدل الصورة الخاصة
FROM python:3.11-slim-buster

# تحديث النظام وتثبيت git وcurl و Node.js
RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*

# تثبيت Node.js 16
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs \
    && npm i -g npm

# نسخ المشروع داخل الحاوية
WORKDIR /root/zira
COPY . /root/zira

# تثبيت متطلبات Python
RUN pip3 install --no-cache-dir -r requirements.txt

# تحديث PATH لو فيه ملفات تنفيذية محلية
ENV PATH="/root/zira/bin:$PATH"

# أمر تشغيل البوت
CMD ["python3","-m","zira"]
