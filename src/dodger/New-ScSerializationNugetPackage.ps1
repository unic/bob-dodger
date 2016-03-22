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
        [string]$SerializationPattern = "**/serialization/"
        
	)
    Begin{}

    Process
    {
        $tempFolder = "$($env:TEMP)\$([Guid]::NewGuid())"
        mkdir $tempFolder | Out-Null
        
        $config = Get-ScProjectConfig $Source
        $basePath = Join-Path $Source $config.SerializationPath
        
        # TODO ls over whole project for new Habitat architecure
        Add-RubbleArchiveFile -Path "$Source\serialization\app\"  -ArchivePath "$tempFolder\app.zip" -RelativeToPath $basePath
        Add-RubbleArchiveFile -Path "$Source\serialization\appDefault" -ArchivePath "$tempFolder\appDefault.zip"
        
        New-ScItemsNugetPackage `
        -ItemsFolder $tempFolder `
        -PackageName $PackageName `
        -Version $Version `
        -OutputFolder $OutputFolder `
        -NugetCommand $NugetCommand
        
        rm $tempFolder -Recurse
    }
}
