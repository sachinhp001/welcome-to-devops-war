pipeline {
	agent none
environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub_slave')
	}
    stages {
	
       stage('checkout') {
    agent  { label 'java' }
            steps {
                sh 'sudo rm -rf welcome-to-devops-war'
	sh 'git clone https://github.com/sachinhp001/welcome-to-devops-war.git'	
              }
        }
	 stage('build') {
 agent  { label 'java' }
	steps {
 
                dir('welcome-to-devops-war'){
                  sh 'pwd'
                sh 'ls'
            
                sh 'docker build -t tomcat:1.0 .'  
                }
            }
	 }
	 stage('deploy'){
 agent  { label 'java' }
	     steps{
	        sh 'docker rm -f mytomcat'
	         sh 'docker run -d --name mytomcat -p 8888:8080 tomcat:1.0'
	     }
	 }
		stage('Login') {
agent  { label 'java' }
			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}
	stage('Push') {
 agent  { label 'java' }

			steps {
			    sh 'docker tag tomcat:1.0 sachinhp001/jenkins_sa:1.3'
				sh 'docker push sachinhp001/jenkins_sa:1.3'
			}
		}

    stage('pull image'){
    agent { label 'jen' }
        steps{
            sh 'docker rm -f mytomcat'
            sh 'docker run -d --name mytomcat -p 7100:8080 sachinhp001/jenkins_sa:1.3'
        }
    }
    }
}
            
            
