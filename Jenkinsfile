pipeline { 
    environment { 
        registry = "avdheshgupta106/spring-jenkins-integration" 
        registryCredential = 'docker-hub' 
        dockerImage = '' 
    }
    agent any 
    stages { 
        stage('Cloning our Git') {
            steps {
                git branch: 'main', credentialsId: '881d2f8c-a376-462d-8670-b09cd5f26528', url: 'https://github.com/AVDHESHGUPTA106/spring-jenkins-integration.git'
            }
        } 
        stage('Building our image') {
            steps {
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
        stage('Deploy our image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        } 
        stage('Cleaning up') { 
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER" 
            }
        } 
    }
}