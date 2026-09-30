FROM python:3.11-slim

# Install system dependencies
# - build-essential & curl: Required to install cmdstan
# - procps: REQUIRED by Nextflow to monitor task execution (provides 'ps')
# - tar & gzip: Required for the pipeline's COMPRESS_OUTPUT step
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    procps \
    tar \
    gzip \
    && rm -rf /var/lib/apt/lists/*

# Install the bipode Python package, cmdstanpy, and multiqc for the report generation
RUN pip install --no-cache-dir bipode-httr cmdstanpy multiqc

# Install cmdstan globally so the pipeline can compile the models
RUN install_cmdstan --dir /opt/cmdstan
ENV CMDSTAN=/opt/cmdstan

# Default command
CMD ["python"]