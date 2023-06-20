pipeline {
    agent any
    environment{
        image = "weather_app"
    }

    stages {
        stage('Github Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/RohanRusta21/Weather-App.git'
            }
        }
        stage('Building image') {
            steps{
                script {
                    docker.build("${image}")
                }
            }
        }
        stage('Run the Docker Image'){
            steps{
                sh "docker run -itd -p 3000:3000 ${image}"
            }
        }
    }
}
