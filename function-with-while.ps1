
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

##########################################################################################


function answer-check
{

param ($answer)
    
    $IsValid = $false
    
    if($answer -eq 'n' -or $answer -eq 'j')
    {
        $IsValid = $true
    }
    
    $IsValid

}





#############################################################################################




$users = Get-Content -Path C:\Users\Administrator\Desktop\users.txt


foreach($user in $users)
{

    $check = Test-LocalUser -name $user
    if($check -eq $false)
    {
        $answer = Read-Host 'The user '  $user ' is not exist, do you want to creat it (j/n)?'

        while(!(answer-check -answer $answer))
        {

            $answer = Read-Host 'Please answer with (j/n)'

        }

        
        if($answer -eq 'j')
        {
           'The user ' + $user + ' has been created'
            New-LocalUser -Name $user -NoPassword
        } 

        elseif($answer -eq 'n')
        {
           'The user ' + $user + ' wiil not be created'
        }


    }
    

    elseif($check -eq $true)
    {
        
        'The user ' + $user + ' is already exist' 
    }

}

<#


while($answer -ne 'n' -and $answer -ne 'j')
    {

        $answer = Read-Host 'Please answer with (j/n)'

        if($answer -eq 'j')
        {
           'The user ' + $user + ' has been created'
            New-LocalUser -Name $user -NoPassword
        } 

        elseif($answer -eq 'n')
        {
           'The user ' + $user + ' wiil not be created'
        }




    }

#>


        