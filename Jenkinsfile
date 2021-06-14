pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                sh 'pip install -r requirements.txt'
                sh '/var/lib/jenkins/.local/bin/pytest -v'
                
            }
        }
        stage('Build_docker_image') {
            steps {
                sh 'docker build -f Dockerfile -t app:$GIT_COMMIT .'
                
            }
        stage('Push_docker_image') {
            steps {
                withDockerRegistry(credentialsId: 'dockerhub_cred_jenkins', url: 'https://index.docker.io/v1/'){
                    sh '''
                        docker push kotovak/app:$GIT_COMMIT' 
                   '''
                }    
                
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploy....'
            }
        }
    }
}
