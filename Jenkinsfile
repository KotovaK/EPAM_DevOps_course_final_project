pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                sh 'pytest -v'
                
            }
        }
        stage('Build_push_docker_image') {
            steps {
                sh 'docker build -f Dockerfile -t app:$GIT_COMMIT .'
                echo "Build by  Jinkins Build#" $GIT_COMMIT
               
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploy....'
            }
        }
    }
}
