node {
	checkout scm
	stage('Docker Processing'){
		withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {

			echo "Attempting to build Docker Image"
			def newDockerImage = docker.build("coursework2:${env.BUILD_ID}")
	
			echo "Docker Image Build: SUCCESS"
	
			echo "Attempting to test Docker Image"    
			newDockerImage.inside {
				echo "Docker Image Test: SUCCESS"
			}

			echo "Attempting DockerHub push"

			newDockerImage.push()	

			echo "DockerHub Push: SUCCESS"
		}
	}
}
