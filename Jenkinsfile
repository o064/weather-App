pipeline {
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub_id')
	}
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'git_hub_token', url: 'https://github.com/o064/weather-App.git'
            }
        }
        stage('Dockerize') {
            steps {
                sh 'docker build -t omarmohamed04/weahter_app .'
            }
        }
        stage('login dockerhub') {
            steps {
        	sh 'echo "$DOCKERHUB_CREDENTIALS_PSW" | docker login -u "$DOCKERHUB_CREDENTIALS_USR" --password-stdin'

            }
        }
        stage('push image') {
            steps {
                sh 'docker push omarmohamed04/weahter_app:latest'
            }
        }
	stage('run ansible playbook') {
	    steps {
		sh'''
		chmod 600 ./vms/m02/virtualbox/private_key
		chmod 600 ./vms/m01/virtualbox/private_key
		export ANSIBLE_HOST_KEY_CHECKING=False
		ansible-playbook -i inventory playbook.yml
		'''
	    }
	} 
        stage('Logout from DockerHub') {
	    steps {
		sh 'docker logout'
	    }
	}   
    }

    post {
        success {
            emailext subject: "SUCCESS: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                     body: "Great! The build succeeded! \n\n Check here: ${env.BUILD_URL}",
                     to: 'om039919@gmail.com'
        }
        failure {
            emailext subject: "FAILURE: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                     body: "Oops! The build failed. \n\n Logs: ${env.BUILD_URL}",
                     to: 'om039919@gmail.com'
        }
        always {
            emailext subject: "Build Completed: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                     body: "The build has finished with status: ${currentBuild.currentResult}. \n\n Details: ${env.BUILD_URL}",
                     to: 'om039919@gmail.com'
        }
    }
}

