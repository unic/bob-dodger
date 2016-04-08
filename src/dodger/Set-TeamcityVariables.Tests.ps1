$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
Import-Module "$here\dodger.psm1" -Force

Describe "Set-TeamcityVariables" {
  
  Context "When Bob.config contains WebForms" {
  @"
<?xml version="1.0" encoding="utf-8"?>
<Configuration>
    <SitecoreVersion>7.2.12345.18</SitecoreVersion>
    <SitecoreType>WebForms</SitecoreType>
</Configuration>
"@ | Out-File "TestDrive:\Bob.config" -Encoding UTF8

  Mock Write-Host {} -Verifiable  -ParameterFilter {$Object -eq "##teamcity[setParameter name='unic.sitecore.version' value='7.2.12345.18']"} -ModuleName Dodger
  Mock Write-Host {} -Verifiable  -ParameterFilter {$Object -eq "##teamcity[setParameter name='unic.sitecore.type' value='WebForms']"} -ModuleName Dodger


  Set-TeamcityVariables -WebsiteProjectDirectory "TestDrive:\" -BuildNumber 0 -NugetVersion "0001"

        It "Should have set the Teamcity parameter" {
            Assert-VerifiableMocks
        }
    }

    Context "Should set lofty version" {
        @"
<?xml version="1.0" encoding="utf-8"?>
<configuration>
    <LoftyVersion>1.2</LoftyVersion>
</configuration>
"@ | Out-File "TestDrive:\Bob.config" -Encoding UTF8


        Mock Write-Host {} -Verifiable  -ParameterFilter {$Object -eq "##teamcity[setParameter name='unic.lofty.version' value='1.2']"} -ModuleName Dodger

        Set-TeamcityVariables -WebsiteProjectDirectory "TestDrive:\" -BuildNumber 0 -NugetVersion "0001"

        It "Should have set lofty version" {
            Assert-VerifiableMocks
        }
    }

    Context "Should set buildNumber version" {

        Mock Write-Host {} -Verifiable  -ParameterFilter {$Object -eq "##teamcity[buildNumber '0.1-beta0012']"} -ModuleName Dodger

        Set-TeamcityVariables -WebsiteProjectDirectory "TestDrive:\" -BuildNumber 12 -NugetVersion "0.1-beta0002"

        It "Should have set buildNumber version" {
            Assert-VerifiableMocks
        }
    }

    Context "Should set buildNumber version for major builds" {

        Mock Write-Host {} -Verifiable  -ParameterFilter {$Object -eq "##teamcity[buildNumber '1.1']"} -ModuleName Dodger

        Set-TeamcityVariables -WebsiteProjectDirectory "TestDrive:\" -BuildNumber 12 -NugetVersion "1.1"

        It "Should have set buildNumber version" {
            Assert-VerifiableMocks
        }
    }
}
