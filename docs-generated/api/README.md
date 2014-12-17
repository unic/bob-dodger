# Dodger - API

##  New-ScItemsNugetPackage
Builds a NuGet package from a items package.    
    
    New-ScItemsNugetPackage [-ItemsFile] <String> [-PackageName] <String> [-Version] <String> [-OutputFolder] <String> [[-NugetCommand] <String>] [<CommonParameters>]


 [Read more](New-ScItemsNugetPackage.md)
##  New-ScSerializationPackage
Builds a Sitecore Update packages automatically with the help of Sitecore Courier, by analyzing two Sitecore packages and packaging only changed items.    
    
    New-ScSerializationPackage [-Source] <String> [-Target] <String> [-OutputFile] <String> [-WhatIf] [-Confirm] [<CommonParameters>]


 [Read more](New-ScSerializationPackage.md)
##  New-ScWebsiteNugetPackage
    New-ScWebsiteNugetPackage [-WebsiteFolder] <string> [-PackageName] <string> [-Version] <string> [-OutputFolder] <string> [[-NugetCommand] <string>] [<CommonParameters>]


 [Read more](New-ScWebsiteNugetPackage.md)
##  ResolvePath
    ResolvePath [[-PackageId] <Object>] [[-RelativePath] <Object>]


 [Read more](ResolvePath.md)
##  Set-BuildPinned
    Set-BuildPinned [-BuildId] <string> [-User] <string> [-Password] <string> [<CommonParameters>]


 [Read more](Set-BuildPinned.md)
##  Set-TeamcityVariables
    Set-TeamcityVariables [-WebsiteProjectDirectory] <string> [<CommonParameters>]


 [Read more](Set-TeamcityVariables.md)
##  Test-ReleaseBuild
    Test-ReleaseBuild [-Branch] <string> [<CommonParameters>]


 [Read more](Test-ReleaseBuild.md)

