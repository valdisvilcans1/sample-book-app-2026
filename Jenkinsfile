pipeline {
    agent any
    triggers { 
        pollSCM('*/1 * * * *') 
    }
    stages {
        stage('build-install-deps') {
            steps {
                echo "Installing all necessary node dependencies.."
            }
        }
        stage('deploy-dev') {
            steps {
                echo "Deployment to DEV environment has started.."
                echo "Deployment to DEV environment finished.."
            }
        }
        stage('test-dev') {
            steps {
                echo "Testing Sample Book Application service has started on DEV environment.."
                echo "Testing Sample Book Application service finished.."
            }
        }
        stage('deploy-stg') {
            steps {
                echo "Deployment to STG environment has started.."
                echo "Deployment to STG environment finished.."
            }
        }
        stage('test-stg') {
            steps {
                echo "Testing Sample Book Application service has started on STG environment.."
                echo "Testing Sample Book Application service finished.."
            }
        }
        stage('deploy-prd') {
            steps {
                echo "Deployment to PRD environment has started.."
                echo "Deployment to PRD environment finished.."
            }
        }
        stage('test-prd') {
            steps {
                echo "Testing Sample Book Application service has started on PRD environment.."
                echo "Testing Sample Book Application service finished.."
            }
        }
    }
}
