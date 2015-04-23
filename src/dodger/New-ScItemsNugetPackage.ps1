<#
.SYNOPSIS
Builds a NuGet package from specified Sitecore items packages.

.DESCRIPTION
Builds a NuGet package with a specified id and version
from specified Sitecore items packages.

.PARAMETER ItemsFolder
The folder where all Sitecore item update packages must be placed.

.PARAMETER PackageName
The NuGet package id.

.PARAMETER Version
The version of the NuGet package to create.

.PARAMETER OutputFolder
The folder where the generated NuGet package will be written.

.PARAMETER NugetCommand
A path to nuget.exe or just "nuget" if NuGet.exe is in the path.

.EXAMPLE
New-ScItemsNugetPackage -ItemsFolder "./output/" -PackageName "Post.Items" -Version "%GitVersion.NuGetVersionV2%" -OutputFolder "./output" -NugetCommand "%teamcity.tool.NuGet.CommandLine.DEFAULT.nupkg%\tools\nuget.exe"
#>
function New-ScItemsNugetPackage
{
  [CmdletBinding()]
  Param(
      [Parameter(Mandatory=$true)]
      [string] $ItemsFolder,
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
    $ItemsFolder = Resolve-Path $ItemsFolder
    $OutputFolder = Resolve-Path $OutputFolder
    $tempNuspec = "$($env:TEMP)\$([Guid]::NewGuid()).nuspec"
    cp "$PSScriptRoot\Items.Template.nuspec.template" $tempNuspec
    & $nugetCommand "pack" $tempNuspec -p "ID=$PackageName" -p "BasePath=$ItemsFolder" -version $Version -OutputDirectory $OutputFolder
    rm $tempNuspec
    if($LASTEXITCODE -ne 0) {
        Write-Error "There was an error during creating items package $PackageName from folder $ItemsFolder."
    }
  }
}
