

# New-NugetPackage

Builds a NuGet package.
## Syntax

    New-NugetPackage [-BaseFolder] <String> [-PackageName] <String> [-Version] <String> [-OutputFolder] <String> [[-NugetCommand] <String>] [<CommonParameters>]


## Description

Builds a NuGet package with a specified id and version
from specified folder.





## Parameters

    
    -BaseFolder <String>
_The folder containing the content to pack._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 1 | true |  | false | false |


----

    
    
    -PackageName <String>
_The NuGet package id._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 2 | true |  | false | false |


----

    
    
    -Version <String>
_The version of the NuGet package to create._

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
    New-NugetPackage -ItemsFolder "./output/" -PackageName "Post.Items" -Version "%GitVersion.NuGetVersionV2%" -OutputFolder "./output" -NugetCommand "%teamcity.tool.NuGet.CommandLine.DEFAULT.nupkg%\tools\nuget.exe"































