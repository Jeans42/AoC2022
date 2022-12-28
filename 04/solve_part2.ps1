$fn_in = ".\test.data"
$data = Get-Content $fn_in

$match = $data.Length
$data | %{
    $raw = $_.Split(",")
    $raw1 = $raw[0]
    $raw2 = $raw[1]

    $range1 = $raw1.Split("-")
    $lower1 = [int]$range1[0]
    $higher1 = [int]$range1[1]

    $range2 = $raw2.Split("-")
    $lower2 = [int]$range2[0]
    $higher2 = [int]$range2[1]

    if ((($higher2 -lt $lower1) -or ($higher1 -lt $lower2))) {
        $match -= 1
    }
}

Write-Host "Found " $match " such pairs"