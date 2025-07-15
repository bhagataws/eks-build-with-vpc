# eks-build-with-vpc

## Kubeconfig download 

```bash
export cluster_name=demo
aws eks update-kubeconfig --region ap-south-1 --name $cluster_name --kubeconfig ${cluster_name}-cluster-kubeconfig
```