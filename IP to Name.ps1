$ipaddress = Get-Content -Path "$($env:USERPROFILE)\Desktop\IP.txt"
$results = @()
ForEach ($ip in $ipaddress) {
  
    $o = new-object psobject
    $o | Add-Member -MemberType NoteProperty -Name hostname -Value ([System.Net.Dns]::GetHostByAddress($ip).HostName)
    $results += $o
}
$results | Select-Object -Property hostname | Export-Csv "$($env:USERPROFILE)\Desktop\IP_$($env:USERNAME).csv" -Force