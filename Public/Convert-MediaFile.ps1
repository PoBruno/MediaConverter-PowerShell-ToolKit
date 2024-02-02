function Convert-MediaFile {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateScript({ Test-Path $_ -PathType Leaf })]
        [string]$File,

        [Parameter(Mandatory = $false, ParameterSetName = 'Format')]
        [ValidateSet('mp3', 'mp4', 'wav', 'aac', 'ogg', 'flac', 'm4a', 'wma', 'aiff', 'alac', 'amr')]
        [string]$Format,

        [Parameter(Mandatory = $false, ParameterSetName = 'Out')]
        [string]$Out
    )

    # Verifica se o caminho de saída termina com uma barra invertida
    if ($Out -and $Out[-1] -ne '\') {
        $Out += '\'
    }

    # Se -Out não especificado, usa o mesmo diretório do arquivo original
    if (-not $Out) {
        $Out = Split-Path $File
    }

    # Extrai o nome do arquivo sem a extensão
    $FileName = [System.IO.Path]::GetFileNameWithoutExtension($File)

    try {
        # Se -Format não especificado, inferir a partir da extensão de -Out
        if (-not $Format) {
            $Format = [System.IO.Path]::GetExtension($Out).TrimStart('.')
        }

        # Define o caminho de saída com o nome do arquivo e a extensão
        $TargetPath = Join-Path -Path $Out -ChildPath "$FileName.$Format"

        # Simulação de conversão
        Write-Host "Convertendo arquivo de $File para $TargetPath"
        # Adicione sua lógica de conversão aqui

        


        # Exemplo: Copiar o arquivo para o novo destino
        Copy-Item -Path $File -Destination $TargetPath

        Write-Host "Conversão concluída com sucesso."
    }
    catch {
        Write-Error "Ocorreu um erro durante a conversão: $_"
    }
}

# Exporta a função para ser utilizada como cmdlet do PowerShell
Export-ModuleMember -Function Convert-MediaFile





################################################################
#                                                              #
###############################################################




# Carrega a biblioteca MediaToolkit
Add-Type -Path "Caminho\Para\MediaToolkit.dll"

# Define a função de conversão
function Convert-MediaFile {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateScript({ Test-Path $_ -PathType Leaf })]
        [string]$File,

        [Parameter(Mandatory = $false)]
        [ValidateSet('mp3', 'mp4', 'wav', 'aac', 'ogg', 'flac', 'm4a', 'wma', 'aiff', 'alac', 'amr')]
        [string]$Format,

        [Parameter(Mandatory = $false)]
        [string]$Out
    )

    try {
        # Cria um objeto MediaFile
        $mediaFile = New-Object MediaToolkit.MediaFile -ArgumentList $File

        # Define o caminho de saída com o nome do arquivo e a extensão
        $FileName = [System.IO.Path]::GetFileNameWithoutExtension($File)
        if (-not $Out) {
            $Out = Split-Path $File
        }
        $TargetPath = Join-Path -Path $Out -ChildPath "$FileName.$Format"

        # Realiza a conversão
        $conversion = New-Object MediaToolkit.Conversion -ArgumentList $mediaFile, $TargetPath
        [MediaToolkit.Engine]::Instance.Convert($conversion)

        Write-Host "Conversão concluída com sucesso. Arquivo convertido: $TargetPath"
    }
    catch {
        Write-Error "Ocorreu um erro durante a conversão: $_"
    }
}

# Exporta a função para ser utilizada como cmdlet do PowerShell
Export-ModuleMember -Function Convert-MediaFile
