FROM python:3.7
ENV PYTHONUNBUFFERED 1

# Update packages
RUN apt-get update
RUN apt-get install apt-transport-https sudo -y

# Create User docker
RUN useradd -ms /bin/bash docker
RUN echo "docker ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Create env values
ENV PROJECT_DIR /home/docker/public
ENV REQUIREMENTS_DIR /home/docker/public/urbvan/requirements

# Create Folders
RUN mkdir -p $PROJECT_DIR
RUN mkdir -p $REQUIREMENTS_DIR

# Change owner and group
RUN chown -R docker:docker $PROJECT_DIR

# Copy requirements files
COPY src/urbvan/requirements/base.txt /home/docker/public/urbvan/requirements

# Install pip requiremntes
RUN pip install -r $REQUIREMENTS_DIR/base.txt

# Init Project
WORKDIR /home/docker/public
USER docker