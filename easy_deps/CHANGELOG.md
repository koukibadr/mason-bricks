# 0.4.0+1 - 24/06/2024

**Changes**
- Add support for native dart projects
- Add brick paramter "project_type" to define project's sdk (Flutter/Dart)
- `PackageInstaller` is now removed and replaced by a global function to install all the packages

**Enhancement**
- Package installation failure display error log not only when `package.isRequired == true`
- A success message is displayed when the package is installed


# 0.3.0+1 - 12/06/2024

**Changes**
- Add `required` paramter to packages and can be linked to mason prompt attribute directly (see example_pacakges.json)

**Enhancement**
- Add packages.json example to brick generated files
- Update package_model.dart

# 0.2.1+1 - 18/05/2024

- Update brick github repository

# 0.1.1+1 - 18/05/2024

- Update brick github repository

# 0.1.0+1 - 12/05/2024

- Implement packages installation handler
- Integrate packages.json file
- Integrate post_gen script dart code 