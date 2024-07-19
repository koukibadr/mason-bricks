class {{class_name.pascalCase()}} {
  
  {{#attributes}}final {{{type}}} {{name.camelCase()}};
  {{/attributes}}

  const {{class_name.pascalCase()}}({
      {{#attributes}}required this.{{name.camelCase()}},
      {{/attributes}}});

}