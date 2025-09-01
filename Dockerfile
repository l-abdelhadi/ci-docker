# 1) Base image
FROM python:3.10-slim
# 2) Prevent .pyc files and enable unbuffered logs
# Clean logs and no unnecessary files.
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 3) Create work directory
WORKDIR /app

# 4) Install dependencies first (better caching)
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt
COPY . /app/

# 5) Copy app source
EXPOSE 5000

# 6) Expose port and run
CMD ["python", "app.py"]
