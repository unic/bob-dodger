

# New-ScSerializationPackage

Builds a Sitecore Update packages automatically with the help of Sitecore Courier, by analyzing two Sitecore packages and packaging only changed items.
## Syntax

    New-ScSerializationPackage [-Source] <String> [-Target] <String> [-OutputFile] <String> [-WhatIf] [-Confirm] [<CommonParameters>]


## Description

Builds a Sitecore Update packages automatically with the help of Sitecore Courier, by analyzing two Sitecore packages and packaging only changed items.





## Parameters

    
    -Source <String>

Path, which should point to the baseline serialization folder (this is the older version of the serialized item tree). If this path points to an empty folder, an update package with all serialized items in the target folder will be generated
The path must be either absolute or relative to the current working directory.





Required?  true

Position? 1

Default value? 

Accept pipeline input? false

Accept wildchard characters? false
    
    
    -Target <String>

Path, which should point to the latest (target) version of the serialized folder.
The path must be either absolute or relative to the current working directory.





Required?  true

Position? 2

Default value? 

Accept pipeline input? false

Accept wildchard characters? false
    
    
    -OutputFile <String>

The file wheree the Update Package should be written to





Required?  true

Position? 3

Default value? 

Accept pipeline input? false

Accept wildchard characters? false
    
    
    -WhatIf <SwitchParameter>

Required?  false

Position? named

Default value? 

Accept pipeline input? false

Accept wildchard characters? false
    
    
    -Confirm <SwitchParameter>

Required?  false

Position? named

Default value? 

Accept pipeline input? false

Accept wildchard characters? false
    

## Examples

### -------------------------- EXAMPLE 1 --------------------------
    New-ScSerializationPackage -Source D:\sourceSerialization -Target D:\targetSerialization -OutputFile D:\package.update































