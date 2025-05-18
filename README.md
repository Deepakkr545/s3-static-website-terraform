

## Static Website Hosting on AWS S3 using Terraform

This project showcases the use of **Terraform** to automate the deployment of a **static website on Amazon S3**. It follows Infrastructure as Code (IaC) principles to provision and configure all required AWS resources seamlessly.

### Key Highlights

* Provisions an S3 bucket and configures it for static website hosting.
* Uploads `index.html` and `error.html` pages to the S3 bucket.
* Applies a secure bucket policy to allow public read access without using deprecated ACLs.
* Demonstrates best practices in cloud infrastructure automation using Terraform.
* Ensures repeatability and consistency by managing the entire configuration through code.

### Technologies Used

* Terraform
* AWS S3
* AWS IAM (for access control)
* HTML (for web content)

### Use Case

This project is ideal for learning or demonstrating how to:

* Host a static website without using a traditional web server.
* Automate AWS infrastructure with Terraform.
* Apply secure access policies for public web content.


