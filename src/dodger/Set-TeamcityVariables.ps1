function Set-TeamcityVariables
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $WebsiteProjectDirectory
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

    }
}
