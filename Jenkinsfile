pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                // sh 'pytest -v'
                sh 'env'
            }
        }
        // stage('Build_push_docker_image') {
        //     steps {
        //         @BUILD_ID
        //         sh 'docker build -f Dockerfile -t app:BUILD_ID .'
        //         echo "Build by  Jinkins Build#" @BUILD_ID 
        //         echo @BUILD_ID
        //     }
        // }
        // stage('Deploy') {
        //     steps {
        //         echo 'Deploy....'
        //     }
        // }
    }
}
