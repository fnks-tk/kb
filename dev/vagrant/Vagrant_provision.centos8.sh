# Update package
echo "============ PROVISIONING: Updating default packages ..."
sudo yum -y update

# Disable SELinux and firewall
echo "============ PROVISIONING: Disabling SELinux and firewall ..."
sudo setenforce 0
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config

# Install dev tools
echo "============ PROVISIONING: Installing Development tools ..."
sudo yum -y groupinstall base "Development tools"

# Install editors and avoid the war
echo "============ PROVISIONING: Installing Vim and Emacs ..."
sudo yum -y install ncurses-devel vim-enhanced emacs