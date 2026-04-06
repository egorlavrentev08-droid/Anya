FROM python:3.11-slim

WORKDIR /app

# Устанавливаем зависимости
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копируем код бота (теперь server.py)
COPY server.py .
COPY .env .env 2>/dev/null || true

# Создаём папку для БД
RUN mkdir -p /app/data && chmod 777 /app/data

# Запускаем бота
CMD ["python", "-u", "server.py"]
