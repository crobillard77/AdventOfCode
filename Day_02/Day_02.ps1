# ELFE: A for Rock, B for Paper, and C for Scissors
# ME  : X for Rock, Y for Paper, and Z for Scissors

# The score for a single round is the score for the shape you selected (1 for Rock, 2 for Paper, and 3 for Scissors)
# Plus the score for the outcome of the round (0 if you lost, 3 if the round was a draw, and 6 if you won)

$InputList = Get-Content -Path '.\Input.txt' | ForEach-Object {$_.Trim()}
$MyTotalScore = 0

ForEach ($InputLine in $InputList) {

    $TotalRoundPoint = 0

    $InputLineSplit = $InputLine -split ' '
    $Me = $InputLineSplit[1] | ForEach-Object {$_ -replace 'X', 'A'} | ForEach-Object {$_ -replace 'Y', 'B'} | ForEach-Object {$_ -replace 'Z', 'C'}
    $Elfe = $InputLineSplit[0] 

    Switch ($Me) {
        'A' {$TotalRoundPoint = $TotalRoundPoint + 1}
        'B' {$TotalRoundPoint = $TotalRoundPoint + 2}
        'C' {$TotalRoundPoint = $TotalRoundPoint + 3}
    }

    If ($Me -eq $Elfe) {

        # Draw
        Write-Host 'Result: DRAW'
        $TotalRoundPoint = $TotalRoundPoint + 3 

    } ElseIf (($Me -eq 'B' -and $Elfe -eq 'A') -or ($Me -eq 'A' -and $Elfe -eq 'C') -or ($Me -eq 'C' -and $Elfe -eq 'B')) {

        # Win
        Write-Host 'Result: WIN'
        $TotalRoundPoint = $TotalRoundPoint + 6
    }
 
    # Calculate the score
    $MyTotalScore = $MyTotalScore + $TotalRoundPoint
}

Write-Host 'My SCORE:' $MyTotalScore

