$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

function Install-NugetPackage {
    Param(
        [Parameter(Mandatory=$true, ParameterSetName ="FindPackage")]
        [string] $PackageId,
        [Parameter(Mandatory=$true)]
        [string] $OutputLocation,
        [Parameter(ParameterSetName ="FindPackage")]
        [string] $Version,
        [string] $ProjectPath
    )
}

Describe "Install-SitecoreUpdateItemsPackage" {
    Context "When the target SC version is newer than the source" {
        $source = "TestDrive:\source"
        $target = "TestDrive:\target"
        mkdir $source
        mkdir $target

        @"
<?xml version="1.0" encoding="utf-8"?>
<packages>
    <package id="Sitecore" version="7.1.12345.90" targetFramework="net40" />
</packages>
"@ | Out-File "$source\packages.config"


        @"
<?xml version="1.0" encoding="utf-8"?>
<packages>
    <package id="Sitecore" version="7.1.23456.91" targetFramework="net40" />
</packages>
"@ | Out-File "$target\packages.config"

        $packageOutput = "TestDrive:\output"

        Mock Install-NugetPackage {} -Verifiable -ParameterFilter {$PackageId -eq "Sitecore.Update" -and $OutputLocation -eq $packageOutput -and $Version -eq "7.1.23456.91"}

        Install-SitecoreUpdateItemsPackage -SourceWebSitePath $source -TargetWebSitePath $target -OutputLocation $packageOutput

        It "Should install the update package for the target version" {
            Assert-VerifiableMocks
        }
    }
}
