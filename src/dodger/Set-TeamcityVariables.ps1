<#
.SYNOPSIS
Sets all TeamCity parameters for a specific website build.
.DESCRIPTION
Sets the following TeamCity parameters for a specific website build:
* `unic.sitecore.version`
* `unic.sitecore.type`: Mvc or WebForms
* `unic.lofty.version`: The version of Lofty to use.
* `GitVersion.NuGetVersionV2` will be adapted to include the TeamCity counter in it.

.PARAMETER WebsiteProjectDirectory
The path to the folder containing the csproj of a website.

.PARAMETER BuildNumber
The TeamCity build counter.

.PARAMETER NugetVersion
The current NuGet version, normally calculated by GitVersion

.EXAMPLE
Set-TeamcityVariables -WebsiteProjectDirectory .\src\My.Website -BuildNumber 123 -NugetVersion 1.2.3-beta0001

#>
function Set-TeamcityVariables
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $WebsiteProjectDirectory,
        [Parameter(Mandatory=$true)]
        [int] $BuildNumber,
        [Parameter(Mandatory=$true)]
        [string] $NugetVersion
    )
    Process
    {
        $config = Get-ScProjectConfig $WebsiteProjectDirectory
        
        Write-Host "##teamcity[setParameter name='unic.sitecore.version' value='$($config.SitecoreVersion)']"
        Write-Host "##teamcity[setParameter name='unic.sitecore.type' value='$(config.SitecoreType)']"
        
        Write-Host "##teamcity[setParameter name='unic.lofty.version' value='$($config.LoftyVersion)']"

        $paddedNugetVersion = $nugetVersion
        if($paddedNugetVersion.Contains("-") -and ($paddedNugetVersion.Length - ($paddedNugetVersion.IndexOf("-") + 1)) -ge 4) {
            $paddedBuildNumber = "{0:D4}" -f [int]$BuildNumber
            $paddedNugetVersion = $paddedNugetVersion.Substring(0, $paddedNugetVersion.Length - 4) + $paddedBuildNumber
        }
        Write-Host "##teamcity[setParameter name='GitVersion.NuGetVersionV2' value='$paddedNugetVersion']"

        Write-Host "##teamcity[buildNumber '$paddedNugetVersion']"

    }
}
