# Easy Deps
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Getting Started 🚀

**Easy Deps** Ease the integration of arb localization into your flutter project with list of predefined languages (English, Arabic, Chinese...), the brick automatically adds the required packages to your project.
This brick implement the official flutter-way to localize your app [Full documentation](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization)

**Features**
- Integrate `l10n` folder contains all your arb files.
- Add required packages to your pubspec file
- Add arb configuration

## Usage 👨🏻‍💻👩🏻‍💻

1- Run the following command in your terminal to add localiz to your mason local config
```bash
mason add localiz
```

2- Run the following command in your terminal to generate localiz brick
```bash
mason make localiz
```
Localiz will ask you about the languages you want to include into your project

## Input Variables 

- The langauges you want to add to your flutter project
- The default arb template language

## Output Files 🔥

- `l10n` folder under lib folder, contains all the arb files for each selected language
- `l10n.yaml` under your project folder, this files contains all the configurations of arb localization

## Contributing ⚽

If you want to contribute to this project send me all your PRs and Issues here's the [Github Repo Link](https://github.com/koukibadr/B-Bricks).