# Azure CLI Configuration Guide

This guide will help you log into Azure, display your current account settings, and set a specific subscription as your active subscription. Follow these steps to configure your Azure CLI environment.

## Steps

1. **Log into Azure**
   - Open your terminal or command prompt and execute the following command to log into Azure using the Azure CLI:
     ```bash
     az login
     ```
   - This command will open a web browser asking you to log in with your Azure credentials.

2. **Display Your Current Account Settings**
   - To view the current Azure account settings, including your subscription ID, run:
     ```bash
     az account show
     ```
   - This will output details of your currently selected subscription and other profile information.

3. **Set Your Subscription**
   - Once you have your subscription ID (from the output of the previous command), you can set it as the active subscription with this command:
     ```bash
     az account set --subscription "your_subscription_id"
     ```
   - Replace `"your_subscription_id"` with the actual ID of the subscription you want to use.

## Additional Notes

- These commands assume that you have the Azure CLI installed on your computer. If not, you can download and install it from the [Azure CLI official page](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).
- Make sure to replace placeholders (like `"your_subscription_id"`) with actual values from your Azure account.

Follow these steps to ensure your Azure CLI is configured to interact with the correct Azure resources.

## Create `terraform.tfvars` file

```hcl
resource_group_name = "my-rg"
location = "eastus"
subnet_name = "my-subnet"
aks_cluster_name = "my-aks-cluster"
node_count = 1
```

**Run**
```bash
terraform init
terraform apply
