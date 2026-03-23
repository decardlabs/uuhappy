# uuhappy

uuhappy is a cross-platform GUI client (Windows / Linux / macOS) for proxy cores such as Xray and sing-box.

This repository contains the desktop client source code, packaging scripts, and release artifacts.

## Repository Layout

- `uuhappy-client/`: main .NET solution and projects
- `uuhappy-client/uuhappy.Desktop/`: Avalonia desktop client
- `uuhappy-client/uuhappy/`: WPF Windows client
- `uuhappy-client/ServiceLib/`: shared service and core integration logic
- `package-osx.sh`: macOS packaging script
- `package-debian.sh`: Debian/Ubuntu packaging script
- `package-rhel.sh`: RHEL/CentOS packaging script
- `package-release-zip.sh`: release zip packaging script

## Prerequisites

- .NET SDK 8.0+
- Git
- Platform tools for your target package format (`dpkg-deb`, `rpmbuild`, etc.)

## Build

From repository root:

```bash
cd uuhappy-client
dotnet build uuhappy.sln -c Release
```

## Run (Desktop)

```bash
cd uuhappy-client/uuhappy.Desktop
dotnet run -c Debug
```

## Package

From repository root:

```bash
# macOS
./package-osx.sh

# Debian/Ubuntu
./package-debian.sh

# RHEL/CentOS
./package-rhel.sh

# release zip
./package-release-zip.sh
```

Generated outputs are under `artifacts/`.

## Related

- Server project: `https://github.com/decardlabs/uuhappyserver`
- Client repo: `https://github.com/decardlabs/uuhappy`

## License

See `LICENSE`.
