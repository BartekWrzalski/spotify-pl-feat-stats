# Check if .env file exists
if [ ! -f .env ]; then
    cp .env.dist .env
    echo ".env file created. Add variable values and rerun make build."
    exit 0
fi

# Check if .env file is different from .env.dist and raise error if equal
if cmp -s .env .env.dist; then
    echo ".env file is not complete. Add variable values and rerun make build."
    exit 0
fi

# Run Docker build command
docker build --build-arg UID=1000 --build-arg GID=1000 --tag spotify-pl-feat-stats .