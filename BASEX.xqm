module namespace page = 'http://pepillo.com';

declare
  %rest:GET
  %rest:path('/myactors')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:myactors(
) as element(html) {
  <html>
    <head>
      <title>prueba</title>
    </head>
    <body>
      <p>prueba</p>
      {
        for $actor in doc("movies")//actor/name
        return <p>{ $actor/text() }</p>
      }
    </body>
  </html>
};