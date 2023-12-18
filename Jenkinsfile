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
		withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
			 sh "docker push rhyshood/coursework2"	
		}
		echo "DockerHub Push: SUCCESS"
	}
    }
}
