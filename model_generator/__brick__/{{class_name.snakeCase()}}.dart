
{{#models}}
class {{class.pascalCase()}} {
  
  {{#attributes}}final {{{type}}} {{name.camelCase()}};
  {{/attributes}}

  {{class.pascalCase()}}({
    {{#attributes}}required this.{{name.camelCase()}},
    {{/attributes}}}
  );
}
{{/models}}