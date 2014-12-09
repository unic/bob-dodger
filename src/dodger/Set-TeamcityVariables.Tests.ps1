$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

Describe "Set-TeamcityVariables" {
  Context "When packagess.config contains only MVC" {
    @"
<?xml version="1.0" encoding="utf-8"?>
<packages>
    <package id="Sitecore.Mvc.Config" version="7.2.12345.18"/>
</packages>
"@ | Out-File "TestDrive:\packages.config" -Encoding UTF8

    Mock Write-Host {} -Verifiable  -ParameterFilter {$Object -eq "##teamcity[setParameter name='unic.sc.version' value='7.2.12345.18']"}

    Set-TeamcityVariables -PackagesConfig "TestDrive:\packages.config"

    It "Should have set the Teamcity parameter" {
        Assert-VerifiableMocks
    }
  }
  Context "When packages.config contains MVC and other packages" {
  @"
<?xml version="1.0" encoding="utf-8"?>
  <packages>
    <package id="Dummy" version="1.2.3"/>
    <package id="Dummy2" version="1.2.3"/>
    <package id="Sitecore.Mvc.Config" version="7.2.12345.18"/>
    <package id="Dummy3" version="1.2.3"/>
  </packages>
"@ | Out-File "TestDrive:\packages.config" -Encoding UTF8

  Mock Write-Host {} -Verifiable  -ParameterFilter {$Object -eq "##teamcity[setParameter name='unic.sc.version' value='7.2.12345.18']"}

  Set-TeamcityVariables -PackagesConfig "TestDrive:\packages.config"

  It "Should have set the Teamcity parameter" {
  Assert-VerifiableMocks
  }
  }
  Context "When packages.config contains WebForms and other packages" {
  @"
<?xml version="1.0" encoding="utf-8"?>
<packages>
  <package id="Dummy" version="1.2.3"/>
  <package id="Dummy2" version="1.2.3"/>
  <package id="Sitecore.WebForms.Config" version="7.2.12345.18"/>
  <package id="Dummy3" version="1.2.3"/>
</packages>
"@ | Out-File "TestDrive:\packages.config" -Encoding UTF8

  Mock Write-Host {} -Verifiable  -ParameterFilter {$Object -eq "##teamcity[setParameter name='unic.sc.version' value='7.2.12345.18']"}

  Set-TeamcityVariables -PackagesConfig "TestDrive:\packages.config"

  It "Should have set the Teamcity parameter" {
  Assert-VerifiableMocks
  }
  }
}
