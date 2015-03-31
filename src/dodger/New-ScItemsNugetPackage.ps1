<#
.SYNOPSIS
Builds a NuGet package from specified Sitecore items package.

.DESCRIPTION
Builds a NuGet package with a specified id and version
from a specified Sitecore items package.

.PARAMETER ItemsFile
The Sitecore items package file.

.PARAMETER PackageName
The NuGet package id.

.PARAMETER Version
The version of the NuGet package to create.

.PARAMETER OutputFolder
The folder where the generated NuGet package will be written.

.PARAMETER NugetCommand
A path to nuget.exe or just "nuget" if NuGet.exe is in the path.

.EXAMPLE
New-ScItemsNugetPackage -ItemsFile "./output/items.update" -PackageName "Post.Items" -Version "%GitVersion.NuGetVersionV2%" -OutputFolder "./output" -NugetCommand "%teamcity.tool.NuGet.CommandLine.DEFAULT.nupkg%\tools\nuget.exe"
#>
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
