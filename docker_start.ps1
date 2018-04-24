& "C:\Program Files\Docker\Docker\Docker for Windows.exe"
$ServiceName = 'com.docker.service'
$arrService = Get-Service -Name $ServiceName
while ($arrService.Status -ne 'Running')
{
    Start-Sleep -seconds 15
    $arrService.Refresh()
    while ($arrService.Status -eq 'Running')
    {
        Start-Sleep -seconds 15
        $PHPContainer = docker inspect -f '{{.State.Running}}' wmp_php_1
        if ($PHPContainer -eq 'true')
        {
            & 'docker' stop wmp_php_1
            & 'docker' rm wmp_php_1
            & 'docker-compose' --log-level CRITICAL up -d php
            break
        }
    }
}