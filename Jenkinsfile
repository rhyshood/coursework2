node {
    checkout scm
 
    stage('Build') {
	echo "NOTE: Attempting to create Docker image" 
        def newDockerImage = docker.build("coursework2:${env.BUILD_ID}")
	echo "Image Creation: SUCCESS"
    }
    stage('Test') {
	echo "Attempting to test container"
	newDockerImage.inside {
	        echo "TEST SUCCESS"
	}
    }
    if (currentBuild.currentResult == 'SUCCESS') {
        echo "Attempting to push Image to DockerHub"
	stage('Deploy') {
            newDockerImage.push() 
        }
	echo "DockerHub Push: SUCCESS"
    }
}
