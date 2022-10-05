
function Test-LocalUser
{


    param($Name)

    $Exists = $true

    try
    {

        $UserObject = Get-LocalUser -Name $name -ErrorAction Stop

    }

    catch
    {

        
        $Exists = $false

    }

    Write-Output $Exists

}




$users = Get-Content -Path C:\Users\Administrator\Desktop\users.txt


foreach($user in $users)
{

    $check = Test-LocalUser -name $user
    if($check -eq $false)
    {
        $answer = Read-Host 'The user '  $user ' is not exist, do you want to creat it (j/n)?'
        if($answer -eq 'j')
        {
           'The user ' + $user + ' has been created'
            New-LocalUser -Name $user -NoPassword
        } 

        if($answer -eq 'n')
        {
           'The user ' + $user + ' wiil not be created'
        }
    }
    

    elseif($check -eq $true)
    {
        
        'The user ' + $user + ' is already exist' 
    }

}


foreach($user in $users)
{

    $check = Test-LocalUser -name $user

    if($check -eq $true)
    {
        
        Remove-LocalUser -Name $user  
    }

}
