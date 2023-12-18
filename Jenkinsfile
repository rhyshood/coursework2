node { 
    stage('Build') { 
        def newDockerImage = docker.build("coursework2:${env.BUILD_ID}")
    
	newDockerImage.inside {
	        sh 'curl localhost:8080'
	}

	if (currentBuild.currentResult == 'SUCCESS') {
		newDockerImage.push() 
	}
    }
}
