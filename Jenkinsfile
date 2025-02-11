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
                sh 'docker push omarmohamed04/weahter_app'
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


}

