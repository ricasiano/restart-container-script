& "C:\Your\Path\To\Docker\Windows\Executable\Docker for Windows.exe"
$containerName = 'your_container_name'
$dockerServiceName = 'your_service_name_defined_in_docker-compose.yml'
$ServiceName = 'com.docker.service'
$arrService = Get-Service -Name $ServiceName
while ($arrService.Status -ne 'Running')
{
    Start-Sleep -seconds 15
    $arrService.Refresh()
    while ($arrService.Status -eq 'Running')
    {
        Start-Sleep -seconds 15
        $containerStatus = docker inspect -f '{{.State.Running}}' $containerName
        if ($containerStatus -eq 'true')
        {
            & 'docker' stop $containerName
            & 'docker' rm $containerName
            & 'docker-compose' --log-level CRITICAL up -d php
            break
        }
    }
}