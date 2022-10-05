$name = read-host "Search if a user exist, type a name: "
try
{

     Get-LocalUser -Name $name -ErrorAction Stop

}

catch
{

    write-verbose -Message ("This user do not exist") -Verbose
    'error: cannot find the local user: ' + $name | out-file -FilePath  C:\test1\error.txt -Force -Append

}