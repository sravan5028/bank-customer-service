pipeline {
  agent any
  tools { 
        maven 'maven'
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
      // withSonarQubeEnv('sonarqube') {
       sh 'mvn clean package'
      // sh 'mvn -B -DskipTests clean package'
             }
    }
