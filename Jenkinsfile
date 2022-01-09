pipeline {
	agent { label 'slave-1' }
environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub_slave-1')
	}
    stages {
	    
       stage('checkout') {
            steps {
                sh 'sudo rm -rf welcome-to-devops-war'
	sh 'git clone https://github.com/akshayvdes/welcome-to-devops-war.git'	
              }
        }
	 stage('build') {
	
            steps {
                dir('welcome-to-devops-war'){
                  sh 'pwd'
                sh 'ls'
            
                sh 'docker build -t tomcat:1.0 .'  
                }
            }
	 }
	 stage('deploy'){
	     steps{
	        sh 'docker rm -f mytomcat'
	         sh 'docker run -d --name mytomcat -p 8888:8080 tomcat:1.0'
	     }
	 }
		stage('Login') {
			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}
	stage('Push') {

			steps {
			    sh 'docker tag tomcat:1.0 akshayvdes/tomcatnew_ak:1.3'
				sh 'docker push akshayvdes/tomcatnew_ak:1.3'
			}
		}
    }
	post {
		always {
			sh 'docker logout'
		}

}
    }
