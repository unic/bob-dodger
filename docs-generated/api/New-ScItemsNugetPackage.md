

# New-ScItemsNugetPackage

Builds a NuGet package from a items package.
## Syntax

    New-ScItemsNugetPackage [-ItemsFile] <String> [-PackageName] <String> [-Version] <String> [-OutputFolder] <String> [[-NugetCommand] <String>] [<CommonParameters>]



## Parameters

    
    -ItemsFile <String>

Required?  true

Position? 1

Default value? 

Accept pipeline input? false

Accept wildchard characters? false
    
    
    -PackageName <String>

Required?  true

Position? 2

Default value? 

Accept pipeline input? false

Accept wildchard characters? false
    
    
    -Version <String>

Required?  true

Position? 3

Default value? 

Accept pipeline input? false

Accept wildchard characters? false
    
    
    -OutputFolder <String>

Required?  true

Position? 4

Default value? .

Accept pipeline input? false

Accept wildchard characters? false
    
    
    -NugetCommand <String>

Required?  false

Position? 5

Default value? nuget

Accept pipeline input? false

Accept wildchard characters? false
    

## Examples

### -------------------------- EXAMPLE 1 --------------------------
    New-ScItemsNugetPackage -ItemsFile "./output/items.update" -PackageName "Post.Items" -Version "%GitVersion.NuGetVersionV2%" -OutputFolder "./output" -NugetCommand "%teamcity.tool.NuGet.CommandLine.DEFAULT.nupkg%\tools\nuget.exe"































