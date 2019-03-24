pipeline {
  agent any
  tools { 
        maven 'Maven'
        jdk 'JAVA_HOME'
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
        sh 'cd hellow-world && mvn -B -DskipTests clean package'
        sh 'echo $USER'
        sh 'echo whoami'
      }
    }
    stage('Docker Build') {
      steps {
        sh 'cd hellow-world && /usr/bin/docker build -t thamarana/helloworld1:latest .'
      }
    }
    stage('Push image') {
      steps {
        withDockerRegistry([credentialsId: 'docker-hub-credentials', url: "https://index.docker.io/v1/"]) {
          sh '/usr/bin/docker push thamarana/helloworld1:latest'
        }
      }
    }
  }
}
