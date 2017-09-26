FROM ruby

# Update dependency
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs


# Install Rails
RUN gem install rails

# WORKDIR
WORKDIR /src