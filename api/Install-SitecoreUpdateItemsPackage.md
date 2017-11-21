

# Install-SitecoreUpdateItemsPackage

Installs the Sitecore update package to a specific location if Sitecore
was updated.
## Syntax

    Install-SitecoreUpdateItemsPackage [-SourceWebsitePath] <String> [-TargetWebSitePath] <String> [-OutputLocation] <String> [<CommonParameters>]


## Description

Compares two versions of a Sitecore website and if the Sitecore version was
changed between these two versions, it installs the Sitecore update items package
for the target version to a specific location.





## Parameters

    
    -SourceWebsitePath <String>
_The path to the source version of the Sitecore website._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 1 | true |  | false | false |


----

    
    
    -TargetWebSitePath <String>
_The path to the target version of the Sitecore website._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 2 | true |  | false | false |


----

    
    
    -OutputLocation <String>
_The location where the items package should be installed to._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 3 | true |  | false | false |


----

    

## Examples

### -------------------------- EXAMPLE 1 --------------------------
    Install-SitecoreUpdateItemsPackage ./reference/src/Customer.Website ./Customer.Website ./output































