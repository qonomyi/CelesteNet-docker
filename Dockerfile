# --- Build Stage ---
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /app

COPY CelesteNet/ .
COPY lib-stripped/ ./lib-stripped/
RUN dotnet build -c Release -t:CelesteNet_Shared:Rebuild -t:CelesteNet_Server_ChatModule:Rebuild -t:CelesteNet_Server_FrontendModule:Rebuild -t:CelesteNet_Server_SqliteModule:Rebuild -t:CelesteNet_Server:Rebuild

# -- Runner Stage ---
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build-env /app/CelesteNet.Server/bin/Release/net8.0/ .
COPY --from=build-env /app/CelesteNet.Server.FrontendModule/Content/ ./Content/


COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
