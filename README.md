# restart-container-script
Docker for Windows does not mount volumes on booting. https://github.com/docker/for-win/issues/584#issuecomment-286792858. Here's a temporary fix that would recreate the problematic container.

#Steps
1. Go to Docker Settings, via the system tray
2. Under General, untick Start Docker when you login
3. Disable the docker service by:
  - Press window + r, and type services.msc
  - scroll down for Docker for Windows Service
  - right click and select Properties
  - on Startup Type, choose Manual
4. Run the custom script on startup
  - Press window + r, and type shell:startup
  - copy the docker_startup.cmd to the opened startup folder
5. Restart your PC. Docker will now run on startup.
