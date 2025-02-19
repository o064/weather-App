# Weather App

CI/CD Deployment of a Web Application Using Jenkins, Docker, and Ansible. This project demonstrates how to build and deploy a simple web application on target machines using a Continuous Integration (CI) pipeline. The process involves containerizing the application, automating deployment using Vagrant and Ansible, and integrating Jenkins for pipeline execution.

---

## Requirements

- **Docker**
- **Vagrant**
- **Ansible**
- **Jenkins**
- **DockerHub**

---

## Project Directory Layout

weather-app/
- app/              Application source code
- Dockerfile        Defines the containerization of the app
- Jenkinsfile       CI/CD pipeline configuration for Jenkins
- Vagrantfile       Configures virtual machines for deployment
- inventory         Ansible inventory file with target machine details
- playbook.yml      Ansible playbook for automated deployment
- README.md         Project documentation and setup instructions


---

## Project Workflow and Visualization
### Visulaiztion 
![Copy of Diagram (1)](https://github.com/user-attachments/assets/6bac68d6-d3b3-41f3-9a82-6dc19fdebed5)



1. **Push Code to Private Repo**:
   - Ensure you have an API key from [OpenWeatherMap](https://openweathermap.org/api) and set it as `API_KEY` in `app.py`.

2. **Set Up Vagrant Machines**:
   - Launch two lightweight virtual machines using Vagrant.
   - Navigate to the directory containing the `Vagrantfile` and run:
     ```bash
     vagrant up
     ```

3. **Add VM Keys**:
   - Place your VM keys in the `/vms` directory.

4. **Edit Inventory**:
   - Update the `inventory` file with your VM IPs and key paths.

5. **Run Jenkins Pipeline**:
   - Create a new pipeline in Jenkins.
   - If your repository is private, add credentials to Jenkins.
   - Add the following configuration:
     ![Jenkins Configuration](https://github.com/user-attachments/assets/2d2a6f93-7748-46a9-a0dd-3f030a39e07d)
   - Ensure to edit `dockerhub` and `github` credentials and key paths if necessary.

6. **Jenkins Pipeline Flow**:
   - Pull code from a Git repository (requires credentials token).
   - Build a Docker image.
   - Push the image to Docker Hub.
   - Run the Ansible playbook to:
     - Install Docker on the target Vagrant machines.
     - Pull the Docker image from Docker Hub.
     - Run the Docker container on the target machines.

7. **Jenkins Pipeline Screenshots**:
   ![Jenkins Pipeline](https://github.com/user-attachments/assets/7ee47be0-347a-4fa2-afe8-ba50c8c80a84)

8. **DockerHub Image**:
   ![DockerHub Image](https://github.com/user-attachments/assets/e8b26347-01c1-4ff1-bf88-e62e515a1d26)

9. **Verify Container**:
   - Ensure your container is up and running:
     ```bash
     vagrant ssh <machine_name>
     docker ps
     ```
   - Example:
     ![Docker PS Output](https://github.com/user-attachments/assets/1eab9480-af0b-4367-a3d2-fe6926bfe2fd)

10. **Access the Website**:
    - Open a browser and navigate to:
      ```
      http://<your_machine_IP>:5000
      ```
    - vm 1
      ![Website Screenshot](https://github.com/user-attachments/assets/0ee62dbb-1691-4a12-b2a8-2136d6ab91b6)
    - vm 2
      <img width="943" alt="Screenshot 2025-02-11 223347" src="https://github.com/user-attachments/assets/6ad93444-55ca-4471-a153-8442a48b3b55" />

---
## Enabling Email Notifications in Jenkins

To enable email notifications in Jenkins, follow these steps:

### 1. Access Jenkins Settings
- Navigate to **Manage Jenkins** > **System**.

### 2. Configure SMTP Settings
- Scroll down to the **E-mail Notification** section and enter the following details:

  ```plaintext
  SMTP Server: smtp.gmail.com
  User Name: <Your Email ID>
  Password: <App Password>
  Use SSL: ✅ (Enable this option)
  SMTP Port: 465
  ````
### 3. Test Email Notification
- Click **Test configuration by sending a test email** to ensure everything is set up correctly.

  
### 4. Install the Mailexec Extension
- Go to **Manage Jenkins** > **Manage Plugins**.
- Search for **Mailexec Plugin**.
- Install and restart Jenkins if required.


### 5. Expected Outcomes
✅ **Success**
 ![WhatsApp Image 2025-02-14 at 16 32 31_94f3b100](https://github.com/user-attachments/assets/27364c65-9d69-42fb-9e70-d173a2964095)
❌ **failure**
 ![WhatsApp Image 2025-02-14 at 16 32 32_6e64c52e](https://github.com/user-attachments/assets/9c529100-7b00-4727-80ac-eafad7ddd41d)
 **Success:**
If the test email fails, ensure:
- The app password is correct (Google requires an app password instead of your normal password).
- Less secure app access is enabled for your email account (if applicable).
- Jenkins has access to the internet and can reach the SMTP server.
---



## Contact

If you encounter any issues, feel free to contact me at:  
 **Email**: om039919@gmail.com

---

### Notes:
- Replace placeholder image URLs with actual links to your images.
- Ensure all paths and configurations match your project setup.
