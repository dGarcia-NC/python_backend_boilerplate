FROM python:3.9-alpine3.13
LABEL maintainer="David Garcia"

# Tells python that you don't want to buffer the output.
# The output from Python will be directly printed to console
ENV PYTHONUNBUFFERED 1

# Copies the requirements.txt file from local machine into docker image
COPY ./requirements.txt /tmp/requirements.txt
# Copies the requirements.dev.txt file from local machine into docker image
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
# Copies the local ./app directory into the docker image
COPY ./app /app
# Working directory that all the commands will be run from when we run commands on our docker image
WORKDIR /app
# Expose port 8000 from our container to our machine when we run the container
# Allows us to access that port on the container that's running from our image
EXPOSE 8000

ARG DEV=false
# We run a command on the image when we're running our image
# Creates a new virtual environment that we'll use to store our dependencies
RUN python -m venv /py && \
    # Upgrades the python package manager inside the virtual environment
    /py/bin/pip install --upgrade pip && \
    # Install our requirements from /tmp/requirements.txt into our docker image
    /py/bin/pip install -r /tmp/requirements.txt && \
    # Shell code/script that does an if statement for when dev equals true
    if [ $DEV = "true" ]; \
      then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    # Then we remove the /tmp directory so there are no extra unecessary files on the image
    rm -rf /tmp && \
    # adduser block calls the 'adduser' command which adds a new user inside our image
    # It's best practice not to use the root user
    adduser \
      # We don't want to logon when running our image so we disable it
      --disabled-password \
      # We don't create a home directory for that user, it's not necessary and we'll
      # keep docker image as light weight as possible
      --no-create-home \
      # We specify the name of the user
      django-user

# This updates the environment variable inside the image
# We're updating the PATH environment variable. This makes it so I don't have to run /py/bin
# When running a command in our environment it'll automatically run from within our environment
ENV PATH="/py/bin:$PATH"

# Specifies the user that we're switching to
USER django-user
