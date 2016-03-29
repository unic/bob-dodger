<#

#>
Function New-ScSerializationNugetPackage
{
    [CmdletBinding(
    	SupportsShouldProcess=$True,
        ConfirmImpact="Low"
    )]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$Source,
        [Parameter(Mandatory=$true)]
        [string]$PackageName,
        [Parameter(Mandatory=$true)]
        [string]$Version,
        [Parameter(Mandatory=$true)]
        [string]$OutputFolder,
        [Parameter(Mandatory=$true)]
        [string]$NugetCommand,
        [bool]$DistributedSerialization = $true
        
	)
    Begin{}

    Process
    {
        $tempFolder = "$($env:TEMP)\$([Guid]::NewGuid())"
        mkdir $tempFolder | Out-Null
        
        $config = Get-ScProjectConfig $Source
        $basePath = Join-Path $Source $config.SerializationPath
        
        if($DistributedSerialization) {
            $projects = (ls $Source -Include *.csproj -Recurse)
            foreach($project in $projects) {
                $projectPath = Split-Path (Split-Path $project)
                $projectSerialization = "$projectPath\serialization"
                if(Test-Path $projectSerialization) {
                    Write-Host "Add $projectSerialization to $tempFolder\app.zip "
                    Add-RubbleArchiveFile -Path $projectSerialization  -ArchivePath "$tempFolder\app.zip" -RelativeToPath $basePath            
                }
                else {
                    Write-Host "$projectSerialization doesn't exist. Skip."
                }
            }
        }
        else {
            Add-RubbleArchiveFile -Path "$Source\serialization\app\"  -ArchivePath "$tempFolder\app.zip" -RelativeToPath $basePath
        }
        Add-RubbleArchiveFile -Path "$Source\serialization\appDefault" -ArchivePath "$tempFolder\appDefault.zip"
        
        New-NugetPackage `
        -BaseFolder $tempFolder `
        -PackageName $PackageName `
        -Version $Version `
        -OutputFolder $OutputFolder `
        -NugetCommand $NugetCommand
        
        rm $tempFolder -Recurse
    }
}
