pipeline {
  agent any
  stages {
    stage('Build Docker Image 1') {
      steps {
        script {
          def dockerImage = docker.build("amiralamti/front:ui", "-f ./Dockerfile .")
        }
      }
    }
    stage('Push Docker Image 1 to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'auth_dockerhub', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
          sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
          sh "docker push amiralamti/front:ui"
        }
      }
    }
    stage('Build Docker Image 2') {
      steps {
        script {
          def dockerImage = docker.build("amiralamti/back:api", "-f ./Dockerfile .")
        }
      }
    }
    stage('Push Docker Image 2 to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'auth_dockerhub', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
          sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
          sh "docker push amiralamti/back:api"
        }
      }
    }
  }
}

