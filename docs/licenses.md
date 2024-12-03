# Licensing Considerations


> [!WARNING]
> **The information on this page does not constitute legal advice.**
> 
> The information presented below is provided as general guidance only. For questions regarding licensing requirements for your specific circumstances, we strongly recommend that you seek professional legal advice.


This page examines the licenses of proprietary software that is commonly used to build and run Unreal Engine under Windows, and identifies any restrictions that are relevant when running the software under Wine rather than a real version of Windows.


## Contents

- [Visual Studio toolchain licenses](#visual-studio-toolchain-licenses)
    - [Visual Studio Build Tools](#visual-studio-build-tools)
    - [Windows SDK](#windows-sdk)
- [.NET Framework licenses](#net-framework-licenses)
    - [.NET Framework runtime](#net-framework-runtime)
    - [.NET Framework reference assemblies](#net-framework-reference-assemblies)


## Visual Studio toolchain licenses

### Visual Studio Build Tools

The licenses for [Visual Studio 2022](https://visualstudio.microsoft.com/license-terms/vs2022-ga-proenterprise/) (including Section 4(b), which outlines the specific terms relating to the Visual Studio Build Tools) and the [Visual C++ Build Tools](https://visualstudio.microsoft.com/license-terms/mt644918/) do not include any wording that restricts the use of these software components on non-Windows operating systems.

It is unlikely that Microsoft will introduce future licensing restrictions that limit the use of these software components to Windows environments, since such restrictions would potentially violate anti-trust laws in some jurisdictions. For more information, see the [licensing FAQ for CodeWeavers CrossOver](https://www.codeweavers.com/store/licensing/#cxms).

### Windows SDK

The license for the Windows SDK includes wording describing *"programs that run on a Microsoft operating system"*, but this appears to refer only to programs that are developed, built and tested using the Windows SDK rather than the SDK itself. The license does not appear to include any wording that restricts the use of the Windows SDK itself on non-Windows operating systems.

It is unlikely that Microsoft will introduce future licensing restrictions that limit the use of the Windows SDK to Windows environments, for the same reasons discussed in the [*Visual Studio Build Tools*](#visual-studio-build-tools) section above.


## .NET Framework licenses

### .NET Framework runtime

In order to run applications that were built against a given version of the .NET Framework, the runtime for that framework version must be present. There are two runtimes that support .NET Framework versions 1.0 through 4.8:

- The proprietary Microsoft [implementation of the .NET Framework](https://learn.microsoft.com/en-us/dotnet/fundamentals/implementations#net-framework) (license details below)
- The open source [Mono](https://learn.microsoft.com/en-us/dotnet/fundamentals/implementations#mono) implementation ([licensed](https://github.com/mono/mono/blob/main/LICENSE) under the permissive [MIT License](https://opensource.org/license/mit/))

The end-user license agreement (EULA) for the proprietary Microsoft .NET Framework runtime takes the form of a supplemental license for Windows, and only permits use of the .NET Framework runtime with a validly licensed copy of Windows. Microsoft does not appear to provide a web copy of the EULA, but you can find a [copy of the EULA](https://docs.aws.amazon.com/codebuild/latest/userguide/notice.html#7-windows-base-docker-image-4-6-2) on the [*Third party notices for AWS CodeBuild for Windows*](https://docs.aws.amazon.com/codebuild/latest/userguide/notice.html) page of the AWS CodeBuild Documentation, and the relevant wording is also reproduced in the excerpt below:

> *MICROSOFT SOFTWARE SUPPLEMENTAL LICENSE TERMS*
> 
> *.NET FRAMEWORK AND ASSOCIATED LANGUAGE PACKS FOR MICROSOFT WINDOWS OPERATING SYSTEM*
> 
> *Microsoft Corporation (or based on where you live, one of its affiliates) licenses this supplement to you. If you are licensed to use Microsoft Windows operating system software (the "software"), you may use this supplement. You may not use it if you do not have a license for the software. You may use this supplement with each validly licensed copy of the software.*
> 
> ...
> 
> *1. DISTRIBUTABLE CODE. The supplement is comprised of Distributable Code. "Distributable Code" is code that you are permitted to distribute in programs you develop if you comply with the terms below.*
> 
> ...
> 
> *c. Distribution Restrictions. You may not*
> 
> ...
> 
> - *distribute Distributable Code to run on a platform other than the Windows platform;*

Based on this wording, it is possible that installing the proprietary .NET Framework runtime under Wine represents a potential violation of the EULA. **It is therefore recommended that the open source Mono runtime be used to run .NET Framework applications under Wine.**

### .NET Framework reference assemblies

In order to build applications that target a given version of the .NET Framework, the compiler requires the [reference assemblies](https://learn.microsoft.com/en-us/dotnet/standard/assembly/reference-assemblies) for that framework version. Microsoft provides these reference assemblies via three distribution channels:

- Standalone [.NET Framework targeting pack](https://dotnet.microsoft.com/en-us/download/visual-studio-sdks#supported-versions-framework) installers
- Targeting pack components that can be installed through Visual Studio
- The [Microsoft.NETFramework.ReferenceAssemblies](https://www.nuget.org/packages/Microsoft.NETFramework.ReferenceAssemblies) NuGet package

The standalone .NET Framework targeting packs and their corresponding Visual Studio components are licensed under the same EULA as the proprietary Microsoft .NET Framework runtime. It is therefore possible that installing the reference assemblies via these distribution channels under Wine represents a potential violation of the EULA.

By contrast, the `Microsoft.NETFramework.ReferenceAssemblies` NuGet package is licensed under the permissive MIT License, and is explicitly [intended for use on non-Windows operating systems](https://github.com/microsoft/dotnet/tree/main/releases/reference-assemblies). **It is therefore recommended that the NuGet package be used to obtain the .NET Framework reference assemblies under Wine.**
