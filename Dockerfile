FROM debian:bookworm-slim

# Install essential build tools and elan
RUN apt-get update && apt-get install -y \
  curl \
  git \
  build-essential \
  && rm -rf /var/lib/apt/lists/*

# Install lean (using elan)
RUN curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh -s -- -y
ENV PATH="/root/.elan/bin:${PATH}"

# Copy MathLib4 fork and build it
WORKDIR /mathlib4
COPY . .
RUN lake build
