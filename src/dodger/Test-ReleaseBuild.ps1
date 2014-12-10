function Test-ReleaseBuild
{
  [CmdletBinding()]
  Param(
      [Parameter(Mandatory=$true)]
      [string] $Branch
  )
  Process
  {
    $Branch -like "release/*" -or
    $Branch -like "hotfix/*"
  }
}
