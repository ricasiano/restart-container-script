@echo off
echo Running Docker. Please wait...

PowerShell -Command "Set-ExecutionPolicy Unrestricted" >> "%TEMP%\DockerStartupLog.txt" 2>&1 
PowerShell D:\Your\DirPath\To\PowerShell\File\docker_start.ps1 >> "%TEMP%\DockerStartupLog.txt" 2>&1