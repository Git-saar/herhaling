
function Test-Service
{


    param($Name)

    $Exists = $true

    try
    {

        $ServiceObject = Get-Service -Name $name -ErrorAction Stop

    }

    catch
    {

        
        $Exists = $false

    }

    Write-Output $Exists

}


$services = Get-Content -Path C:\Users\Administrator\Desktop\services.txt

foreach($service in $services)
{

    $check = Test-Service -Name $service
    if($check -eq $true)
    {

        'The ' + $service + ' service exist'

    }

    if($check -eq $false)
    {

        'The ' + $service + ' service does not exist'

    }



}
