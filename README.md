# PC Setup Launcher

A single `index.html` page that displays the exact CMD command from the [toolkit README](https://github.com/iantolentino/Python-System-Utility-Toolkit/blob/main/README.md). Deploy the page to Vercel, open it, and click **Copy CMD command**. The HTML includes its styles and clipboard behavior; it requires no other website files.

## Deploy to Vercel

1. In Vercel, choose **Add New > Project** and import `iantolentino/pc-setup-launcher`.
2. Choose **Other** as the framework preset and leave the root directory at the repository root. Leave install/build commands empty. This is a static HTML page.
3. Deploy the project, then open its generated URL.
4. Click **Copy CMD command** and use it on the new Windows PC.

You can also deploy just `index.html` or attach a custom domain later. The command always downloads the bootstrap directly from your toolkit repository on GitHub.

## Copy and paste from the README

Open **Command Prompt as Administrator**, paste the command, and press Enter:

```cmd
curl.exe --fail --location --retry 2 -o "%TEMP%\bootstrap.bat" https://raw.githubusercontent.com/iantolentino/Python-System-Utility-Toolkit/main/bootstrap.bat && call "%TEMP%\bootstrap.bat"
```

The command downloads and runs the toolkit's `bootstrap.bat`. The bootstrap checks Windows Time, installs Microsoft App Installer/WinGet, Git, and Python if needed, then automatically opens the maximized Python application. The application itself has no third-party Python dependencies.

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

## Maintenance

Keep the command inside the `index.html` textarea identical to the quick-start CMD command in the toolkit README. Push page changes and let Vercel redeploy. Toolkit updates on `main` are picked up by the bootstrap without changing this page.

The full [toolkit README](https://github.com/iantolentino/Python-System-Utility-Toolkit/blob/main/README.md) documents app sources, cache locations, prerequisites, testing, and rebuilding the optional executable.
