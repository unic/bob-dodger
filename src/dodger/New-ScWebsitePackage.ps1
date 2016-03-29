<#
.SYNOPSIS
Builds and publishes every Visual Studio project in the repository.

.DESCRIPTION
Builds and publishes every Visual Studio project in the repository.

.PARAMETER MSBuildPath
The path to msbuild.exe

.PARAMETER OutputFolder
The folder where all files should be published to.

.PARAMETER TempPath
A temp path which the build process should use.

.EXAMPLE
New-ScWebsitePackage -MSBuildPath "C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe" -OutputFolder ./output

#>
function New-ScWebsitePackage
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$MSBuildPath,
        [Parameter(Mandatory=$true)]
        [string]$OutputFolder,
        [string]$TempPath = $env:TEMP
    )
    Process
    {
        $projects = (ls $ProjectPath -Include *.csproj -Recurse)
        
        $tempPath = "$TempPath\$([guid]::NewGuid().Guid)"
        mkdir $tempPath
        
        $buildPath = "$tempPath\build"
        if(-not (Test-Path $OutputFolder)) {
            mkdir $OutputFolder
        }
        
        foreach($project in $projects) {
            & $MSBuildPath $project /p:OutputPath=$buildPath
            $name = [System.IO.Path]::GetFileNameWithoutExtension((Get-Item $project).Name)
            $websitePath = "$buildPath\_PublishedWebsites\$name"
            if(Test-Path $websitePath) { 
                xcopy "$websitePath" $OutputFolder /y /s
            }
        }
          
        rm $tempPath -Recurse       
    }
}
