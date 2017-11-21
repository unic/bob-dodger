

# New-ScWebsiteNugetPackage

Generates a NuGet package for a Sitecore Website.
## Syntax

    New-ScWebsiteNugetPackage [-WebsiteFolder] <String> [-PackageName] <String> [-Version] <String> [-OutputFolder] <String> [[-NugetCommand] <String>] [<CommonParameters>]


## Description

Generates a NuGet package for Octopus Deploy containing the whole output of a Website.





## Parameters

    
    -WebsiteFolder <String>
_The path to the build output of a website._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 1 | true |  | false | false |


----

    
    
    -PackageName <String>
_The name of the package to create._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 2 | true |  | false | false |


----

    
    
    -Version <String>
_The version of the package to generate._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 3 | true |  | false | false |


----

    
    
    -OutputFolder <String>
_The folder where the generated NuGet package will be written._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 4 | true | . | false | false |


----

    
    
    -NugetCommand <String>
_A path to nuget.exe or just "nuget" if NuGet.exe is in the path._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 5 | false | nuget | false | false |


----

    

## Examples

### -------------------------- EXAMPLE 1 --------------------------
    New-ScWebsiteNugetPackage -WebsiteFolder .\website\output -PackageName My.Website -Version 1.2.3 -OutputFolder D:\temp -NugetCommand .\tools\nuget.exe































