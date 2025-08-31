pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/<your-username>/dockerized-flask-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t flask-app:latest .'
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    // Stop any old container
                    sh 'docker rm -f flask-app || true'
                    // Run new container
                    sh 'docker run -d --name flask-app -p 5000:5000 flask-app:latest'
                }
            }
        }
    }

    post {
        success {
            slackSend(channel: '#ci-cd', message: "✅ SUCCESS: ${env.JOB_NAME} #${env.BUILD_NUMBER}")
        }
        failure {
            slackSend(channel: '#ci-cd', message: "❌ FAILED: ${env.JOB_NAME} #${env.BUILD_NUMBER}")
        }
    }
}
