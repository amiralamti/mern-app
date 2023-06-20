pipeline {
  agent any
  stages {
    stage('Build Docker Image 1') {
      steps {
        sh 'docker build -t amiralamti/ui ui/'
        }
      }
    }
    stage('Push Docker Image 1 to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'auth_dockerhub', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
          sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
          sh "docker push amiralamti/ui"
        }
      }
    }
    stage('Build Docker Image 2') {
      steps {
        script {
          sh 'docker build -t amiralamti/api api/'
        }
      }
    }
    stage('Push Docker Image 2 to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'auth_dockerhub', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
          sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
          sh "docker push amiralamti/api"
        }
      }
    }
  }
}

