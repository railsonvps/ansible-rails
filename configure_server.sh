# Install playbooks listed in requirements.yml
ansible-galaxy role install -r requirements.yml

if [[ $* == *--initial-run* ]]
then
  # Run the playbook as root initially, because the deploy user does not exist yet
  ansible-playbook site.yml -i hosts -e "ansible_user=root"
else
  # Run with the default deploy user on subsequent runs
  ansible-playbook site.yml -i hosts
fi
