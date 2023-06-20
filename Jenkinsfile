pipeline {
  agent any
 
  environment {
    DOCKERHUB_CREDENTIALS = credentials('auth_dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t amiralamti/api api/'
        sh 'docker build -t amiralamti/ui ui/'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push amiralamti/api'
        sh 'docker push amiralamti/ui'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}

