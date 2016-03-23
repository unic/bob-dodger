<#

#>
function New-ScWebsitePackage
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$MSBuildPath,
        [Parameter(Mandatory=$true)]
        [string] $OutputFolder,
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
