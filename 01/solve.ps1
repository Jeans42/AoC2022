$fn_in = "./input.data"

$data = Get-Content -Path $fn_in
$arr = @()

$cal = 0
$data | %{
    $d = $_
    
    if ($d -eq '') {
        $arr += $cal
        $cal = 0
    } else {
        $cal += [int]$d
    }
}


$sorted = $arr | Sort-Object -Descending
Write-Host "Highest: " + $sorted[0]
Write-Host "Top 3 Sum: " + $($sorted[0] + $sorted[1] + $sorted[2])
