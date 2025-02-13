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
├── Dockerfile # To containerize the app
├── Jenkinsfile # Defines the pipeline for CI
├── Vagrantfile # Configures the virtual machines for deployment
├── inventory # Contains target machine details for Ansible
├── playbook.yml # Ansible playbook to automate deployment
└── app/ # Application code

---

## Project Workflow and Visualization
### Visulaiztion 
![image](https://github.com/user-attachments/assets/e8195169-3059-4a2e-b44f-9df3bec07b1e)

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
    - Example:
      ![Website Screenshot](https://github.com/user-attachments/assets/0ee62dbb-1691-4a12-b2a8-2136d6ab91b6)

---

## Contact

If you encounter any issues, feel free to contact me at:  
 **Email**: om039919@gmail.com

---

### Notes:
- Replace placeholder image URLs with actual links to your images.
- Ensure all paths and configurations match your project setup.
