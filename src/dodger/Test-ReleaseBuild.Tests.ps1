$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

Describe "Test-ReleaseBuild" {
    Context "When providing release branch" {

    It "Should return true" {
       Test-ReleaseBuild "release/0.1"| Should Be $true
    }
    }
    Context "When providing hotfix branch" {

      It "Should return true" {
        Test-ReleaseBuild "hotfix/0.1.1"| Should Be $true
      }
    }
    Context "When providing hotfix branch" {

        It "Should return true" {
            Test-ReleaseBuild "refs/heads/hotfix/0.1.1"| Should Be $true
        }
    }
    Context "When providing develop branch" {

        It "Should return true" {
            Test-ReleaseBuild "develop"| Should Be $false
        }
    }
}
