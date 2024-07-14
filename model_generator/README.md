# Model_Generator
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Getting Started 🚀

**Model_Generator** a fast way to convert your json to dart models with all the json parameters, all you need to provide is the json with same name as the class name in the same output directory and watch the magic happens.
Future releases will support json serialization, freezed, null safety and much more.

**Features**
- Convert a json file to a dart class, all fields are set to final (first version).

## Usage 👨🏻‍💻👩🏻‍💻

1- Run the following command in your terminal to add model_generator to your mason local config (add -g flag to add it to glabal mason brick list)
```bash
mason add model_generator
```

2- Run the following command in your terminal to generate model_generator brick
```bash
mason make model_generator
```
Localiz will ask you about the languages you want to include into your project

## Input Variables 

- `class_name` The class name, make sure the json file is located in the same output directory with the same class name.
- `delete_json_file` the second prompt will ask wether to delete or not the json file after generating the dart class.

## Output Files 🔥

- a Dart class contains final attributes extracted from json file.

## Contributing ⚽

If you want to contribute to this project send me all your PRs and Issues here's the [Github Repo Link](https://github.com/koukibadr/mason-bricks).