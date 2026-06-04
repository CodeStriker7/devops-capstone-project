FROM python:3.9-slim

WORKDIR /app

# Kutubxonalarni o'rnatish
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Loyihaning barcha fayllarini nusxalash
COPY . .

# Muhit o'zgaruvchilari
ENV FLASK_APP=service:app
EXPOSE 8000


CMD ["gunicorn", "--bind", "0.0.0.0:8000", "service:app"]