pipeline{
    agent {
        label "slave"
    }
    tools{
        maven 'maven-3.6.3'
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
    }
}