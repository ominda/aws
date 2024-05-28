# Kubernetes Cluster deployment
## Plan
- Deploy AWS infrastructure 
    - VPC
    - two public subnets
    - two private subnets
    - Internet Gateway (IGW)
    - NAT gateway
    - public route table
    - private route table
    - Bastion host
    - Two worker nodes
        - Install kubeadm, kubelet, kubectl
    - One master node
        - Install kubeadm, kubelet, kubectl
    - Control Plane SG
    - Data plane SG

- Deploy Kubernetes cluster
    - Using kubeadm, deploy Kubernetes cluster
        - ***kubeadm init --ignore-preflight-errors=Mem*** (use the ignore flag, if you use less memory servers than recomended. As **root** user)
    - Join Worker nodes to the cluster
        - Execute this command on control plane ***kubeadm token create --print-join-command***
        - Execute output of above command on worker nodes as **root** user
    - Test the cluster
        - Execute this command in control plane ***kubectl run mypod --image busybox -l tire=frontend,env=dev -- sleep 1000***
        - Delete pod once testing done ***kubectl delete pod mypod***

- Test sample web application
    - Execute this command to deploy sample web application ***kubectl apply -f test_webapp-deployment.yaml***
        - 'test_webapp-deployment.yaml' can be found at the 'Kubernetes_manifests' folder
    - Deploy nginx pod and test the connectivity
        - ***kubectl run mytestpod --image nginx***
        - ***kubectl exec -n webapp mytestpod -- curl <IP of Service 'webapp-svc'>:8080***

- Ingress
    - Install helm
        - *wget https://get.helm.sh/helm-v3.15.1-linux-amd64.tar.gz*
        - *tar zxvf helm-v3.15.1-linux-amd64.tar.gz*
        - *sudo cp linux-amd64/helm /usr/local/bin/*

    - Install Ingress Controler
        - *helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx*
        - *helm install ingress-nginx ingress-nginx/ingress-nginx -n webapp --set controller.replicaCount=2     --set controller.nodeSelector."kubernetes\.io/os"=linux     --set defaultBackend.nodeSelector."kubernetes\.io/os"=linux*
    
    - Deploy Ingress
        - *kubectl apply -f ingress.yaml*
            - 'ingress.yaml' can be found at the 'Kubernetes_manifests' folder
            - If you get validation error, just delete the validation
                - *kubectl delete validatingwebhookconfigurations ingress-nginx-admission*
