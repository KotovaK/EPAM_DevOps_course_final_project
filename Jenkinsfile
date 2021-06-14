pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                sh 'pip install -r requirements.txt'
                sh 'pytest -v'
                
            }
        }
        stage('Build_push_docker_image') {
            steps {
                sh 'docker build -f Dockerfile -t app:$GIT_COMMIT .'
             
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploy....'
            }
        }
    }
}
