1. Requirement:
- Windows 10 Operating system.
- Computers belong to Domain controller enviroment.
- Remote Desktop assistant was enabled for all.

2. Install instructions
- Starting download my script, when done, right-click into Install_RunAsAdministrator.bat file and select Run as Administrator right.
- After that, you will see the folder Remote Assistant in C drive. In this folder, there are 3 folders were already shared for everyone. 
  + Folder RDPAssistance contains Remote Desktop Assistant file that will be created by end user in step 2 (For ex: computername_username.msrcincident). This was shared invisibly.
  + Folder Remote Assistant contains file Remoteassistant.bat that will be run by end user. Just give them the path (\\computername\Remoteassistant) and double-click to run it and then you will see the Remote Desktop invitation was created in the folder RDPAssistance.
  + Folder Source contains main ps1 file that help script works. This was shared invisibly.
- For more detailed instruction, please watch tutorial here - 
