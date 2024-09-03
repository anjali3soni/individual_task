// pipeline {
//     agent any

//     parameters {
//         choice(name: 'TASK', choices: ['Create User', 'Delete User', 'Group Add', 'Install Packages', 'Run Docker Container'], description: 'Select the task to perform')
//         string(name: 'USERNAME', defaultValue: '', description: 'Username for creation operations')
//         string(name: 'USERNAME_DEL', defaultValue: '', description: 'Username for deletion operations')
//         string(name: 'GROUPNAME', defaultValue: '', description: 'Comma-separated list of groups for user creation')
//         string(name: 'PACKAGE', defaultValue: '', description: 'Comma-separated list of packages to install')
//         string(name: 'CONTAINER_NAME', defaultValue: '', description: 'Name of the Docker container')
//         string(name: 'IMAGE_NAME', defaultValue: '', description: 'Docker image name')
//         string(name: 'HOST_PORT', defaultValue: '', description: 'Host port for Docker container')
//         string(name: 'CONTAINER_PORT', defaultValue: '', description: 'Container port for Docker container')
//     }

//     stages {
//         stage('Download Code from GitHub') {
//             steps {
//                 git branch: 'main', url: 'https://github.com/anjali3soni/individual-task.git'
//             }
//         }

//         stage('Execute Task') {
//             steps {
//                 sh """
//                     case "${TASK}" in
//                         'Create User')
//                             ansible-playbook -i inventory playbook.yml -e "username=${params.USERNAME} state=present groups=${params.GROUPNAME}" --become
//                             ;;
//                         'Delete User')
//                             ansible-playbook -i inventory playbook.yml -e "username=${params.USERNAME_DEL} state=absent" --become
//                             ;;
//                         'Group Add')
//                             ansible-playbook -i inventory playbook.yml -e "groupname=${params.GROUPNAME} state=present" --become
//                             ;;
//                         'Install Packages')
//                             ansible-playbook -i inventory playbook.yml -e "packages=${params.PACKAGE}" --become
//                             ;;
//                         'Run Docker Container')
//                             ansible-playbook -i inventory playbook.yml -e "container_name=${params.CONTAINER_NAME} image_name=${params.IMAGE_NAME} host_port=${params.HOST_PORT} container_port=${params.CONTAINER_PORT}" --become
//                             ;;
//                         *)
//                             echo "Invalid task selected"
//                             exit 1
//                             ;;
//                     esac
//                 """
//             }
//         }
//     }
// }

// pipeline {
//     agent any
    
//     stages{
//         stage('Download Code from GitHub') {
//             steps {
//                 git branch: 'main', url: 'https://github.com/anjali3soni/individual-task.git'
//             }
//         }
//         stage('firstStage') {
//             steps{
//                 sh '/var/lib/jenkins/workspace/ind-task/script.sh'
//             }
//         }
//     }
// }



pipeline {
    agent any

    
    stages {
        stage('Download code from github'){
            steps{
                git branch: 'main', url: 'https://github.com/anjali3soni/individual-task.git'
            }
        }
        stage('Process Inputs') {
            steps {
                script {
                    echo "Selected Task: ${params.task}"
                    echo "Entered Values: ${params.values}"

                    sh 'chmod +x ./script.sh'
                    
                    task = params.task
                    values = params.values.split(',')
                    
                    param1 = values.size() > 0 ? values[0] : ''
                    param2 = values.size() > 1 ? values[1] : ''
                    param3 = values.size() > 2 ? values[2] : ''
                    param4 = values.size() > 3 ? values[3] : ''
                    
                    sh "./script.sh '${task}' '${param1}' '${param2}' '${param3}' '${param4}'"

                }
            }
        }
    }
}



