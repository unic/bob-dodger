<#
.SYNOPSIS
Sets all TeamCity parameters for a specific website build.
.DESCRIPTION
Sets the following TeamCity parameters for a specific website build:
* `unic.sitecore.version`
* `unic.sitecore.type`: Mvc or WebForms
* `unic.lofty.version`: Te version of lofty to use.
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
        $packagesConfig = Join-Path $WebsiteProjectDirectory "packages.config"
        if((Test-Path $packagesConfig)) {
            $xml = [xml](Get-Content $PackagesConfig)
            $types = @("Mvc", "WebForms")
            $i = 0
            while((-not $installed) -and ($i -lt $types.Length)) {
                $type = $types[$i]
                $packages = $xml.packages.package
                if(-not ($packages -is [Array])) {
                    $packages = @($packages)
                }
                $package = $xml.packages.package | ? {$_.id -eq "Sitecore.$type.Config"}
                if($package) {
                    Write-Host "##teamcity[setParameter name='unic.sitecore.version' value='$($package.version)']"
                    Write-Host "##teamcity[setParameter name='unic.sitecore.type' value='$type']"
                    $installed = $true
                }
                $i++
            }
        }

        $config = Get-ScProjectConfig $WebsiteProjectDirectory
        Write-Host "##teamcity[setParameter name='unic.lofty.version' value='$($config.LoftyVersion)']"

        $paddedBuildNumber = "{0:D4}" -f [int]$BuildNumber
        $paddedNugetVersion = $nugetVersion.Substring(0, $nugetVersion.Length -4) + $paddedBuildNumber
        Write-Host "##teamcity[setParameter name='GitVersion.NuGetVersionV2' value='$paddedNugetVersion']"

        Write-Host "##teamcity[buildNumber '$paddedNugetVersion']"

    }
}
