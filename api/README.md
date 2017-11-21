# Dodger - API

##  Install-SitecoreUpdateItemsPackage
Installs the Sitecore update package to a specific location if Sitecore
was updated.    
    
    Install-SitecoreUpdateItemsPackage [-SourceWebsitePath] <String> [-TargetWebSitePath] <String> [-OutputLocation] <String> [<CommonParameters>]


 [Read more](Install-SitecoreUpdateItemsPackage.md)
##  New-ConfigNugetPackage
Builds the NuGet package containing all config files.    
    
    New-ConfigNugetPackage [-Source] <String> [-PackageName] <String> [-Version] <String> [-OutputFolder] <String> [-NugetCommand] <String> [-WhatIf] [-Confirm] [<CommonParameters>]


 [Read more](New-ConfigNugetPackage.md)
##  New-NugetPackage
Builds a NuGet package.    
    
    New-NugetPackage [-BaseFolder] <String> [-PackageName] <String> [-Version] <String> [-OutputFolder] <String> [[-NugetCommand] <String>] [<CommonParameters>]


 [Read more](New-NugetPackage.md)
##  New-ScSerializationNugetPackage
Builds the NuGet package containing all serialization files.    
    
    New-ScSerializationNugetPackage [-Source] <String> [-PackageName] <String> [-Version] <String> [-OutputFolder] <String> [-NugetCommand] <String> [[-DistributedSerialization] <Boolean>] [-WhatIf] [-Confirm] [<CommonParameters>]


 [Read more](New-ScSerializationNugetPackage.md)
##  New-ScSerializationPackage
Builds a Sitecore Update packages automatically with the help of Sitecore Courier, by analyzing two Sitecore packages and packaging only changed items.    
    
    New-ScSerializationPackage [-Source] <String> [-Target] <String> [-OutputFile] <String> [[-CollisionMode] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]


 [Read more](New-ScSerializationPackage.md)
##  New-ScWebsiteNugetPackage
Generates a NuGet package for a Sitecore Website.    
    
    New-ScWebsiteNugetPackage [-WebsiteFolder] <String> [-PackageName] <String> [-Version] <String> [-OutputFolder] <String> [[-NugetCommand] <String>] [<CommonParameters>]


 [Read more](New-ScWebsiteNugetPackage.md)
##  New-ScWebsitePackage
Builds and publishes every Visual Studio project in the repository.    
    
    New-ScWebsitePackage [-MSBuildPath] <String> [-OutputFolder] <String> [[-TempPath] <String>] [[-SolutionPath] <String>] [<CommonParameters>]


 [Read more](New-ScWebsitePackage.md)
##  ResolvePath
    ResolvePath [[-PackageId] <Object>] [[-RelativePath] <Object>]


 [Read more](ResolvePath.md)
##  Set-BuildPinned
Pins a specific TeamCity build.    
    
    Set-BuildPinned [-BuildId] <String> [-User] <String> [-Password] <String> [<CommonParameters>]


 [Read more](Set-BuildPinned.md)
##  Set-TeamcityVariables
Sets all TeamCity parameters for a specific website build.    
    
    Set-TeamcityVariables [-WebsiteProjectDirectory] <String> [-BuildNumber] <Int32> [-NugetVersion] <String> [<CommonParameters>]


 [Read more](Set-TeamcityVariables.md)
##  Test-ReleaseBuild
Returns true if the provided branch is a release or hotfix branch.    
    
    Test-ReleaseBuild [-Branch] <String> [<CommonParameters>]


 [Read more](Test-ReleaseBuild.md)

