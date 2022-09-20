param([string]$path='') 

if($path -eq "") { 
    Write-Host "Error: No argument supplied." -ForegroundColor Red
    return 1;
}

Get-Content (Get-Item $file) | foreach {
    $name, $value = $_.split('=')
    Set-Item -Force -Path "Env:$name" -Value $value;
}