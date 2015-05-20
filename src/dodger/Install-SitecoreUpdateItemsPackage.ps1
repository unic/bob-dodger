<#
.SYNOPSIS
Installs the Sitecore update package to a specific location if Sitecore
was updated.

.DESCRIPTION
Compares two versions of a Sitecore website and if the Sitecore version was
changed between these two versions, it installs the Sitecore update items package
for the target version to a specific location.


.PARAMETER SourceWebsitePath
The path to the source version of the Sitecore website.

.PARAMETER TargetWebSitePath
The path to the target version of the Sitecore website.

.PARAMETER OutputLocation
The location where the items package should be installed to.

.EXAMPLE
Install-SitecoreUpdateItemsPackage ./reference/src/Customer.Website ./Customer.Website ./output

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
        function ParseVersion {
            param($Version)

            $versionParts = $Version.Split(".")
            if($versionParts.Count -lt 3) {
                Write-Warning "Could not parse version $Version"
            }
            else {
                @{
                    "Major" = $versionParts[0];
                    "Minor" = $versionParts[1];
                    "Patch" = $versionParts[2];
                    "Original" = $Version;
                }
            }
        }

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

        $sourceVersion = Parseversion (($sourcePackagesConfig.packages.package | ? {$_.id -eq "Sitecore"}).version)
        $targetVersion = ParseVersion (($targetPackagesConfig.packages.package | ? {$_.id -eq "Sitecore"}).version)
        if(-not $sourceVersion -or -not $targetVersion) {
            Write-Warning "Source or target version could not be found."
            return
        }

        if($sourceVersion.Major -eq $targetVersion.Major -and
            $sourceVersion.Minor -eq $targetVersion.Minor -and
            $sourceVersion.Patch -ne $targetVersion.Patch) {
                

            Install-NugetPackage -PackageId "Sitecore.Update" -Version $targetVersion.Original -OutputLocation $outputLocation -ProjectPath $TargetWebSitePath
        }
    }
}
