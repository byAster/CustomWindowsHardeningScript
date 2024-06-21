# Windows 10/11 Hardening Script 
Original script by @ZephrFish. I have made some $\textcolor{orange}{\textsf{small changes}}$ to adapt it to my machines.

## Overview
This script enhances the security of Windows operating systems by making various system modifications. It includes adjusting settings, policies, and features to reduce vulnerabilities and protect against various cyber threats.

## Important Notes
- Pre-execution Review: Users are urged to review each setting and modification before execution meticulously. This ensures alignment with operational requirements and confirms that no essential functionalities are compromised.

- Intended Audience: The script is crafted explicitly for security professionals and system administrators who understand the intricacies of Windows operating systems and their security frameworks.

- Testing Environment: Thorough testing in a non-production environment is strongly recommended to ensure the script's effects align with your unique configurations and do not adversely impact system performance.

- User Discretion: Please exercise caution. The script includes warnings at critical junctures to confirm your consent for the changes. I would like to let you know that your decision to proceed should be informed and deliberate.

## Key Features
- Admin Check: Ensures the script is executed with administrative privileges for effective changes.
- $\textcolor{orange}{\textsf{Option to create a system restore point.}}$
- $\textcolor{orange}{\textsf{Option to create a backup.}}$
- Initial Warning and Consent: This alerts users about the significant system changes the script will make and seeks their consent to proceed.
- File Association Changes: This feature modifies file associations for potentially dangerous file types in Notepad to obscure malicious content. It offers optional changes for .bat and .ps1 files.
- Windows Defender Configuration: Activates and configures Windows Defender settings to enhance malware protection.
- Internet Browser Settings: Adjusts Microsoft Edge and Google Chrome settings to improve web browsing security.
- $\textcolor{orange}{\textsf{Now Chrome settings are optional if you have it installed by default.}}$
- Microsoft Office Security Settings: This feature applies security settings across different versions of Microsoft Office to mitigate risks from malspam attacks and other vulnerabilities.
- General Windows Security Enhancements: DNS client and SMB1 configuration, TCP/IP configuration, system and security policies adjustments, Wi-Fi and NetBIOS configuration, disabling PowerShell 2.0, cryptography, and Kerberos configuration.
- Windows Remote Access, Removable Media, and Sharing/SMB Settings: Harden remote access settings, disable unnecessary features and protocols, and enforce security policies for file sharing.
- $\textcolor{orange}{\textsf{Added support for Spanish language systems when enabling verbose Windows event logging.}}$
- Biometrics and App Privacy: Adjusts settings to enhance privacy and security regarding biometrics and application permissions.
- Firewall Modifications: Enables Windows Firewall for all profiles, configures logging ($\textcolor{orange}{\textsf{fixed bug}}$), and blocks specific binaries from making outbound connections.
- Privacy Settings and System Cleanup: This program implements a range of privacy settings adjustments and removes pre-installed applications deemed unnecessary ($\textcolor{orange}{\textsf{OneNote, Windows Alarms and Spotify will be preserved}}$).
- Advanced Logging and Audit Policies: Enhances system logging and audit policies for better monitoring and detection capabilities.
- Optional Security Lockdown Options: This option offers a series of optional yet significant security enhancements, including NTLMv2 enforcement, SMB server signing, enabling Windows Defender features, and more.
- $\textcolor{orange}{\textsf{Capability to restrict script execution through PowerShell.}}$

## What this Repo Includes

- Harden_PS.ps1 - Improved Hardening script with additional features, checks it is being run as admin first and also warns you before it does certain actions

## Tested
  - @ZephrFish: Windows 10 and Windows 11 Dev VM.
  - $\textcolor{orange}{\textsf{@byAster}}$: Windows 10 Pro (version 22H2) and Windows 11 Pro (version 23H2).

Your mileage may vary, but gives a good baseline to harden a build.

## Future / Todo
- Build out reporting function for before and after
- add logging of changed files and settings
- add granular controls to only do certain thjngs
- $\textcolor{orange}{\textsf{add support for other browsers (Firefox, Opera, and more)}}$
  
## References
- Originally built off the back of Paving The Way to DA series; https://blog.zsec.uk/paving-2-da-wholeset/
