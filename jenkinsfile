pipeline {
  agent any
  triggers {
    // Trigger the build every 10 seconds
    poll(10)
  }
  stages {
    stage('Build') {
      steps {
        // Build the application
        sh 'cd app && mvn clean install'
      }
    }
    stage('Test') {
      steps {
        // Run Django tests
        sh 'cd app && pytest'
        // Check for 200(OK) response when trying to access the app
        sh 'curl -s http://localhost:5000/ | grep "200 OK"'
      }
    }
    stage('Deploy') {
      when {
        expression { success }
      }
      steps {
        // Push the image new version to Artifact Registry repository
        sh 'docker push gcr.io/<your-project-id>/app:latest'
        // Deploy the updated app to production cluster
        // TODO: Implement this step
      }
    }
    stage('Post-Build') {
      when {
        expression { failure }
      }
      steps {
        // Print "the pipeline failed :( "
        echo "the pipeline failed :("
      }
    }
  }
}
