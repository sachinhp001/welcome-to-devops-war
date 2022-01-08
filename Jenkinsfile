pipeline {
	agent { label 'slave' }
    stages {
	    
       stage('checkout') {
            steps {
                sh 'sudo rm -rf welcome-to-devops-war'
	sh 'git clone https://github.com/manojugowda/welcome-to-devops-war'	
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
	         sh 'docker run -d --name mytomcat -p 8888:8080 tomcat:ver1.1'
	     }
	 }
    }
}
