node {
    checkout scm 
    stage('Build') {
	echo "Attempting to build Docker Image"
        def newDockerImage = docker.build("coursework2:${env.BUILD_ID}")
	
	echo "Docker Image Built"
    
	newDockerImage.inside {
		echo "Testing Program"
		sh 'curl localhost:8080'
	}

	if (currentBuild.currentResult == 'SUCCESS') {
		echo "Attempting DockerHub push"
		newDockerImage.push() 
	}
    }
}
