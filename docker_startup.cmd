@echo off
echo Running Docker for WMP. Please wait...
d:
cd WMP
PowerShell -Command "Set-ExecutionPolicy Unrestricted" >> "%TEMP%\DockerWMPStartupLog.txt" 2>&1 
PowerShell D:\WMP\docker_start.ps1 >> "%TEMP%\DockerWMPStartupLog.txt" 2>&1