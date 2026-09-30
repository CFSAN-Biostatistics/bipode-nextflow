FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    procps \
    tar \
    gzip \
    && rm -rf /var/lib/apt/lists/*

# Install the bipode Python package, cmdstanpy, and multiqc
RUN pip install --no-cache-dir bipode-httr cmdstanpy multiqc

# Install cmdstan globally 
RUN install_cmdstan --dir /opt/cmdstan

# Set CMDSTAN to the versioned directory (cmdstan installs to cmdstan-X.Y.Z subdirectory)
ENV CMDSTAN=/opt/cmdstan/cmdstan-2.40.0

# Default command
CMD ["python"]
