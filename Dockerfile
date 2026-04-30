# Use Python 3.10 or 11
FROM python:3.10-slim

WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all your folders (api, backend, data, frontend, uploads)
COPY . .

# Set environment variables (Cloud Run uses 8080 by default)
ENV PORT=8080

# Command to run your FastAPI app
# Replace 'backend.main:app' with the actual path to your FastAPI instance
CMD exec uvicorn backend.main:app --host 0.0.0.0 --port 8080