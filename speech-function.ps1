


function get-speech
{
param($WhatToSay, $SelectVoice)

    Add-Type -AssemblyName system.speech
    $Speak =New-Object System.Speech.Synthesis.SpeechSynthesizer
    $speak.SelectVoice($SelectVoice)
    $Speak.Speak($WhatToSay)
  
    
    

}


Get-speech -WhatToSay 'this function is great' -SelectVoice 'Microsoft Zira Desktop'
