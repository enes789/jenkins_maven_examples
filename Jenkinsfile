pipeline {

    agent any

    environment {
	PASS = credentials('register-pass')
    }

    stages {

        stage('Build') {
            steps {
                sh '''
                   ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
		   ./jenkins/build/build.sh
                '''
            }
	  
	    post {
		success {
		    archiveArtifacts artifacts: 'build/libs/**/*.jar', fingerprint: true
		}
	    }
        }

        stage('Test') {
            steps {
                sh './jenkins/test/mvn.sh mvn test'
            }
	
	    post {
                always {
                    junit 'java-app/target/surefire-reports/*.xml'
                }
            }

	}

        stage('Push') {
            steps {
                sh './jenkins/push/push.sh'
            }
        }

        stage('Deploy') {
            steps {
                sh './jenkins/deploy/deploy.sh'
            }
        }
    }
}
