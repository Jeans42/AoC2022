$fn_in = ".\input.data"

$data = Get-Content $fn_in

$score = 0
$data | %{
    $other = $_[0]
    $own = $_[2]
    switch ($other) {
        "A" { 
            # Rock
            switch ($own) {
                "X" {
                    # Rock
                    $score += 3
                    $score += 1
                }
                "Y" {
                    # Paper
                    $score += 6
                    $score += 2
                }
                "Z" {
                    # Scissors
                    $score += 0
                    $score += 3
                }
                Default { Write-Error "Invalid input"}
            }
         }
        "B" {  
            # Paper
            switch ($own) {
                "X" {
                    # Rock
                    $score += 0
                    $score += 1
                }
                "Y" {
                    # Paper
                    $score += 3
                    $score += 2
                }
                "Z" {
                    # Scissors
                    $score += 6
                    $score += 3
                }
                Default { Write-Error "Invalid input"}
            }
        }
        "C" {  
            # Scissors
            switch ($own) {
                "X" {
                    # Rock
                    $score += 6
                    $score += 1
                }
                "Y" {
                    # Paper
                    $score += 0
                    $score += 2
                }
                "Z" {
                    # Scissors
                    $score += 3
                    $score += 3
                }
                Default { Write-Error "Invalid input"}
            }
        }
        Default { Write-Error "Invalid input"}
    }
}

Write-Host "Score:" $score