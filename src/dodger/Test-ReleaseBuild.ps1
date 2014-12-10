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
