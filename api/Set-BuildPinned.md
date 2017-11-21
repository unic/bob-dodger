

# Set-BuildPinned

Pins a specific TeamCity build.
## Syntax

    Set-BuildPinned [-BuildId] <String> [-User] <String> [-Password] <String> [<CommonParameters>]


## Description

Pinns a specific TeamCity build with the REST API.





## Parameters

    
    -BuildId <String>
_The unique id of a build._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 1 | true |  | false | false |


----

    
    
    -User <String>
_The username to log in to the TeamCity server._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 2 | true |  | false | false |


----

    
    
    -Password <String>
_The password of the $User._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 3 | true |  | false | false |


----

    

## Examples

### -------------------------- EXAMPLE 1 --------------------------
    Set-BuildPinned -BuildId 1234 -User myusere -Password Secret$































