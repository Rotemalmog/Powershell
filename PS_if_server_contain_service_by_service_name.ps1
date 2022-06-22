$list = @()
$Servers = Get-ADComputer -Filter  {operatingSystem -like "windows server 20*"}

foreach ($server in $Servers)
{
$service = null
$obj = New-Object -TypeName PSobject
$obj | Add-Member -MemberType NoteProperty -Name "Host Name" -Value $server.name
$service = Get-Service -ComputerName $server.Name -Name #service name#

 if ($service)
  {
    $obj | Add-Member -MemberType NoteProperty -Name "Service" -Value ("Contain")
  }
  else
  {
  $obj | Add-Member -MemberType NoteProperty -Name "Service" -Value ("Not Contain")
  }
  $list += $obj
}
$list | Export-Excel -Show