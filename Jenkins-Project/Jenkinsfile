pipeline {
    agent any
    environment {
        AWS_ACCOUNT_ID = '058264318400'
        AWS_REGION = 'us-east-1'
        ECR_REPO_NAME1 = 'nodejs-image'
        ECR_REPO_NAME2 = 'postgres-image'
        ECR_REPO_NAME3 = 'react-images'
        DOCKER_IMAGE_TAG = "${env.BUILD_NUMBER}"
    }
    stages {
        stage('Create Infra') {
            steps {
                script {
                    // Terraform key ve altyapı oluşturma
                    sh '''
                    terraform init
                    terraform apply -auto-approve
                    '''
                }
            }
        }

        stage('Wait for Image Push') {
            steps {
                script {
                    // Docker image'ların ECR'a itilmesinden sonra bekleme
                    sleep time: 300, unit: 'SECONDS'
                }
            }
        }

        
        stage('Deploy App with Ansible') {
            steps {
                script {
                    // Ansible playbook kullanarak deploy
                    sh '''
                    ansible-playbook -i /home/ec2-user/Jenkins-Project/inventory_aws_ec2.yml playbook.yml
                    '''
                }
            }
        }
    }
}
