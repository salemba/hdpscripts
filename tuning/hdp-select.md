# ERROR

When installing HDP components using Ambari, you may face this kind of errors : 

```
Traceback (most recent call last):
  File "/var/lib/ambari-agent/cache/stacks/HDP/2.0.6/hooks/after-INSTALL/scripts/hook.py", line 37, in <module>
    AfterInstallHook().execute()
  File "/usr/lib/python2.6/site-packages/resource_management/libraries/script/script.py", line 314, in execute
    method(env)
  File "/var/lib/ambari-agent/cache/stacks/HDP/2.0.6/hooks/after-INSTALL/scripts/hook.py", line 31, in hook
    setup_stack_symlinks()
  File "/var/lib/ambari-agent/cache/stacks/HDP/2.0.6/hooks/after-INSTALL/scripts/shared_initialization.py", line 52, in setup_stack_symlinks
    stack_select.select_all(version)
  File "/usr/lib/python2.6/site-packages/resource_management/libraries/functions/stack_select.py", line 135, in select_all
    Execute(command, only_if = only_if_command)
  File "/usr/lib/python2.6/site-packages/resource_management/core/base.py", line 155, in __init__
    self.env.run()
  File "/usr/lib/python2.6/site-packages/resource_management/core/environment.py", line 160, in run
    self.run_action(resource, action)
  File "/usr/lib/python2.6/site-packages/resource_management/core/environment.py", line 124, in run_action
    provider_action()
  File "/usr/lib/python2.6/site-packages/resource_management/core/providers/system.py", line 262, in action_run
    tries=self.resource.tries, try_sleep=self.resource.try_sleep)
  File "/usr/lib/python2.6/site-packages/resource_management/core/shell.py", line 72, in inner
    result = function(command, **kwargs)
  File "/usr/lib/python2.6/site-packages/resource_management/core/shell.py", line 102, in checked_call
    tries=tries, try_sleep=try_sleep, timeout_kill_strategy=timeout_kill_strategy)
  File "/usr/lib/python2.6/site-packages/resource_management/core/shell.py", line 150, in _call_wrapper
    result = _call(command, **kwargs_copy)
  File "/usr/lib/python2.6/site-packages/resource_management/core/shell.py", line 303, in _call
    raise ExecutionFailed(err_msg, code, out, err)
resource_management.core.exceptions.ExecutionFailed: Execution of 'ambari-sudo.sh /usr/bin/hdp-select set all `ambari-python-wrap /usr/bin/hdp-select versions | grep ^2.5 | tail -1`' returned 1. ERROR: set command takes 2 parameters, instead of 1

usage: distro-select [-h] [<command>] [<package>] [<version>]

Set the selected version of HDP.

positional arguments:
  <command>   One of set, status, versions, or packages
  <package>   the package name to set
  <version>   the HDP version to set

optional arguments:
  -h, --help  show this help message and exit
  -r, --rpm-mode  if true checks if there is symlink exists and creates the symlink if it doesn't

Commands:
  set      : set the package to a specified version
  status   : show the version of the package
  versions : show the currently installed versions
  packages : show the individual package names
```  
# Problem : 
Try to run the command ```ambari-python-wrap /usr/bin/hdp-select versions``` and see which file/dir causes the problem.

  
# Solution
 Either [re]move the file/dir causing the problem of just  find the method ```def printVersions():``` and add the filename to this condition (in my case it was usr and hdp):
  if f not in [".", "..", "current", "share", "lost+found","usr","hdp"]:
  