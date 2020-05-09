# handlers

Handlers are just like regular tasks in an Ansible [playbook](https://docs.ansible.com/ansible/latest/reference_appendices/glossary.html#term-playbooks) (see [Tasks](https://docs.ansible.com/ansible/latest/reference_appendices/playbooks_keywords.html#term-tasks)) but are only run if the Task contains a notify directive and also indicates that it changed something. 

For example, if a config file is changed, then the task referencing the config file templating operation may notify a service restart handler. This means services can be bounced only if they need to be restarted. 

Handlers can be used for things other than service restarts, but service restarts are the most common usage.


# Ansible Docs

https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html#task-and-handler-organization-for-a-role