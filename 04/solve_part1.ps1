$fn_in = ".\input.data"
$data = Get-Content $fn_in

$match = 0
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

    if ((($lower1 -ge $lower2) -and ($higher1 -le $higher2)) -or (($lower2 -ge $lower1) -and ($higher2 -le $higher1))) {
        $match += 1
    }
}

Write-Host "Found " $match " such pairs"