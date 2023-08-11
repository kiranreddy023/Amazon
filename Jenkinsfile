pipeline{
    agent {
        label "slave"
    }
    tools{
        maven 'maven-3.6.3'
        docker 'docker1'
    }
    stages{
        stage("unit test"){
            steps{
                sh "mvn clean test"
            }
        }

        stage("sonarqube build"){
            steps{
                withSonarQubeEnv('kiransonarqube') {
                    sh "mvn clean package sonar:sonar"
                }
            }
        }
        stage("docker build"){
            steps{
                sh "docker build -t kirandocker1994.azurecr.io/amazon:v1 ."
            }
        }
    }
}