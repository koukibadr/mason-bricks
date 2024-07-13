class {{class_name.pascalCase()}} {
  
  {{#listOfAttributes}}final {{.}};
  {{/listOfAttributes}}

  {{class_name.pascalCase()}}(
    {{#namesOfAttributes}}{{.}},
    {{/namesOfAttributes}}
  );

}