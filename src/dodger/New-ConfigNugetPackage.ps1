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
        [string]$NugetCommand
        
	)
    Begin{}

    Process
    {
        $tempFolder = "$($env:TEMP)\$([Guid]::NewGuid())"
        mkdir $tempFolder | Out-Null
        
        $config = Get-ScProjectConfig $Source
        $basePath = Join-Path $Source $config.SerializationPath
        
        $projects = (ls $ProjectPath -Include *.csproj -Recurse)
        foreach($project in $projects) {
            $folder = Split-Path $project
            $name = [System.IO.Path]::GetFileNameWithoutExtension((Get-Item $project).Name)
            
            $configFolder = "$tempFolder\$name" 
            mkdir $configFolder
            cp $folder\Web.*.config $configFolder
        }
        
        cp "$($config.WebsitePath)\Bob.config" $tempFolder
        
        New-NugetPackage `
        -BaseFolder $tempFolder `
        -PackageName $PackageName `
        -Version $Version `
        -OutputFolder $OutputFolder `
        -NugetCommand $NugetCommand
        
        rm $tempFolder -Recurse
    }
}
