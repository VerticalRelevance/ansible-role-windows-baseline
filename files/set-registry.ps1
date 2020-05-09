<#
    .SYNOPSIS
        A Powershell Script to set the desktop environment when a user logs in

    .DESCRIPTION
        This script accomplishes the following steps:
        1. Check if "PropertiesSet.txt" exists in the User directory
        2. IF it does not exist, it sets the following Explorer Properties
        a.  Show Hidden files
        b.  Show OS Hidden files
        c.  Show file extentions
        d.  Show full path in the explorer bars
        e.  Show task bar as small icons mode
        f.  Lock the Task bar
        g.  Kill Explorer
        h.  Start Explorer
        i.  Set the PropertiesSet.txt in User directory
    .NOTES
#>

#Check if "PropertiesSet.txt" exists in the User directory
$runstate = Test-Path C:\users\$env:USERNAME\PropertiesSet.txt
#IF it does not exist, it sets the Explorer Properties
if ($runState -eq $false){
    #inject Folder Properties
    New-ItemProperty -Force -path HKCU:\\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name "Hidden" -PropertyType DWord -Value 1
    New-ItemProperty -Force -path HKCU:\\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name "ShowSuperHidden" -PropertyType DWord -Value 1
    New-ItemProperty -Force -path HKCU:\\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name "HideFileExt" -PropertyType DWord -Value 0
    New-ItemProperty -Force -path HKCU:\\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState -Name "FullPath" -PropertyType DWord -Value 1

    #inject TaskBar Properties
    New-ItemProperty -Force -path HKCU:\\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name "TaskbarSmallIcons" -PropertyType DWord -Value 1
    New-ItemProperty -Force -path HKCU:\\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name "TaskbarSizeMove" -PropertyType DWord -Value 0
    #the following registry (taskbar always combine, hidelabels) - is default so it is commented out. uncomment it if a new patch or ami sets it otherwise
    #New-ItemProperty -Force -path HKCU:\\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name "TaskbarGlomLevel" -PropertyType DWord -Value 0

    taskkill /f /im explorer.exe
    start explorer.exe
    "true" > C:\users\$env:USERNAME\PropertiesSet.txt
}
else {
    write-host "Script already ran in the past. skipping"
}