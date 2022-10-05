$mapjes = (‘C:\Map1’,’C:\Map2’,’C:\Map3’)


Foreach($item in $mapjes)
{

    
    $check = Test-Path $item
    
    if($check -eq $False)
    {

       New-Item -Path $item -ItemType Directory

    }


}

