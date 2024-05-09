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