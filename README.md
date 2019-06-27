# Synchronization DB (SYNC)
This Scripts can synchronization database from remote to local and local to remote from console in your project

# Settings
 - Need move all this file to the project folder
 - Use composer need run command 'composer init'
 - Use composer command 'composer update'
 - Change access to <b>DB</b> in the file <b>sync</b> (<i>local</i>, <i>remote</i>)
 - After that use console command <b>php sync -h</b> - this command show you all methods and parameters what you needed
 - For run sync you need use console command <b>php sync run</b>
 
 
# Explanation  
 - If you run this command <b>php sync run</b> you start method 'LOCAL => SERVER'
 - <b>SYNC</b> have two method(type) (1, 2).
 - First method(type) 1(default) LOCAL => SERVER;
 - Second method(type) 2 - 'SERVER => LOCAL';
 
# USES
- <b>php sync run 1</b> = LOCAL => SERVER
- <b>php sync run 2</b> = SERVER => LOCAL
