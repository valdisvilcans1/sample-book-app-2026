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
                    deploy("DEV", 1010)
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
                    deploy("STG", 2020)
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
                    deploy("PRD", 3030)
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
    // bat "npm install pm2"
    echo "Dependencies successfully installed.."
}

def deploy(String environment, int port) {
    echo "Deployment to ${environment} environment has started.."
    git branch: 'main', poll: false, url: 'https://github.com/valdisvilcans1/sample-book-app-2026.git'
    bat "npm install"
    bat  "dir"
    bat  "node_modules\\.bin\\pm2 delete books-${environment} || exit 0"
    bat  "node_modules\\.bin\\pm2 start -n books-${environment} index.js -- ${port}"
    echo "Deployment to ${environment} environment finished.."
}

def test(String environment) {
    echo "Testing Sample Book Application service has started on ${environment} environment.."
    git branch: 'main', poll: true, url: 'https://github.com/mtararujs/RTU-sample-API-automation-2026.git'
    bat "npm install"
    bat "npm run books BOOKS_${environment}"
    echo "Testing Sample Book Application service finished.."
}