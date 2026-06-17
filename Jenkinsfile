pipeline{
    agent any
    
    environment {
        SERVER_IP      = '172.31.17.99'
        SSH_CREDENTIAL = 'target-server-ssh'
        REMOTE_USER    = 'ubuntu'
        REMOTE_PATH    = '/home/ubuntu/foodhub'
    }

    stages{
        stage('Cloning into Jenkins-Master'){
            steps{
                git branch: 'main', url: 'https://github.com/DattaRahegaonkar/FoodHub-Restaurant-Website.git'
            }
        }
        stage('SSH into Target-Server and transfer files'){
            steps{
                sshagent([SSH_CREDENTIAL]) {
                    sh """
                        ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${SERVER_IP} 'mkdir -p ${REMOTE_PATH}'
                        scp -o StrictHostKeyChecking=no -r * ${REMOTE_USER}@${SERVER_IP}:${REMOTE_PATH}/
                    """
                }
            }
        }
        stage('Deploy the application'){
            steps{
                sshagent([SSH_CREDENTIAL]) {
                    sh """
                        ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${SERVER_IP} '
                        sudo rm -rf /var/www/html/* && 
                        sudo mkdir -p /var/www/html/foodhub &&
                        sudo cp -r /home/ubuntu/* /var/www/html/foodhub/'
                    """
                }
            }
        }
    }
}