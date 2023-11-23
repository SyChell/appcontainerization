# Build stage
FROM mcr.microsoft.com/dotnet/sdk:7.0 as build-env  
# Set the working directory of the container to /src
WORKDIR /src
# Copy csproj from the current directory to the working directory of the container and restore dependencies as a distinct layer before copying the rest of the code to leverage Docker cache. this will allow Docker to not have to restore dependencies if the csproj file has not changed.
COPY src/*.csproj . 
RUN dotnet restore
# Copy everything else from the current directory to the wworking directory of the container
COPY src .
RUN dotnet publish -c Release -o /publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:7.0 as runtime
# Set the working directory to /publish
WORKDIR /publish
# Copy the publish folder from the build stage to the runtime stage
COPY --from=build-env /publish .
# Expose port 80 to allow incoming traffic to the application
EXPOSE 80
# Run the application when the container starts
ENTRYPOINT ["dotnet", "myWebApp.dll"]

# This Dockerfile defines a multi-stage build for a .NET Core web application.
# The first stage uses the .NET Core SDK to build the application and publish it to a directory called /publish.
# The second stage uses the .NET Core runtime to run the application from the /publish directory.
# The EXPOSE instruction exposes port 80 to allow incoming traffic to the application.
# The ENTRYPOINT instruction specifies the command to run when the container starts. In this case, it runs the myWebApp.dll file.
