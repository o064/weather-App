pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'git_hub_token', url: 'https://github.com/o064/weather-App.git'
            }
        }
        stage('Dockerize') {
            steps {
                sh 'docker build -t wheater_app .'
            }
        }
        stage('run container') {
            steps {
                sh 'docker run -p 5000:5000 -d wheater_app'
            }
        }
    }
}
