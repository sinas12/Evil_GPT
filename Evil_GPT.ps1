$input = $args[0]
Write-Host "`n[+] Input Text: $input"
Write-Host "`n[+] OutPut Answer :"

$body = @{
    prompt = $input
    model = "text-davinci-003"
    max_tokens = 4000
    temperature = 1.0
}

$headers = @{
    'Content-Type' = 'application/json'
    'Authorization' = "PUT YOUR API KEY HERE  (Sample : Bearer sk-90ao3elx22vzOX2qCSx2T3BlbCFJ253L02aJobB4RnxQI0UY ) "
}

$jsonBody = $body | ConvertTo-Json

$response = Invoke-WebRequest -Uri "https://api.openai.com/v1/completions" -Method POST -Body $jsonBody -Headers $headers -ContentType 'application/json'
$response.Content | ConvertFrom-Json | select -ExpandProperty choices | select -ExpandProperty text