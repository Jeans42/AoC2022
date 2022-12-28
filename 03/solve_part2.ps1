function Get-Priority {
    param ([char] $letter)
    if ($letter -le "Z"){
        # 65: "A" from ASCII table; 27: offset of prio
        [int][char]$letter - 65 + 27
    } else {
        [int][char]$letter - 96
    }
}


$fp_in = ".\input.data"

$data = Get-Content $fp_in

$prio = 0
for ($i = 0; $i -lt $data.length; $i += 3) {
    $line1 = [char[]]$data[$i] | Select-Object -Unique
    $line2 = [char[]]$data[$i + 1] | Select-Object -Unique
    $line3 = [char[]]$data[$i + 2] | Select-Object -Unique

    $line1 | %{
        if (($line2 -ccontains $_) -and ($line3 -ccontains $_)) {
            # match: current letter of line1 ($_) is existing in line2 and line3
            $prio += Get-Priority $_
        }
    }
}
Write-Host "Total prio: " $prio