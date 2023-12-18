node {
	checkout scm
	stage('Docker Processing'){
		docker.withRegistry('', 'dockerhub') {

			echo "Attempting to build Docker Image"
			def newDockerImage = docker.build("rhyshood/coursework2:${env.BUILD_ID}")
	
			echo "Docker Image Build: SUCCESS"
	
			echo "Attempting to test Docker Image"    
			newDockerImage.inside {
				echo "Docker Image Test: SUCCESS"
			}

			echo "Attempting DockerHub push"

			sh "docker image push rhyshood/coursework2"	

			echo "DockerHub Push: SUCCESS"
		}
	}
}
