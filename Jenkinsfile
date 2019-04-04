pipeline {
  agent any
  tools { 
        maven 'Maven'
        //jdk 'JAVA_HOME'
  }
  stages {
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace... */
      steps {
        checkout scm
      }
    }
    stage('Build') {
      steps {
        sh 'mvn -B -DskipTests clean package'
        sh 'echo $USER'
        sh 'echo whoami'
      }
    }
    stage('Docker Build') {
      steps {
        sh '/usr/bin/docker build -t cloud_guru/bank-customer-service:latest .'
      }
    }
    stage('Push image') {
      steps {
        //withDockerRegistry(credentialsId: 'ecr:us-east-1:Devops_guru', url: '775596097483.dkr.ecr.us-east-1.amazonaws.com/cloud_guru') {
        withDockerRegistry(credentialsId: 'ecr:us-east-1:Devops_Guru', url: 'https://console.aws.amazon.com/ecr/repositories?region=us-east-1') {
          //sh '/usr/bin/docker push cloud_guru/bank-customer-service:latest'
          sh 'docker push 775596097483.dkr.ecr.us-east-1.amazonaws.com/cloud_guru:latest'
        }  
      }
    }
  }
}
