# Export-WiFiProfiles.ps1

# Define o caminho de saída
$outputFile = "$env:TEMP\WiFiProfiles.txt"

# Obtém todos os perfis Wi-Fi salvos
$profiles = netsh wlan show profiles | Select-String "Todos os perfis de usuário" | ForEach-Object {
    ($_ -split ":")[1].Trim()
}

# Exporta os detalhes de cada perfil, incluindo senhas se disponíveis
$output = foreach ($profile in $profiles) {
    netsh wlan show profile name="$profile" key=clear
}

# Salva em arquivo
$output | Out-File -Encoding UTF8 -FilePath $outputFile
