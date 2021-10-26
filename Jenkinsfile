pipeline {
    agent {
        docker { image 'python:3.7.12-alpine' }
    }
    stages {
        stage('build') {
            steps {
                echo 'building the application'
            }
        }
        stage('test'){
            steps {
                echo 'testing the application'
            }
        }
        stage('deploy') {
            steps {
                echo 'deploying the application'
            }
        }
    }
}
