function Set-TeamcityVariables
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $PackagesConfig
    )
    Process
    {
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
                Write-Host "##teamcity[setParameter name='unic.sc.version' value='$($package.version)']"
                $installed = $true
            }
            $i++
        }
    }
}
