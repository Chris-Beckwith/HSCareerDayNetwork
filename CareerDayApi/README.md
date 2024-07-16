Run API
-------
dotnet watch run

Run Frontend
------------
npm run dev


API
---
Entity Framework
    Create Migration: > dotnet ef migrations add [name] -o Data/Migrations
    Update Database: > dotnet ef database update
//Secret Storage: dotnet user-secrets init


Frontend
--------
Node.js
Typescript + SWC



VSCode Extensions
-----------------
.NET Install Tool
.NET Watch Attach
Auto Rename Tag
C#
C# Dev Kit
C# Extensions
Dev Containers
Docker
ESLint
GitHub Actions
Material Icon Theme (Just for file/folder icons)
NuGet Gallery
PostgreSQL (for production) // Do I want to switch this?
SQLite (for development)


NuGet Gallery
-------------
Microsoft.EntityFrameworkCore.Sqlite
Microsoft.EntityFrameworkCore.Design
//Npgsql.EntityFrameworkCore.PostgreSQL
Microsoft.AspNetCore.Authentication.JwtBearer


Commands to create project
--------------------------
API
---
> dotnet new sln
> dotnet new webapi -o CareerDayApi --use-controllers
> dotnet sln add CareerDayApi
View > Command Palette: >.NET: Generate Assets for Build and Debug
> dotnet tool install --global dotnet-ef --version 8.0.6

Frontend
--------
npm create vite@latest
    React
    TypeScript + SWC
npm install
