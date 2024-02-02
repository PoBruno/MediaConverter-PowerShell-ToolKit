# Defina o caminho do diretório onde deseja criar a estrutura do projeto
$projetoDiretorio = "C:\Repo\GitHub\brunoshy@gmail.com\MediaConverter-PowerShell-ToolKit"

# Crie o diretório do projeto se ainda não existir
if (-not (Test-Path -Path $projetoDiretorio)) {
    New-Item -ItemType Directory -Path $projetoDiretorio -ErrorAction Stop
}

# Crie a estrutura de pastas
$publicDiretorio = New-Item -Path (Join-Path -Path $projetoDiretorio -ChildPath "Public") -ItemType Directory -Force
$privateDiretorio = New-Item -Path (Join-Path -Path $projetoDiretorio -ChildPath "Private") -ItemType Directory -Force

# Crie os arquivos
@"
# Arquivo: MediaConverter.psd1

@{
    ModuleVersion = '1.0'
    RootModule = 'MediaConverter.psm1'
    Description = 'PowerShell module for media conversion.'
    Author = 'Seu Nome'
    FunctionsToExport = 'Convert-MediaFile'
}
"@ | Out-File -FilePath (Join-Path -Path $projetoDiretorio -ChildPath "MediaConverter.psd1") -Force -Encoding utf8

@"
# Arquivo: MediaConverter.psm1

# Importa todas as funções definidas no módulo
Import-Module `$PSScriptRoot\Public\*.ps1

# Exporta todas as funções do módulo
Export-ModuleMember -Function *
"@ | Out-File -FilePath (Join-Path -Path $projetoDiretorio -ChildPath "MediaConverter.psm1") -Force -Encoding utf8

@"
function Convert-MediaFile {
[CmdletBinding()]
param (
[Parameter(Mandatory = $true)] [ValidateScript({Test-Path $_.FullName -PathType Leaf})]
[string] `$SourcePath,

php
Copy code
    [Parameter(Mandatory = `$true)]
    [string] `$OutputPath
)

# Sua lógica de conversão aqui
}
"@ | Out-File -FilePath (Join-Path -Path $publicDiretorio.FullName -ChildPath "Convert-MediaFile.ps1") -Force -Encoding utf8

Write-Host "Estrutura de pastas e arquivos criada com sucesso em: $projetoDiretorio"