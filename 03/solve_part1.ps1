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
$data | %{
    $line = $_
    $comp1 = $line[0 .. $(($line.Length/2) - 1)] | Select-Object -Unique
    $comp2 = $line[($line.Length/2) .. $($line.Length - 1)] | Select-Object -Unique
    
    $comp1 | %{
        if ($comp2 -ccontains $_) {
            # match: current letter of comp1 ($_) is existing in comp2
            $prio += Get-Priority $_
        }
    }
}
Write-Host "Total prio: " $prio