pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'registration-page'  // The name of your Docker image
        DOCKER_TAG = 'latest'               // Tag for your Docker image
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from your GitHub repository
                git branch: 'main', url: 'https://github.com/Mahnoor86/DevOpsProject.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t $DOCKER_IMAGE:$DOCKER_TAG ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the image to Docker Hub
                    sh "docker push $DOCKER_IMAGE:$DOCKER_TAG"
                }
            }
        }

        stage('Deploy to Minikube') {
            steps {
                script {
                    // Set up Minikube (if you're deploying to Minikube)
                    sh 'eval $(minikube -p minikube docker-env)'

                    // Deploy to Minikube
                    sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
    }

    post {
        always {
            cleanWs()  // Clean workspace after every run
        }
    }
}
