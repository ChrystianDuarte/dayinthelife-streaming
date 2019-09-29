# Installation

This page describes the installation of the Day In the Streaming Life Workshop from the latest sources from GitHub.

## Installing using Ansible

We provide an Ansible playbook to install all the required components and software for this workshop.

Installing with Ansible requires creating an inventory file with the variables for configuring the system. Example inventory files can be found in the `support/install/ansible/inventory` folder.

### Prerequisites

If you want to install locally, please make sure to update your Ansible version to atleast 2.5 and CLI for OCP 4. 

### Procedure to install dil-streaming

The recommended way to install the workshop is running the ansible playbook from the OpenShift4 workshop cluster bastion machine. This is the fastest way to run the installer as it's already running in the cluster closest to the master node.

1. Provision the *OpenShift 4 Workshop* image in RHPDS.  Remember to take note of the *GUID* with your cluster environment variable.

1. Via the CLI, login to your newly provisioned OCP cluster using the `oc` command.

1. Git Clone the *dayinthelife streaming* Workshop installation repository.

    ```bash
    git clone https://github.com/RedHatWorkshops/dayinthelife-streaming.git
    ```
1. Change folder to installation base.

    ```bash
    cd dayinthelife-streaming/support/install/ansible/
    ```

1. Run the Ansible playbook. if you are running in bastion, please use sudo to have the right permission.

    ```
    bash ansible-playbook -i inventory/inventory.example playbooks/openshift/install.yaml
    ```
    Bastion: 
    
    ```
    sudo bash ansible-playbook -i inventory/inventory.example playbooks/openshift/install.yaml
    ```
