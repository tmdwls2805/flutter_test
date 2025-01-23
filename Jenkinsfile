pipeline {
    agent any

    stages {
        stage('Setup') {
            steps {
                echo 'Setting up environment...'
                // Git 안전 디렉토리 추가
                sh 'git config --global --add safe.directory /opt/flutter'
                // Flutter 버전 확인
                sh 'flutter --version'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                // Flutter 테스트 실행
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
