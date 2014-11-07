function New-ScItemsNugetPackage
{
  [CmdletBinding()]
  Param(
      [Parameter(Mandatory=$true)]
      [string] $ItemsFile,
      [Parameter(Mandatory=$true)]
      [string] $PackageName,
      [Parameter(Mandatory=$true)]
      [string] $Version,
      [Parameter(Mandatory=$true)]
      [string] $OutputFolder = ".",
      [string] $NugetCommand = "nuget"
  )
  Process
  {
    $ItemsFile = Resolve-Path $ItemsFile
    $OutputFolder = Resolve-Path $OutputFolder
    $tempNuspec = "$($env:TEMP)\$([Guid]::NewGuid()).nuspec"
    cp "$PSScriptRoot\Items.Template.nuspec.template" $tempNuspec
    & $nugetCommand "pack" $tempNuspec -p "ID=$PackageName" -p "SourceFile=$ItemsFile" -version $Version -OutputDirectory $OutputFolder
    rm $tempNuspec
    if($LASTEXITCODE -ne 0) {
        Write-Error "There was an error during creating items package $PackageName from file $ItemsFile."
    }
  }
}
