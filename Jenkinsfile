pipeline{
    agent {label 'master'}
    stages{
        stage('TF Init'){
            steps{
                sh '''
                git clone 
                cd /data/projects/terraform/libvirt
                terraform init
                '''
            }
        }
        stage('TF Plan'){
            steps{
                sh '''
                cd /data/projects/terraform/libvirt
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
                cd /data/projects/terraform/libvirt
                terraform apply createkvm
                '''
            }
        }
    }
}
