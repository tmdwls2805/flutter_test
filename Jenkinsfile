pipeline {
    agent any

    environment {
        FLUTTER_HOME = '/opt/flutter' // Flutter 설치 경로
        PATH = "${FLUTTER_HOME}/bin:$PATH"
        ANDROID_HOME = '/opt/android-sdk' // Android SDK 설치 경로
        PATH = "${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/cmdline-tools/latest/bin:$PATH"
    }

    stages {
        stage('Setup') {
            steps {
                echo 'Setting up environment...'
                // Flutter 및 Android SDK 버전 확인
                sh 'flutter --version'
                sh 'flutter doctor'
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
