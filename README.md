# PRTG Exchange Queue Sensor

This powershell script is used to monitor queue lengths on a Microsoft Exchange server as a PRTG Network Monitor custom sensor.

You can find out more about PRTG here: https://www.paessler.com/prtg.

## Usage

To use this script with your PRTG installation, follow these steps:
1. Save the script file "exchangequeue.ps1" in the %installdir%\Custom Sensors\EXEXML\ directory on your monitoring probe.
2. Set the Powershell (x86) ExecutionPolicy setting to RemoteSigned on the probe server.
3. On your exchange server device in PRTG, add a new "EXE/Script Advanced" sensor.
4. From the EXE/Script dropdown, choose "exchangequeue.ps1".
5. In the Parameters section, insert the text "-ExchangeServer %host". You can put in the IP address or FQDN of your exchange server instead of "%host" if necessary.
6. Set the Security Context to "Use Windows credentials of parent device", and ensure the windows account you have configured PRTG to use has at least the "Organisation Read-Only Administrator" role.

If any further troubleshooting is required, please check this KB on configuring PRTG with custom powershell scripts: https://kb.paessler.com/en/topic/71356-guide-for-powershell-based-custom-sensors.
