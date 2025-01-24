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

        stage('Validate Branch') {
            steps {
                script {
                    // 현재 브랜치 이름 가져오기
                    def branchName = sh(returnStdout: true, script: "git rev-parse --abbrev-ref HEAD").trim()
                    
                    // master 브랜치인지 확인
                    if (branchName != 'master') {
                        error "Build skipped: Current branch is '${branchName}', not 'master'."
                    } else {
                        echo "Proceeding with build for master branch."
                    }
                }
            }
        }

        stage('Test') {
            when {
                branch 'master' // master 브랜치일 때만 실행
            }
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
