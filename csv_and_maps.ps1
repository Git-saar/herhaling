$mapjes = Get-Content -Path C:\Users\Administrator\Desktop\mapjes.txt


foreach($map in $mapjes)
{

    $check = Test-Path -Path $map
    if($check -eq $false)
    {
        New-Item -Path $map -ItemType Directory
    }

}


$users = import-csv -path C:\Users\Administrator\Desktop\mycsv.txt



foreach($user in $users)
{

    $check = Test-Path -Path ($user.PATH + '\' + $user.NAME)
    
    if($check -eq $false -and $user.ISFILE -eq 'yes')
    {
        New-Item -Path ($user.PATH + '\' + $user.NAME ) -ItemType file -Force
    }

    elseif($check -eq $false -and $user.ISFOLDER -eq 'yes')
    {
        New-Item -Path ($user.PATH + $user.NAME) -ItemType Directory -Force
    }



}