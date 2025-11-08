FROM python:3.11-slim

# Set working directory
WORKDIR /opt/robotframework

# Install system dependencies including curl and jq for health checks
RUN apt-get update && apt-get install -y \
    wget unzip curl xvfb jq && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Set proper permissions
RUN chmod +x /opt/robotframework/run_tests.sh

# Default command
CMD ["./run_tests.sh"]