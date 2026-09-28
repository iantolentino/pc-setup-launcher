# PC Setup Launcher

A small, separate repository for a short workstation setup URL. Deploy this static website to Vercel, open the page, and click **Copy CMD command**. The page generates the command using the actual deployed domain, so there is no hardcoded Vercel hostname to maintain.

## Deploy to Vercel

1. In Vercel, choose **Add New > Project** and import `iantolentino/pc-setup-launcher`.
2. Leave the root directory at the repository root. `vercel.json` already selects **Other**, skips installation/build commands, and serves the repository root as a static site.
3. Deploy the project, then open its generated URL.
4. Click **Copy CMD command** and use it on the new Windows PC.

You can attach a custom domain in Vercel later. The page automatically generates its command with whichever domain you open.

## Copy and paste from the README

Replace `YOUR-PROJECT.vercel.app` with your deployment's domain. Open **Command Prompt as Administrator**, paste the command, and press Enter:

```cmd
curl.exe --fail --location --retry 2 -o "%TEMP%\setup.bat" https://YOUR-PROJECT.vercel.app/setup.bat && call "%TEMP%\setup.bat"
```

The downloaded `setup.bat` checks Windows Time, downloads the toolkit bootstrap with retries, and runs it. The bootstrap installs Microsoft App Installer/WinGet, Git, and Python if needed, then automatically opens the maximized Python application. The application itself has no third-party Python dependencies.

## What IT does in the application

1. Wait for the startup clock check. Its progress and result appear in the output log.
2. Choose **Category 1: Normal Setup** for the general applications, or **Category 2: CNG Setup** for Front desktop and Microsoft Windows App.
3. Click **Install Normal Apps** or **Install CNG Apps**. CNG also has individual application buttons.
4. Read the timestamped log for download, verification, installation, timezone, and restart results.
5. If a task fails, resolve the reported issue and click **Retry Last Task**. Use **Check / Sync Time** for clock problems.

CNG selection applies Sydney's Windows timezone with daylight saving. Clock synchronization is checked separately. Front is the Windows desktop application from [front.com](https://front.com/) and uses its official machine-wide installer. Microsoft Windows App installs for the Windows user running the toolkit. App sign-in, Office activation, and any requested restart are separate steps.

The general release packages are OBS Studio, AnyDesk, TeamLogger, Zoom, Microsoft Teams, WinRAR, Microsoft Office, and RustDesk. Office uses an interactive setup window. Supported Teams is installed through Microsoft's current bootstrapper.

## If something fails

If curl reports a certificate error before the script can run, open **Settings > Time & language > Date & time**, correct the date/time, click **Sync now**, and run the command again. Do not disable HTTPS verification.

For network errors, check internet/proxy access and access to GitHub, Microsoft, and Front downloads. Downloads and prerequisite installation have bounded retries. A failed prerequisite leaves its error visible in CMD; the application shows installation failures in its log. Installation success still needs validation on your workstation configuration.

## Toolkit branch and maintenance

`setup.bat` currently uses `codex/workstation-setup` in [Python-System-Utility-Toolkit](https://github.com/iantolentino/Python-System-Utility-Toolkit). This keeps the launcher usable while the toolkit change is in review. Its branch argument is retained through elevation, cloning/updating, and helper downloads.

After that toolkit branch is merged, change this one line in `setup.bat`:

```bat
set "TOOLKIT_REF=main"
```

Push the change and let Vercel redeploy. No application code or installer binaries are duplicated in this repository. `/setup.bat` is served without caching so clients receive the current launcher.

The full [toolkit README](https://github.com/iantolentino/Python-System-Utility-Toolkit/blob/codex/workstation-setup/README.md) documents app sources, cache locations, prerequisites, testing, and rebuilding the optional executable.
