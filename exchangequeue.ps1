param ([string]$ExchangeServer)

$ErrorActionPreference = "SilentlyContinue"
$WarningActionPreference = "SilentlyContinue"

$uri = "http://" + $ExchangeServer + "/PowerShell/"

$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri $uri
$output = Import-PSSession $session -DisableNameChecking -AllowClobber
$queues = Get-Queue

$channels = @()

foreach ($queue in $queues) {
    $channel = @{"Channel" = $queue.NextHopDomain;"Value" = $queue.MessageCount;"Unit" = "Count";"LimitMode" = "1";"LimitMaxError" = "25"}
    $channels += $channel
}

Write-Output (@{"prtg" = (@{"result" = $channels})} | ConvertTo-JSON -Depth 3)