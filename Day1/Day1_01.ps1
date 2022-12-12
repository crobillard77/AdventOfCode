ForEach ($Group in $InputList) {

    $TotalElf = 0
    $Group = $Group -split '\r\n'

    ForEach ($GroupMember in $Group) {
        Write-Host $([Int]$GroupMember)
        $TotalElf = $TotalElf + $GroupMember
    }

    $TotalList += $TotalElf
}

$Total = $TotalList | Sort-Object | Select-Object -Last 1