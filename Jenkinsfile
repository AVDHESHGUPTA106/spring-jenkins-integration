pipeline { 
    environment { 
        registry = "avdheshgupta106/spring-jenkins-integration" 
        registryCredential = 'docker-hub' 
        dockerImage = '' 
    }
    agent any 
    stages { 
        stage('Cloning our Git') {
            when { branch 'main' }
            steps { 
                git 'https://github.com/AVDHESHGUPTA106/spring-jenkins-integration.git' 
            }
        } 
        stage('Building our image') {
            when { branch 'main' }
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