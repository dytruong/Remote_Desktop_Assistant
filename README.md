1. Requirement:
- Windows 10 Operating system.
- Computers belong to Domain controller enviroment.
- Remote Desktop assistant was enabled for all.

2. Install instructions
- Starting download my script, when done, right-click into Install_RunAsAdministrator.bat file and select Run as Administrator right.
- After that, you will see the folder Remote Assistant in C drive. In this folder, there are 3 folders was already shared for everyone. 
  + Folder RDPAssistance contains Remote Desktop Assistant file that was created by user. It includes computername_username
  + Folder Remote Assistant contains file Remoteassistant.bat. You must to give end user this path and tell them run it to create Remote Desktop Assistant file into RDPAssistance.
  + Folder Source contains main ps1 file.
  
