# tasks

[Playbooks](https://docs.ansible.com/ansible/latest/reference_appendices/glossary.html#term-playbooks) exist to run tasks. Tasks combine an [action](https://docs.ansible.com/ansible/latest/reference_appendices/playbooks_keywords.html#term-action) (a module and its arguments) with a name and optionally some other keywords (like [looping directives](https://docs.ansible.com/ansible/latest/reference_appendices/glossary.html#term-loops)). [Handlers](https://docs.ansible.com/ansible/latest/reference_appendices/playbooks_keywords.html#term-handlers) are also tasks, but they are a special kind of task that do not run unless they are notified by name when a task reports an underlying change on a remote system.

## Ansible Docs

https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html#task-and-handler-organization-for-a-role