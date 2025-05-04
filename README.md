
# AWS Infrastructure Setup for EXIF Cleaner Lambda 🚀

Welcome to the **AWS Infrastructure Setup for EXIF Cleaner Lambda** project! This project provides a clean, secure, and scalable way to deploy an AWS Lambda function for EXIF metadata cleaning, utilizing best practices like HashiCorp Vault for secrets management 🔐, AWS IAM roles, and environment configurations 🌐.

This project leverages **Terraform** to provision infrastructure and is fully modularized for easy customization and reusability. 🌟

---

## 🛠️ **Features**

- **Lambda Function** 💻: Deploys a Lambda function that processes EXIF data.
- **IAM Roles** 🔑: Automates the creation of IAM roles, policies, and user management.
- **S3 Buckets** 📦: Manages S3 buckets with read/write and read-only permissions.
- **HashiCorp Vault** 🔒: Secures sensitive environment variables such as database credentials and API keys.
- **Modular Structure** 📂: Clean, modular Terraform code for better scalability and maintenance.
  
---

## 🌍 **Deployment Overview**

This project will automatically:

1. Set up an **IAM role** for AWS Lambda with the required permissions.
2. Deploy an **AWS Lambda function** for EXIF metadata cleaning.
3. Set up **S3 buckets** for storing files.
4. Retrieve and inject sensitive data (e.g., DB credentials) into Lambda from **HashiCorp Vault**.
5. Create **IAM users** with specific access to buckets.
6. Ensure the environment is secure by never hardcoding sensitive data 🔑.

---

## 🔧 **How to Get Started**

### Prerequisites 📝

- AWS account with sufficient permissions to create IAM roles, Lambda functions, and S3 buckets 🌍
- **Terraform** installed (v0.12 or later) 🔧
- **HashiCorp Vault** configured for storing secrets 🛡️
- **AWS CLI** configured with your credentials ⚡
  
### 1. Clone this repository 📥

```bash
git clone https://github.com/h3xDev-creative/aws-exif-cleaner-lambda.git
cd aws-exif-cleaner-lambda
```

### 2. Configure your environment variables 🌱

Create a `.env` file or use AWS CLI/HashiCorp Vault to provide necessary secrets, such as Lambda function names, S3 bucket names, and secret paths.

```bash
export AWS_PROFILE=your-aws-profile
export TF_VAR_lambda_function_name="lambda_exif_cleaner"
export TF_VAR_environment="dev"
export TF_VAR_s3_bucket_name="exif-cleaner-bucket"
```

> Note: Make sure you also configure your HashiCorp Vault path for Lambda secrets.

### 3. Initialize Terraform 💥

Run the following command to initialize Terraform:

```bash
terraform init
```

### 4. Apply the Terraform plan 🏗️

Run the command below to apply the plan and deploy your infrastructure:

```bash
terraform apply
```

You will be prompted to confirm the actions, type `yes` to proceed.

---

## 📜 **License**

This project is licensed under the **GNU General Public License v2.0** - see the [LICENSE](LICENSE) file for details.

---

## 🤝 **Contributing**

Feel free to fork this project, submit pull requests, or open issues if you encounter any bugs or have new feature requests. Your contributions are always welcome!

---

## 👨‍💻 **Developed By**

Made with ❤️ by **James vince**

---

## 🐛 **Issues and Feedback**

If you encounter any issues or have suggestions for improvements, please open an issue on the [GitHub repository](https://github.com/yourusername/aws-exif-cleaner-lambda/issues).

---

## 📚 **Additional Resources**

- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS Lambda Documentation](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)
- [HashiCorp Vault Documentation](https://www.vaultproject.io/docs)

---

### 🌟 **Enjoy your secure and scalable AWS Lambda deployment!** 🌟
