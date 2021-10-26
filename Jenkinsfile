pipeline {
    agent none
    stages {
        stage('build') {
            agent {
                docker { image 'node' }
            }
            steps {
               sh 'node -v'
               sh 'now=`date`; echo "<h1>${now}</h1>" > now.html'
            }
        }
        stage('deploy') {
            agent any
            steps {
               sh 'docker cp now.html static_files:/app/public'
            }
        }
    }
}
