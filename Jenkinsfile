pipeline {
    agent any

    parameters {
        choice(name: 'Action', choices: ['Apply', 'Destroy'], description: 'Terraform Action')
    }

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/anuragkonnakkal-lab/Intergration-with-Jenkins-and-Terraform.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply/Destroy') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'aws-creds', usernameVariable: 'AKIAYZAWWJJPYP4NQK7B', passwordVariable: 'DdkwZaE6MaTO22Vxv4yr8vVuoxWSBLTIlmC/KCti')]) {
                    script {
                        if (params.Action == 'Apply') {
                            sh 'terraform apply -auto-approve'
                        } else {
                            sh 'terraform destroy -auto-approve'
                        }
                    }
                }
            }
        }
    }
}
