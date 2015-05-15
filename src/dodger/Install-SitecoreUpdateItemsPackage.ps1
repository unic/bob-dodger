<#
.SYNOPSIS

.DESCRIPTION


.PARAMETER

.EXAMPLE

#>
function Install-SitecoreUpdateItemsPackage
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $SourceWebsitePath,
        [Parameter(Mandatory=$true)]
        [string] $TargetWebSitePath,
        [Parameter(Mandatory=$true)]
        [string] $OutputLocation
    )
    Process
    {
        $sourcePackagesConfigFile = "$SourceWebsitePath\packages.config"
        if(-not (Test-Path $sourcePackagesConfigFile)) {
            Write-Warning "$sourcePackagesConfigFile could not be found"
            return
        }

        $targetPackagesConfigFile = "$TargetWebSitePath\packages.config"
        if(-not (Test-Path $targetPackagesConfigFile)) {
            Write-Warning "$targetPackagesConfigFile could not be found"
            return
        }

        [xml]$sourcePackagesConfig = Get-Content $sourcePackagesConfigFile
        [xml]$targetPackagesConfig = Get-Content $targetPackagesConfigFile

        $sourceVersion = ($sourcePackagesConfig.packages.package | ? {$_.id -eq "Sitecore"}).version
        $targetVersion = ($targetPackagesConfig.packages.package | ? {$_.id -eq "Sitecore"}).version
        if(-not $sourceVersion -or -not $targetVersion) {
            Write-Warning "Source or target version could not be found."
            return
        }

        if($sourceVersion -ne $targetVersion) {
            Install-NugetPackage -PackageId "Sitecore.Update" -Version $targetVersion -OutputLocation $outputLocation -ProjectPath $TargetWebSitePath
        }
    }
}
