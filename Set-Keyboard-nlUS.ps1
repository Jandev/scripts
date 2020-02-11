#Set the current culture to Dutch settings and keyboard to english for, useful for development
#Only works from Windows 8 and up.
#Create new locale based on Dutch settings
$nlUS = New-WinUserLanguageList nl-NL
#Clear the current (readonly) collection containing non-english keyboard settings
$nlUS[0].InputMethodTips.Clear()
#Set keyboard settings to US format with dutch locale.
$nlUS[0].InputMethodTips.Add('0413:00000409')
Set-WinUserLanguageList $nlUS -Force