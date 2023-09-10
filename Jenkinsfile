pipeline {
environment {
registry = "durairajsekar/simplehtml"
registryCredential = 'docker_cred'
dockerImage = ''
}
agent any
stages {
stage('Cloning our Git') {
steps {
git branch: "gh-pages", url: 'https://github.com/DURAIRAJ17996/beginner-html-site-styled.git'
}
}
stage('Building our image') {
steps{
script {
dockerImage = docker.build registry + ":$BUILD_NUMBER"
}
}
}
stage('Deploy our image') {
steps{
script {
docker.withRegistry( '', registryCredential ) {
dockerImage.push("latest")
}
}
}
}
stage('Deploy Docker Container') {
            steps {
                script {
                        try {
                             sh "docker stop jenkinsdeployedme"
                             sh "docker rm jenkinsdeployedme"
                         } catch (Exception e) {
                            // Ignore errors if the container is not running or encounters other issues
                            echo "No container running with name jenkinsdeployedme"
                        }
                    // Deploy the Docker container using Docker CLI or a container orchestration tool (e.g., Kubernetes, Docker Compose)
                    sh "docker pull durairajsekar/simplehtml"
                    sh "docker run -d --name jenkinsdeployedme -p 8052:80 durairajsekar/simplehtml"
                }
            }
        }
stage('Cleaning up') {
steps{
sh "docker rmi $registry:$BUILD_NUMBER"
}
}
}
}