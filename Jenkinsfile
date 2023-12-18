node {
	checkout scm
	stage('Docker Processing'){
		docker.withRegistry('', 'dockerhub') {

			echo "Attempting to build Docker Image"
			def newDockerImage = docker.build("rhyshood/coursework2:latest")
	
			echo "Docker Image Build: SUCCESS"
	
			echo "Attempting to test Docker Image"    
			newDockerImage.inside {
				echo "Docker Image Test: SUCCESS"
			}

			echo "Attempting DockerHub push"

			sh "docker image push rhyshood/coursework2:latest"	

			echo "DockerHub Push: SUCCESS"
	
			echo "Attempting to Update Kubernetes"

			sh "ssh ubuntu@44.201.134.38 kubectl set image deployments/coursework2 coursework2=rhyshood/coursework2"

			echo "Update Kubernetes: SUCCESS" 
		}
	}
}
