
pipeline {
    agent any

    environment {
        KUBECONFIG = 'C:\\Users\\spand\\.kube\\config'
    }

    parameters {
        choice(
            name: 'TARGET_VERSION',
            choices: ['BLUE', 'GREEN'],
            description: 'Select which version should receive traffic'
        )
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

        stage('Deploy Both Versions') {
            steps {
                bat 'kubectl apply -f blue-deployment.yaml'
                bat 'kubectl apply -f green-deployment.yaml'
                bat 'kubectl rollout status deployment/blue-deployment'
                bat 'kubectl rollout status deployment/green-deployment'
            }
        }

        stage('Automated Traffic Switching') {
            steps {
                script {
                    if (params.TARGET_VERSION == 'GREEN') {
                        bat 'kubectl apply -f service-green.yaml'
                        echo 'Traffic successfully switched to GREEN'
                    } else {
                        bat 'kubectl apply -f service.yaml'
                        echo 'Traffic successfully switched to BLUE'
                    }
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                bat 'kubectl describe service blue-green-service'
                bat 'kubectl get pods'
            }
        }
    }
}
