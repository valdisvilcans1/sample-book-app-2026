pipeline {
    agent any
    triggers { 
        pollSCM('*/1 * * * *') 
    }
    stages {
        stage('build-install-deps') {
            steps {
                echo "Installing all necessary node dependencies.."
                script {
                    build()
                }
            }
        }
        stage('deploy-dev') {
            steps {
                script {
                    deploy("DEV")
                }
            }
        }
        stage('test-dev') {
            steps {
                script {
                    test("DEV")
                }
            }
        }
        stage('deploy-stg') {
            steps {
                script {
                    deploy("STG")
                }
            }
        }
        stage('test-stg') {
            steps {
                script {
                    test("STG")
                }
            }
        }
        stage('deploy-prd') {
            steps {
                script {
                    deploy("PRD")
                }
            }
        }
        stage('test-prd') {
            steps {
                script {
                    test("PRD")
                }
            }
        }
    }
}

def build() {
    echo "Installing all necessary node dependencies.."
    bat "npm install"
    bat "dir"
}

def deploy(String environment) {
    echo "Deployment to ${environment} environment has started.."
    echo "Deployment to ${environment} environment finished.."
}

def test(String environment) {
    echo "Testing Sample Book Application service has started on ${environment} environment.."
    echo "Testing Sample Book Application service finished.."
}