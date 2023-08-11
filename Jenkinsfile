pipeline{
    agent {
        label "slave"
    }
    stages{
        stage("unit test"){
            steps{
                sh "mvn clean test"
            }
        }
    }
    stages{
        stage("sonarqube build"){
            steps{
                withSonarQubeEnv('kiransonarqube') {
                    sh "mvn clean package sonar:sonar"
                }
            }
        }
    }
}