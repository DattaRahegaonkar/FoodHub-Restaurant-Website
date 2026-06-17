pipeline{
    agent any

    stages{
        stage('Cloning into Jenkins-Master'){
            steps{
                git branch: 'main', url: 'https://github.com/DattaRahegaonkar/FoodHub-Restaurant-Website.git'
            }
        }
        stage('Test'){
            steps{
                echo 'Testing...'
            }
        }
        stage('Deploy'){
            steps{
                echo 'Deploying...'
            }
        }
    }
}