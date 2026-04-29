param(
    [string]$Mensaje = ""
)

$ErrorActionPreference = "Stop"

if (-not $Mensaje.Trim()) {
    $stamp = Get-Date -Format "yyyy-MM-dd HH:mm"
    $Mensaje = "Update oposiciones material $stamp"
}

git status --short

$changes = git status --porcelain
if (-not $changes) {
    Write-Host "No hay cambios para subir."
    exit 0
}

git add .
git commit -m $Mensaje
git push
