# Kanya Hunt — Image optimization pipeline
# Usage: .\optimize-image.ps1 -Source "path.jpg" -Name "wedding-01" -Slot "gallery"

param(
    [Parameter(Mandatory=$true)] [string]$Source,
    [Parameter(Mandatory=$true)] [string]$Name,
    [Parameter(Mandatory=$true)] [ValidateSet("hero","gallery","offering","portrait","frame","instagram")] [string]$Slot,
    [int]$Quality = 85,
    [switch]$DryRun
)

Add-Type -AssemblyName System.Drawing

$slotConfig = @{
    "hero"      = @{ MaxDim = 1800; Square = $false }
    "gallery"   = @{ MaxDim = 1200; Square = $false }
    "offering"  = @{ MaxDim = 800;  Square = $false }
    "portrait"  = @{ MaxDim = 1000; Square = $false }
    "frame"     = @{ MaxDim = 1200; Square = $false }
    "instagram" = @{ MaxDim = 500;  Square = $true  }
}

$config = $slotConfig[$Slot]
$maxDim = $config.MaxDim
$squareMode = $config.Square

if (-not (Test-Path $Source)) {
    Write-Error "Source file not found: $Source"
    exit 1
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$siteRoot  = Split-Path -Parent $scriptDir
$outDir    = Join-Path $siteRoot "images"
if (-not (Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir | Out-Null }

$cleanName = $Name.ToLower() -replace '[^a-z0-9\-]', '-' -replace '-+', '-' -replace '^-|-$', ''
$outPath = Join-Path $outDir "$cleanName.jpg"

Write-Host ""
Write-Host "-- optimize-image.ps1 --------------------------------"
Write-Host "Source:  $Source"
Write-Host "Slot:    $Slot (max $maxDim px)"
Write-Host "Output:  $outPath"

$src = [System.Drawing.Image]::FromFile($Source)
$srcW = $src.Width
$srcH = $src.Height
$origMB = [math]::Round((Get-Item $Source).Length/1MB, 1)
Write-Host "Original: $srcW x $srcH ($origMB MB)"

if ($squareMode) {
    $newW = $maxDim
    $newH = $maxDim
    $cropSize = [Math]::Min($srcW, $srcH)
    $cropX = [int](($srcW - $cropSize) / 2)
    $cropY = [int](($srcH - $cropSize) / 2)
    $cropRect = New-Object System.Drawing.Rectangle($cropX, $cropY, $cropSize, $cropSize)
} else {
    if ($srcW -ge $srcH) {
        $newW = $maxDim
        $newH = [int]($srcH * ($maxDim / $srcW))
    } else {
        $newH = $maxDim
        $newW = [int]($srcW * ($maxDim / $srcH))
    }
    $cropRect = New-Object System.Drawing.Rectangle(0, 0, $srcW, $srcH)
}

Write-Host "Target:   $newW x $newH"

if ($DryRun) {
    $src.Dispose()
    Write-Host "DryRun mode - no file written."
    return
}

$dst = New-Object System.Drawing.Bitmap($newW, $newH)
$dst.SetResolution(72, 72)
$g = [System.Drawing.Graphics]::FromImage($dst)
$g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
$g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
$g.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
$destRect = New-Object System.Drawing.Rectangle(0, 0, $newW, $newH)
$g.DrawImage($src, $destRect, $cropRect, [System.Drawing.GraphicsUnit]::Pixel)
$g.Dispose()

$jpegEncoder = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq "image/jpeg" }
$encoderParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
$encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, [long]$Quality)
$dst.Save($outPath, $jpegEncoder, $encoderParams)

$dst.Dispose()
$src.Dispose()

$outKB = [math]::Round((Get-Item $outPath).Length/1KB, 1)
Write-Host "Saved:    $outKB KB (quality $Quality)"
Write-Host "------------------------------------------------------"
Write-Host ""
