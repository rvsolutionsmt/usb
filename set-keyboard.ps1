# Verifica se o layout en-US já está presente
$languageList = Get-WinUserLanguageList
$hasEN = $languageList.LanguageTag -contains "en-US"

if (-not $hasEN) {
    # Adiciona en-US à lista sem remover os existentes
    $languageList.Add("en-US")
    Set-WinUserLanguageList $languageList -Force
}

# Define o teclado ativo para en-US
Set-WinUILanguageOverride -Language "en-US"
Set-WinUserLanguageList "en-US" -Force
Set-WinSystemLocale "en-US"
Set-WinHomeLocation -GeoId 244

# Confirma visualmente
Write-Output "`nLayout de teclado definido para en-US.`n"
