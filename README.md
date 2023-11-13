# Ruby coding with RBS and Steep workshop at RubyConf 2023

This is a sample application of the workshop.

## Set up

We have an assumption of using VSCode for this workshop.

You can start the IDE with one of the following three options.

1. Inside local container (recommended)
2. GitHub Codespaces
3. Running locally

Running the app inside local container is the recommended way, but you may want to use GitHub Codespaces to skip downloading large container images.

### Before setting up: fork the repository

I recommend making a fork of this repository into your account.
This makes sharing your code easy.
You can just push your code and copy-and-paste the URL.

### Open the app inside local container

1. Clone your repository into your computer
2. Start VSCode
3. Open `Command Palette` and choose `"Open Folder in Container..."`
4. Wait for a few minutes to complete downloading/building docker image, installing dependencies, and starting up the extensions

### GitHub Codespaces

1. Open your fork repository on browser
2. `Create a codespace on main`
3. Wait for a few minutes to complete downloading/building docker image, installing dependencies, and starting up the extensions
4. Open `Command Palette` and choose `Steep: Restart all`

### Running locally

1. Clone your repository into your computer
2. `$ bin/setup` in the working copy
3. Open the folder using VSCode
4. Ensure the essential extensions are installed: `soutaro.rbs-syntax`, `soutaro.steep-vscode`
5. Open `Command Palette` and choose `Steep: Restart all`

I also recommend installing `Shopify.ruby-lsp` for some Ruby coding features.
