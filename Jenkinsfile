pipeline {
    agent none
    environment {
        BUILD_NAME = 'build.html'
    }
    stages {
        stage('build') {
            agent {
                docker { image 'node' }
            }
            steps {
                sh 'node -v'
                sh 'now=`date -d "-5 hours"`; echo "<h1>${now}</h1>" > ${BUILD_NAME}'
            }
        }
        stage('deploy') {
            agent any
            steps {
                //sh "docker cp ${BUILD_NAME} static_files:/app/public"
                withAWS(region:'us-west-2',credentials:'aws-creds') {
                    s3Upload(file:"${BUILD_NAME}", bucket:'s3-jenkins-ui-app', path:"from/jenkins/${BUILD_NAME}")
                }
            }
        }
    }
}
