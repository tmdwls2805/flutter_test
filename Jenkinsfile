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
                    // GIT_BRANCH 환경 변수 활용
                    def branchName = env.GIT_BRANCH ?: 'unknown'

                    // 'origin/' 제거 (필요한 경우)
                    if (branchName.startsWith('origin/')) {
                        branchName = branchName.replace('origin/', '')
                    }

                    echo "Triggered by branch: ${branchName}"

                    // master 또는 develop 브랜치 확인
                    if (branchName != 'master' && branchName != 'develop') {
                        error "Build skipped: Current branch is '${branchName}', not 'master' or 'develop'."
                    }
                }
            }
        }

        stage('Checkout Code') {
            steps {
                // 현재 브랜치 체크아웃
                script {
                    def branchName = env.GIT_BRANCH ?: 'unknown'

                    // 'origin/' 제거 (필요한 경우)
                    if (branchName.startsWith('origin/')) {
                        branchName = branchName.replace('origin/', '')
                    }

                    checkout([
                        $class: 'GitSCM',
                        branches: [[name: "*/${branchName}"]],
                        userRemoteConfigs: [[url: 'https://github.com/tmdwls2805/flutter_test.git']]
                    ])
                }
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
