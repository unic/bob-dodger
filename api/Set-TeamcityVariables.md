

# Set-TeamcityVariables

Sets all TeamCity parameters for a specific website build.
## Syntax

    Set-TeamcityVariables [-WebsiteProjectDirectory] <String> [-BuildNumber] <Int32> [-NugetVersion] <String> [<CommonParameters>]


## Description

Sets the following TeamCity parameters for a specific website build:
* `unic.sitecore.version`
* `unic.sitecore.type`: Mvc or WebForms
* `unic.lofty.version`: The version of Lofty to use.
* `GitVersion.NuGetVersionV2` will be adapted to include the TeamCity counter in it.





## Parameters

    
    -WebsiteProjectDirectory <String>
_The path to the folder containing the csproj of a website._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 1 | true |  | false | false |


----

    
    
    -BuildNumber <Int32>
_The TeamCity build counter._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 2 | true | 0 | false | false |


----

    
    
    -NugetVersion <String>
_The current NuGet version, normally calculated by GitVersion_

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 3 | true |  | false | false |


----

    

## Examples

### -------------------------- EXAMPLE 1 --------------------------
    Set-TeamcityVariables -WebsiteProjectDirectory .\src\My.Website -BuildNumber 123 -NugetVersion 1.2.3-beta0001































