$dir = "C:\PIM 4\SiteFornecedor"
Get-ChildItem -Path $dir -Recurse -Include *.html | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    
    # Replace logo
    $content = $content -replace '<span class="logo-badge">UNISHOP</span>', '<span class="logo-text" style="color: #5DA54A; font-size: 2rem; font-weight: 800; letter-spacing: -1px;">MerKdito</span>'
    $content = $content -replace '<span class="login-logo-badge">UNISHOP</span>', '<span class="logo-text" style="color: #5DA54A; font-size: 3.2rem; font-weight: 800; letter-spacing: -1.5px;">MerKdito</span>'
    
    # Replace other texts mentioning Unishop
    $content = $content -replace 'Dashboard Unishop', 'Dashboard MerKdito'
    $content = $content -replace 'Gestão de Produtos Unishop', 'Gestão de Produtos MerKdito'
    $content = $content -replace 'Login - UNISHOP', 'Login - MerKdito'
    $content = $content -replace 'Dashboard - UNISHOP', 'Dashboard - MerKdito'
    $content = $content -replace 'Produtos - UNISHOP', 'Produtos - MerKdito'
    $content = $content -replace 'Adicionar Produto - UNISHOP', 'Adicionar Produto - MerKdito'
    $content = $content -replace 'Perfil do Fornecedor - UNISHOP', 'Perfil do Fornecedor - MerKdito'
    $content = $content -replace 'admin@unishop.com', 'admin@merkdito.com'
    
    Set-Content -Path $_.FullName -Value $content -NoNewline
}
