# Arquivo: MediaConverter.psm1

# Importa todas as funções definidas no módulo
Import-Module $PSScriptRoot\Public\*.ps1

# Exporta todas as funções do módulo
Export-ModuleMember -Function *
