# EasyDeps
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Getting Started 🚀

**EasyDeps** This brick offers a seamless way to manage dependencies within your Mason projects. By integrating a dedicated dependency handler module and post-generation script, your brick can automatically install all required dependencies upon integration into a Flutter project. This approach simplifies your workflow by:

- Centralizing Dependencies: Eliminate manual dependency management within your brick. Dependencies reside in a dedicated package.json file, ensuring consistency and reducing redundancy.
- Streamlined Installation: The post-generation script takes care of installing dependencies during brick integration. This eliminates the need for manual configuration in your Flutter project. 
- Organized Project Structure: The dependency handler module resides within the hooks directory, promoting a clean and well-structured project layout.

## Usage 👨🏻‍💻👩🏻‍💻

1- Run the following command in your terminal to add localiz to your mason local config
```bash
mason add easy_deps
```

2- Run the following command in your terminal to generate easy_deps brick
```bash
mason make easy_deps
```
This will integrate the following Files/Directories in your mason brick

| __brick__
    | packages.json
|hooks
    | dependency_handler
        |package_installation_handler.dart
        |package_model.dart
    |post_gen.dart

`packages.json` template
```json
[
  {
    "package": "<package>", //dependency name
    "version": null, //dependency version, if null the latest vereion will be installted
    "dev_dependency": false, //will be installed as dev_dependency or not
    "require_sdk": false //require sdk (eg sdk: flutter) or not
  },
  {
    "package": "<another_package>", //dependency name
    "version": "11.1.22", //dependency version, if null the latest vereion will be installted
    "dev_dependency": false, //will be installed as dev_dependency or not
    "require_sdk": true //require sdk (eg sdk: flutter) or not
  },
]
```
## Contributing ⚽

If you want to contribute to this project send me all your PRs and Issues here's the [Github Repo Link](https://github.com/koukibadr/mason-bricks).