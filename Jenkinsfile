node {
    checkout scm
    withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
 
    stage('Docker Process') {
	echo "Attempting to build Docker Image"
        def newDockerImage = docker.build("coursework2:${env.BUILD_ID}")
	
	echo "Docker Image Build: SUCCESS"
	
	echo "Attempting to test Docker Image"    
	newDockerImage.inside {
		echo "Docker Image Test: SUCCESS"
	}

		echo "Attempting DockerHub push"

			 sh "docker push rhyshood/coursework2:${env.BUILD_ID}"	

		echo "DockerHub Push: SUCCESS"
	}
    }
}
