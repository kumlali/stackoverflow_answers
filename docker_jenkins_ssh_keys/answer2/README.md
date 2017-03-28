[Second answer](http://stackoverflow.com/a/43063966/5903564) of [How can I create a Jenkins Docker image that uses provided ssh keys for jenkins user?](http://stackoverflow.com/q/42999023/5903564)

**Note:** To ssh successfully, SSH Agents needs the public key(e.g. test-key.pub) included into the ~/.ssh/authorized_keys in the remote server to connect. See [Using an SSH agent to authenticate SSH connections](https://support.cloudbees.com/hc/en-us/articles/222121807-Using-an-SSH-agent-to-authenticate-SSH-connections) for more information.

* Create `Freestyle Project`
* Select `SSH Agent` under `Build Environment`
* Select `jenkins (SSH credentials of DEV environment)` under `Specific credential` 
* Add `Execute shell` build step under `Build`
* Use following command by replacing `<user>` and `<host>` with yours:

    `ssh -o StrictHostKeyChecking=no -l <user> <host> uname -a`
    
* Run the job
