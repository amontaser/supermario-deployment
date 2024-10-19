#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        //  Jenkins will use the credentials added earlier
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        //  Stage 1
        stage("Create an EKS Cluster") {
            steps {
                script {
                    dir('terraform-eks-deployment') {
                        //  Jenkins will run these commands for us
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
        //  Stage 2
        stage("Deploy to EKS") {
            steps {
                script {
                    dir('kubernetes') {
                        sh "aws eks get-token --cluster-name supermario-eks-cluster | kubectl apply -f -"
                        sh "aws eks update-kubeconfig --name supermario-eks-cluster --region us-east-1"
                        sh "kubectl config view --raw"
                        sh "kubectl apply -f deployment.yaml -v=8"
                        sh "kubectl apply -f service.yaml -v=8"
                    }
                }
            }
        }
    }
}