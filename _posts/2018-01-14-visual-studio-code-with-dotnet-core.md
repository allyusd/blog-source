---
title: "Visual Studio Code with .Net Core"
tags: Visual-Studio-Code .Net-Core CSharp
---

.Net Core is cross-platform solution, Visual Studio Code is cross-platform development tool, that is a good choice.

## Install Visual Studio Code and .Net Core

First, install [Visual Studio Code](https://code.visualstudio.com/), current version is 1.19.2。

Then install [.NET Core](https://www.microsoft.com/net/), current version:

.Net Core SDK 2.1.4

.Net Core Runtime 2.0.5

## Hello World example

Create **hello_world** folder, open vs-code。

![](/assets/images/2018-01-14-visual-studio-code-with-dotnet-core/001.png)

Using **new** command create a console project in terminal ( Ctrl+` ). Will see files for project in explorer at left sidebar after execute.

```bash
dotnet new console
```

Then using **run** execute program, will display **Hello World**.

```bash
dotnet run
```

![](/assets/images/2018-01-14-visual-studio-code-with-dotnet-core/002.png)

[Missing dotnet restore command?](#dotnet-restore)

## Develop and Debugging

First file is **hello_world.csproj**, content is project setting.

```
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>netcoreapp2.0</TargetFramework>
  </PropertyGroup>

</Project>
```

Last file is **Program.cs**, is Hello World example code.

```csharp
using System;

namespace hello_world
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
        }
    }
}
```

If first open C# file, vs-code recommend install C# extension package, choose to install.

![](/assets/images/2018-01-14-visual-studio-code-with-dotnet-core/003.png)

Restart vs-code after install extension, will tip add debug config, just see yes.

![](/assets/images/2018-01-14-visual-studio-code-with-dotnet-core/004.png)

Just modify **Program.cs** like this:

```csharp
static void Main(string[] args)
{
    string name = "Jian-Ching";
    string message = "Hello " + name + "!";
    Console.WriteLine(message);
}
```

Set breakpoint (red smail point) at **Console.WriteLine** next line, then launch by F5, don't forget look variable info in debugging sidebar, and variable **message** will display vaule when mouse hover, and output result at below.

![](/assets/images/2018-01-14-visual-studio-code-with-dotnet-core/005.png)

## Console input

If only display coding text is not fun. So we make program accept input name.

First change vs-code debugging setting **.vscode/launch.json**, find **console** parameter，change value is **integratedTerminal**‧[^1]

[^1]:[Configurating launch.json for C# debugging](https://github.com/OmniSharp/omnisharp-vscode/blob/master/debugger-launchjson.md#console-terminal-window)

```
"console": "integratedTerminal",
```


Then modify code:

```csharp
static void Main(string[] args)
{
    Console.WriteLine("What's your name?");
    string name = Console.ReadLine();
    string message = "Hello " + name + "!";
    Console.WriteLine(message);
}
```

Launch by F5 again, switch to terminal.

![](/assets/images/2018-01-14-visual-studio-code-with-dotnet-core/006.png)

The First Steps is over, you can try other C# program.

## dotnet restore

You may remember this command if you using .Net Core before.

```bash
dotnet restore
```

Since .Net Core 2.0, dotnet restore implicitly by all commands，example new, build, run, so this command is not require.

[Microsoft Docs - dotnet restore](https://docs.microsoft.com/zh-tw/dotnet/core/tools/dotnet-restore?tabs=netcore2x)

## Reference

[Using .NET Core in Visual Studio Code](https://code.visualstudio.com/docs/other/dotnet)

[Install the C# extension from the VS Code Marketplace](https://microsoft.com/net/core)