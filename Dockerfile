FROM python:3.11-slim

# Set work directory
WORKDIR /app

# Copy requirements first for caching
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy app code
COPY . .

# Run the app
CMD ["python", "app.py"]
