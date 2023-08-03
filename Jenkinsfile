pipeline{
    agent {label 'master'}
    stages{
        stage('TF Init'){
            steps{
                sh '''
                cd terraform-file/
                terraform init
                '''
            }
        }
        stage('TF Plan'){
            steps{
                sh '''
                cd terraform-file/
                terraform plan -out createkvm
                '''
            }
        }

        stage('Approval') {
            steps {
                script {
                    def userInput = input(id: 'Approve', message: 'Do you want to Approve?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
                }
           }
        }
        stage('TF Apply'){
            steps{
                sh '''
                cd terraform-file/
                terraform apply createkvm
                '''
            }
        }
    }
}
