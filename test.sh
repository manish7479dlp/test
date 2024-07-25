deploy() {
    echo "***** DEPLOYMENT START ******"
    
    # Print the current working directory
    pwd
    
    # Check if the container is already running and remove it if so
    if [ "$(docker ps -q -f name=docker-express-test)" ]; then
        echo "Stopping and removing existing container..."
        docker stop docker-express-test
        docker rm docker-express-test
    fi
    
    # Check if the image already exists and remove it if so
    if [ "$(docker images -q express-test)" ]; then
        echo "Removing existing image..."
        docker rmi express-test
    fi
    
    # Build the new image
    echo "Building new Docker image..."
    docker build -t express-test .
    
    # Check if the build was successful
    # $? tell the status of last executed command if value = 0 means sucess.
    if [ $? -eq 0 ]; then
        # Run the new container
        echo "Running the new container..."
        docker run --rm -it --name docker-express-test -p 8000:8000 express-test
    else
        echo "Deployment Failed"
    fi
    
    echo "***** DEPLOYMENT DONE ******"
}
