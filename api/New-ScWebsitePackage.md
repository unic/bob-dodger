

# New-ScWebsitePackage

Builds and publishes every Visual Studio project in the repository.
## Syntax

    New-ScWebsitePackage [-MSBuildPath] <String> [-OutputFolder] <String> [[-TempPath] <String>] [[-SolutionPath] <String>] [<CommonParameters>]


## Description

Builds and publishes every Visual Studio project in the repository.





## Parameters

    
    -MSBuildPath <String>
_The path to msbuild.exe_

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 1 | true |  | false | false |


----

    
    
    -OutputFolder <String>
_The folder where all files should be published to._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 2 | true |  | false | false |


----

    
    
    -TempPath <String>
_A temp path which the build process should use._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 3 | false | $env:TEMP | false | false |


----

    
    
    -SolutionPath <String>

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 4 | false |  | false | false |


----

    

## Examples

### -------------------------- EXAMPLE 1 --------------------------
    New-ScWebsitePackage -MSBuildPath "C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe" -OutputFolder ./output































