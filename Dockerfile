# Use the official Python image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /code

# Install dependencies
COPY requirements.txt /code/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy project files
COPY . /code/

# Collect static files (optional, if you use static files in templates)
RUN python manage.py collectstatic --noinput

# Expose the default port
EXPOSE 4436

# Default command
CMD ["python", "manage.py", "runserver", "0.0.0.0:4436"]
