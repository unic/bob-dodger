<#
.SYNOPSIS
Returns true if the provided branch is release or hotfix branch.

.DESCRIPTION
Returns true if the provided branch is release or hotfix branch.

.PARAMETER Branch
The branch name to test.

.EXAMPLE
Test-ReleaseBuild -Branch refs/heads/release/0.1

.EXAMPLE
Test-ReleaseBuild -Branch develop

#>
function Test-ReleaseBuild
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $Branch
    )
    Process
    {
        $Branch = $Branch -replace "refs/heads/"

        $Branch -like "release/*" -or
        $Branch -like "hotfix/*"
    }
}
