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
        stage("jfrog upload"){
            steps{
                rtUpload(
                    serverId: 'kiranjfrog',
                    spec: '''{
                        "files": [
                            {
                                "pattern": "**/**/*.war",
                                "target": "amazon2-libs-snapshot/com/"
                            }
                        ]
                    }'''
                )
            }
        }
        stage("docker build"){
            steps{
                sh "docker build -t kirandocker1994.azurecr.io/amazon:v1 ."
            }
        }
        stage("docker push to ACR"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'ACR', passwordVariable: 'pwd', usernameVariable: 'user')]) {
                    sh "docker login -u ${user} -p ${pwd} kirandocker1994.azurecr.io"
                    sh "docker push kirandocker1994.azurecr.io/amazon:v1"
                }
            }
        }
    }
}