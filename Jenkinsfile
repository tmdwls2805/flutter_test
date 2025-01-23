pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                // Flutter 프로젝트 빌드를 위해 추가
                sh 'flutter build apk --debug' // 또는 필요한 빌드 명령
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                // Flutter 테스트 실행
                sh 'flutter test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying..'
                // 배포 작업 추가
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished!'
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
