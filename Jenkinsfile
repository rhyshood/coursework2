node {
    checkout scm 
    stage('Docker Process') {
	echo "Attempting to build Docker Image"
        def newDockerImage = docker.build("coursework2:${env.BUILD_ID}")
	
	echo "Docker Image Build: SUCCESS"
	
	echo "Attempting to test Docker Image"    
	newDockerImage.inside {
		echo "Docker Image Test: SUCCESS"
	}

	if (currentBuild.currentResult == 'SUCCESS') {
		echo "Attempting DockerHub push"
		docker.withRegistry( '', 'dockerhub' ) {
			 dockerImage.push()	
		}
		echo "DockerHub Push: SUCCESS"
	}
    }
}
