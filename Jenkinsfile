node { 
    stage('Build') { 
        def newDockerImage = docker.build("coursework2:${env.BUILD_ID}")
    }
    stage('Test') {
	newDockerImage.inside {
	        sh 'curl localhost:8080'
	}
    }
    if (currentBuild.currentResult == 'SUCCESS') {
        stage('Deploy') {
            newDockerImage.push() 
        }
    }
}
