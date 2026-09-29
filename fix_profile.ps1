$dir = "C:\PIM 4\SiteFornecedor"
Get-ChildItem -Path $dir -Recurse -Include *.html | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    
    $content = $content -replace 'Fornecedor Admin', 'CleanMax Indústria'
    $content = $content -replace 'admin@merkdito.com', 'contato@cleanmax.com.br'
    $content = $content -replace '>FA<', '>CM<'
    
    Set-Content -Path $_.FullName -Value $content -NoNewline
}
