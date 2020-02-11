#Take ownership of some folders which can't be deleted normally.
TAKEOWN /f C:\$SysReset /r /d y
ICACLS C:\$SysReset /grant administrators:F /t
TAKEOWN /f C:\Windows.old /r /d y
ICACLS C:\Windows.old /grant administrators:F /t