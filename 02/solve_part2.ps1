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
                    # loose: scissors
                    $score += 0 # from loose/draw/win
                    $score += 3 # from rock/paper/scissors
                }
                "Y" {
                    # draw: rock
                    $score += 3
                    $score += 1
                }
                "Z" {
                    # win: paper
                    $score += 6
                    $score += 2
                }
                Default { Write-Error "Invalid input"}
            }
         }
        "B" {  
            # Paper
            switch ($own) {
                "X" {
                    # loose: rock
                    $score += 0
                    $score += 1
                }
                "Y" {
                    # draw: paper
                    $score += 3
                    $score += 2
                }
                "Z" {
                    # win: scissors
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
                    # loose: paper
                    $score += 0
                    $score += 2
                }
                "Y" {
                    # draw: scissors
                    $score += 3
                    $score += 3
                }
                "Z" {
                    # win: rock
                    $score += 6
                    $score += 1
                }
                Default { Write-Error "Invalid input"}
            }
        }
        Default { Write-Error "Invalid input"}
    }
}

Write-Host "Score:" $score