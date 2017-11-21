

# New-ConfigNugetPackage

Builds the NuGet package containing all config files.
## Syntax

    New-ConfigNugetPackage [-Source] <String> [-PackageName] <String> [-Version] <String> [-OutputFolder] <String> [-NugetCommand] <String> [-WhatIf] [-Confirm] [<CommonParameters>]


## Description

Builds the NuGet package containing all config files.





## Parameters

    
    -Source <String>
_Path to the root of the repository._

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
| 4 | true |  | false | false |


----

    
    
    -NugetCommand <String>
_A path to nuget.exe or just "nuget" if NuGet.exe is in the path._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 5 | true |  | false | false |


----

    
    
    -WhatIf <SwitchParameter>

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| named | false |  | false | false |


----

    
    
    -Confirm <SwitchParameter>

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| named | false |  | false | false |


----

    

## Examples

### -------------------------- EXAMPLE 1 --------------------------
    New-ConfigNugetPackage -Source D:\projects\myProject -PackageName My.Config -Version 1.2.3 -OutputFolder D:\temp -NugetCommand .\tools\nuget.exe































