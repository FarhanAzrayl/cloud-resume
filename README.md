<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/0f6ff6d5-8f18-4cbc-b378-a096593038e8" />


Clouud Resume Project

A serverless cloud resume built on AWS using Infrastructure as Code (Terraform).

This project aims to implement the aspects and services of AWS services with cost management in mind (due to this being a personal project).
Implementing cloud engineering practices including Infrastructure as Code, serverless architecture, automation, AWS services integration, and frontend/backend communication.


Live **Website** Demo

http://farhanazrayl-resume-2026.s3-website-ap-southeast-1.amazonaws.com

The styling and the aesthetics has yet to be upgraded or polished as the aim is to implement and showcase the implementation of AWS services for a production-like deployment.
I wil also be including the issues and troubles that I faced throughout the process and how I overcome them.

---


# Project Overview

The Cloud Resume Project is designed to demonstrate practical cloud engineering skills while at the same time displaying my basic resume information for any interested recruiters.

Instead of deploying infrastructure manually through the AWS Console, the entire cloud environment is provisioned and managed using Terraform.
However the console is opened from time to time for reference purposes.

The website is hosted on Amazon S3 and includes a dynamic visitor counter powered by API Gateway, AWS Lambda and Amazon DynamoDB.

In this project:

Technologies Involved Throughout the Project

Programming:
* HTML5
* CSS3
* JavaScript
* Python
* Terraform (HCL)

Development Tools:
* Visual Studio Code
* Git
* GitHub
* AWS CLI
* Git Bash

AWS Services Used
* Amazon S3
* AWS Lambda
* Amazon API Gateway
* Amazon DynamoDB
* AWS IAM
* CloudWatch Logs
* AWS STS

Infrastructure as Code | Infrastructure is managed using Terraform | Current Terraform resources include:

* S3 Bucket
* Static Website Configuration
* Bucket Versioning
* Server-side Encryption
* Bucket Ownership Controls
* Public Access Configuration
* Bucket Policy
* S3 Object Uploads
* Lambda Function
* IAM Role
* IAM Policies
* API Gateway
* DynamoDB Table
* Outputs

Features of the project:

* Static resume website hosted on Amazon S3
* Infrastructure provisioned using Terraform
* Dynamic visitor counter
* REST API using API Gateway
* Serverless backend using AWS Lambda
* Persistent visitor storage using DynamoDB
* Versioned S3 bucket
* Server-side encryption enabled
* Bucket ownership controls
* Git version control
* GitHub repository for source control

Simplified Visitor/User Counter Workflow:

Visitor opens website > JavaScript calls API Gateway > Lambda Function executes > DynamoDB increments count > Lambda returns latest count > Website displays updated visitor count


Skills Demonstrated

* Infrastructure as Code (Terraform)
* AWS Cloud Services
* Serverless Computing
* IAM Permissions
* REST API Development
* Static Website Hosting
* Cloud Security
* Version Control
* Cloud Debugging
* AWS CLI
* Problem Solving

Issues Faced and Lessons Learned:

Throughout this project I gained practical experience in:

* Designing serverless architectures
* Debugging IAM permission issues
* Terraform state management
* AWS API integration
* Lambda development
* DynamoDB data modelling
* Infrastructure automation
* End-to-end cloud deployment

Issue 1:
AWS IAM Permission Denied When Creating S3 Bucket

Cause:
The IAM user did not have permission to create S3 buckets because the Security Group it was associated with only had the AdministratorAccess policy, which was thought to be able access to all resources.

Solution: 
Added the Roles that are needed to execute the tasks necessary which in this case would be to create an S3 Bucket

Lesson Learned
Hammered down the concept that AWS or cloud computing in general uses the least privillege principle and roles and access should only be given when it is needed and suits the tasks being executed.




Issue 2:
Incorrect AWS Region Configuration

Terraform planned resources in: ap-southeast-5 (Malaysia) instead of the more proper ap-southeast-1 (Singapore)

Solution:
Changed to aws_region = "ap-southeast-1" for Singapore as I have learned that eventhough the Malaysian server is closer and technically is better, I was advised by groups online to use the Singapore to avoid complications as services could differ throughout regions and Malaysia is relatively new.

Lesson Learned
Keep configuration centralized using Terraform variables and prevent from using hardcodes as much as possible and to learn that familiar and a more mature server is also a factor in choosing a region.




Issue 3:
Terraform returned: Duplicate resource "aws_s3_bucket"

Cause
The same resource was declared in twice in main.tf and s3.tf. s3.tf was created to not overuse the main and a convoluted string of codes which could cause confusion.

Solution
Optimize and organize .tf files in accordance with their functions

Lesson Learned
Strengthens the knowledge and understanding that Terraform reads resources from any .tf files and duplicates could happen if not careful.
Learned that separation in accordance with tasks is very much needed especially in a production-level which would include a large amount of resources and will be shared amongst teams hence separation and readability matters.




Issue 4:
S3 bucket did not have a bucket policy allowing anonymous read access.

Solution:

Configured the below:
- Website hosting
- Public access settings
- Bucket policy allowing s3:GetObject

Lesson Learned
Disabling "Block Public Access" alone does not make an S3 bucket public and access should be given specifically only when needed; again strenghening the principle of least privillege.




Issue 5:
Lambda Returned HTTP 500 Errors. API Gateway returned: 500 Internal Server Error

Cause
The Lambda function was failing during execution.

Solution
Used CloudWatch Logs to inspect Lambda execution and identify the underlying error.

Lesson Learned
CloudWatch is one of the primary debugging tools for AWS serverless applications.




Issue 6:
Visitor Counter Returned "undefined". The frontend displayed: "undefined" instead of the visitor count.

Cause
The JavaScript expected a different JSON structure than the API returned.

Solution
Updated the frontend JavaScript to correctly parse the response and added error handling using:

Lesson Learned
Be very observant and keep an eye out for even tiny discrepancies as Frontend and backend contracts must match exactly.




Issue 7:
API Endpoint Misconfiguration - The website attempted to call an incorrect API endpoint.

Cause
The JavaScript was pointing to the wrong URL.

Solution
Updated the frontend to use the correct API Gateway endpoint.

Lesson Learned
Always verify API endpoints after deployment or infrastructure changes.




Issue 8:
Missing CloudWatch Logging Permissions: Lambda execution logs were unavailable, making debugging difficult.

Cause
The Lambda execution role lacked CloudWatch logging permissions.

Solution
Attached the required IAM permissions allowing Lambda to create log groups and write log streams.

Lesson Learned
Pre-emptive configuration for logging should be exercised to simplify troubleshooting.


Author

**Farhan Azrayl Zailani**

GitHub:
https://github.com/FarhanAzrayl

LinkedIn:
https://www.linkedin.com/in/farhan-azrayl-zailani/
