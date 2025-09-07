pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Use GitHub credentials stored in Jenkins
                git branch: 'main',
                    url: 'https://github.com/haneenAlaa21/DevOps-Project-.git',
                    credentialsId: 'github-cred'   // <-- The ID you set in Jenkins credentials
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
            slackSend(
                channel: '#jenkins-notification',   // <-- Use your Slack channel
                message: "✅ SUCCESS: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                color: 'good'
            )
        }
        failure {
            slackSend(
                channel: '#jenkins-notification',   // <-- Use your Slack channel
                message: "❌ FAILED: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                color: 'danger'
            )
        }
    }
}

