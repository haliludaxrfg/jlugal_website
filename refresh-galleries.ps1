$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$galleryTitles = [ordered]@{
    gallery1 = -join ([char[]](0x65ee, 0x65ef, 0x76f4, 0x64ad))
    gallery2 = -join ([char[]](0x7ebf, 0x866b, 0x805a, 0x4f1a))
    gallery3 = -join ([char[]](0x795e, 0x5fc5, 0x5357, 0x6881))
}
$imageExtensions = @('.jpg', '.jpeg', '.png', '.webp', '.gif')
$galleries = [ordered]@{}

foreach ($galleryId in $galleryTitles.Keys) {
    $directory = Join-Path $root ('photos\' + $galleryId)
    if (-not (Test-Path -LiteralPath $directory -PathType Container)) {
        throw "Missing gallery directory: $directory"
    }

    $files = @(
        Get-ChildItem -LiteralPath $directory -File |
            Where-Object { $imageExtensions -contains $_.Extension.ToLowerInvariant() } |
            Sort-Object Name |
            ForEach-Object { $_.Name }
    )

    $galleries[$galleryId] = [ordered]@{
        title = $galleryTitles[$galleryId]
        files = $files
    }
}

$json = $galleries | ConvertTo-Json -Depth 4 -Compress
$content = "window.galleryData = $json;`r`n"
[System.IO.File]::WriteAllText((Join-Path $root 'gallery-data.js'), $content, (New-Object System.Text.UTF8Encoding($false)))
Write-Host "Updated gallery-data.js from photos/gallery1, photos/gallery2, and photos/gallery3."
