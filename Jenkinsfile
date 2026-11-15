
pipeline {
    agent any

    environment {
        KUBECONFIG = 'C:\\Users\\spand\\.kube\\config'
    }

    stages {

        stage('Build Blue Image') {
            steps {
                bat 'docker build --build-arg VERSION=blue -t assignment-8-blue .'
            }
        }

        stage('Build Green Image') {
            steps {
                bat 'docker build --build-arg VERSION=green -t assignment-8-green .'
            }
        }

        stage('Deploy Blue and Green') {
            steps {
                bat 'kubectl apply -f blue-deployment.yaml'
                bat 'kubectl apply -f green-deployment.yaml'
                bat 'kubectl rollout status deployment/blue-deployment'
                bat 'kubectl rollout status deployment/green-deployment'
            }
        }

        stage('Configure Blue Traffic') {
            steps {
                bat 'kubectl apply -f service.yaml'
                bat 'kubectl get services'
                bat 'kubectl get pods'
            }
        }
    }
}
