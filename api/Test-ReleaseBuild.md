

# Test-ReleaseBuild

Returns true if the provided branch is a release or hotfix branch.
## Syntax

    Test-ReleaseBuild [-Branch] <String> [<CommonParameters>]


## Description

Returns true if the provided branch is a release or hotfix branch.





## Parameters

    
    -Branch <String>
_The branch name to test._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 1 | true |  | false | false |


----

    

## Examples

### -------------------------- EXAMPLE 1 --------------------------
    Test-ReleaseBuild -Branch refs/heads/release/0.1






























### -------------------------- EXAMPLE 2 --------------------------
    Test-ReleaseBuild -Branch develop































