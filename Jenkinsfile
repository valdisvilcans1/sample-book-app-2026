pipeline {
    agent any
    triggers { 
        pollSCM('*/1 * * * *') 
    }
    stages {
        stage('build-install-deps') {
            when {
                not {
                    changeset "README.md"
                }
            }
            steps {
                script{
                    build()
                }
            }
        }
        stage('deploy-dev') {
            steps {
                script{
                    deploy("dev")
                }
            }
        }
        stage('test-dev') {
            steps {
                script{
                    test("DEV")
                }
            }
        }
        stage('deploy-stg') {
            steps {
                script{
                    deploy("stg")
                }
            }
        }
        stage('test-stg') {
            steps {
                script{
                    test("STG")
                }
            }
        }
        stage('deploy-prd') {
            steps {
                script{
                    deploy("stg")
                }
            }
        }
        stage('test-prd') {
            steps {
                script{
                    test("PRD")
                }
            }
        }
    }
}

def build(){
    echo "Building sample-book-app.." 
    sh "docker build -t mtararujs/sample-book-app:${BUILD_NUMBER} ."
   
    echo "Pushing image to docker registry.." 
    sh "docker push mtararujs/sample-book-app:${BUILD_NUMBER}"
}

def deploy(String environment){
    echo "Deployment to ${environment} environment has started.."
    sh "docker pull mtararujs/sample-book-app:${BUILD_NUMBER}"
    sh "docker compose stop sample-book-app-${environment}"
    sh "docker compose rm sample-book-app-${environment}"
    sh "docker compose up -d sample-book-app-${environment}"
    echo "Deployment to ${environment} environment finished.."
}

def test(String environment){
    // echo "Testing Sample Book Application service has started on ${environment} environment.."
    // git branch: 'main', poll: false, url: 'https://github.com/mtararujs/RTU-sample-API-automation-2026.git'
    // sh "npm install"
    // sh "npm run books BOOKS_${environment}"
    // echo "Testing Sample Book Application service finished.."
}
