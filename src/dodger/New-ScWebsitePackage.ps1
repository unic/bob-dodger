<#

#>
function New-ScWebsitePackage
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$MSBuildPath,
        [Parameter(Mandatory=$true)]
        [string]$PackageName,
        [Parameter(Mandatory=$true)]
        [string] $Version,
        [Parameter(Mandatory=$true)]
        [string] $OutputFolder = ".",
        [string] $NugetCommand = "nuget",
        [string]$TempPath = $env:TEMP
    )
    Process
    {
        $projects = (ls $ProjectPath -Include *.csproj -Recurse)
        
        $tempPath = "$TempPath\$([guid]::NewGuid().Guid)"
        mkdir $tempPath
        
        $buildPath = "$tempPath\build"
        $output = "$tempPath\output\"
        mkdir $output
        
        foreach($project in $projects) {
            & $MSBuildPath $project /p:OutputPath=$buildPath
            $name = [System.IO.Path]::GetFileNameWithoutExtension((Get-Item $project).Name)
            $websitePath = "$buildPath\_PublishedWebsites\$name"
            if(Test-Path $websitePath) { 
                xcopy "$websitePath" $output /y /s
            }
        }
        
        New-ScWebsiteNugetPackage `
          -WebsiteFolder $output `
          -PackageName $PackageName `
          -Version $Version `
          -OutputFolder $OutputFolder `
          -NugetCommand $NugetCommand
          
        rm $tempPath -Recurse       
    }
}
