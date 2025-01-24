pipeline {
    agent any

    environment {
        FLUTTER_HOME = '/opt/flutter'
        PATH = "${FLUTTER_HOME}/bin:${env.PATH}"
    }

    stages {
        stage('Setup') {
            steps {
                echo 'Setting up environment...'
                sh 'flutter --version'
            }
        }

        stage('Validate Event and Branch') {
            steps {
                script {
                    // 현재 브랜치 이름 가져오기
                    def branchName = sh(returnStdout: true, script: "git rev-parse --abbrev-ref HEAD").trim()

                    // GitHub Webhook 이벤트에서 PR인지 PUSH인지 확인
                    def isPullRequest = env.CHANGE_ID != null

                    if (isPullRequest) {
                        echo "Triggered by Pull Request: Target branch is '${env.CHANGE_TARGET}', Source branch is '${env.CHANGE_BRANCH}'."
                        if (env.CHANGE_TARGET != 'master') {
                            error "Build skipped: Pull Request target is not 'master'."
                        }
                    } else {
                        echo "Triggered by Push: Current branch is '${branchName}'."
                        if (branchName != 'master') {
                            error "Build skipped: Push branch is not 'master'."
                        }
                    }

                    echo "Validation passed. Proceeding with build..."
                }
            }
        }

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'flutter test'
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed!'
        }
        success {
            echo 'Tests passed successfully!'
        }
        failure {
            echo 'Tests failed!'
        }
    }
}
