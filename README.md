# django_playground

### Install project on the local system
```bash
git clone https://github.com/dGarcia-NC/django_playground.git
```

### Navigate to the parent directory and run
<sub> This will build the docker image for you </sub>
```bash
make build
```

### Run the server
```bash
make up
```

# Configure Docker Hub with GitHub Actions
Since this project has GitHub Actions you'll need to configure GitHub Actions with Docker Hub. To do so you'll have to navigate to [hub.docker](https://hub.docker.com/settings/security) and create an access key.  Copy the key that docker hub provides you.  You'll only be provided this once so don't close the page.

Navigate to your GitHub repo, click settings, click secrets and variables, click actions, and create two New repository secrets.
1. DOCKERHUB_TOKEN
2. DOCKERHUB_USER


For the DOCKERHUB_USER value add your Docker Hub username


For the DOCKERHUB_TOKEN value, add your docker hub access key
