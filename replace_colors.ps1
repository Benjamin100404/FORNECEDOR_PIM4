$dir = "C:\PIM 4\SiteFornecedor"
Get-ChildItem -Path $dir -Recurse -Include *.html,*.css,*.js | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    
    # CSS variables definition
    $content = $content -replace '--color-pink: #EF83A2;', '--color-red: #FF544C;'
    $content = $content -replace '--color-purple: #C19CD1;', '--color-teal: #2AB0A3;'
    $content = $content -replace '--color-yellow: #FFD25E;', '--color-yellow: #FFE458;'
    $content = $content -replace '--color-cream: #FDF8EE;', '--color-cream: #FFFAF0;'
    $content = $content -replace '--color-cream-dark: #FBE7C6;', '--color-cream-dark: #FFF0C2;'
    $content = $content -replace '--color-mint: #A2D6C6;', '--color-orange: #FE9A34;'
    
    # CSS variables usage
    $content = $content -replace 'var\(--color-pink\)', 'var(--color-red)'
    $content = $content -replace 'var\(--color-purple\)', 'var(--color-teal)'
    $content = $content -replace 'var\(--color-mint\)', 'var(--color-orange)'
    
    # CSS hardcoded RGBA and HEX
    $content = $content -replace 'rgba\(193, 156, 209', 'rgba(42, 176, 163'
    $content = $content -replace 'rgba\(255, 210, 94', 'rgba(255, 228, 88'
    $content = $content -replace 'rgba\(162, 214, 198', 'rgba(254, 154, 52'
    $content = $content -replace 'rgba\(239, 131, 162', 'rgba(255, 84, 76'
    $content = $content -replace '#B08BC0', '#249A8F'
    $content = $content -replace '#EBC050', '#E6CD4F'
    
    # HTML/CSS Class names
    $content = $content -replace 'icon-purple', 'icon-teal'
    $content = $content -replace 'icon-mint', 'icon-orange'
    $content = $content -replace 'icon-pink', 'icon-red'
    $content = $content -replace 'badge-purple', 'badge-teal'
    $content = $content -replace 'badge-mint', 'badge-orange'
    $content = $content -replace 'badge-pink', 'badge-red'
    
    # JS variables definition & usage
    $content = $content -replace "pink: '#EF83A2'", "red: '#FF544C'"
    $content = $content -replace "purple: '#C19CD1'", "teal: '#2AB0A3'"
    $content = $content -replace "mint: '#A2D6C6'", "orange: '#FE9A34'"
    $content = $content -replace "yellow: '#FFD25E'", "yellow: '#FFE458'"
    $content = $content -replace "cream: '#FBE7C6'", "cream: '#FFF0C2'"
    $content = $content -replace 'colors.pink', 'colors.red'
    $content = $content -replace 'colors.purple', 'colors.teal'
    $content = $content -replace 'colors.mint', 'colors.orange'

    Set-Content -Path $_.FullName -Value $content -NoNewline
}
