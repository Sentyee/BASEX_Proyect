module namespace page = 'http://pepillo.com';

declare
  %rest:POST
  %rest:path('/movie')
  %rest:form-param('movieId','{$movieId}','(nomovieId)')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:form(
    $movieId as xs:string
) as element(html) {
  <html>
    <head>
      <title>Delete Movie Form</title>
    </head>
    <body>
    <div class="container">
        <h1>Delete Movie</h1>
        <form action="/movie/delete" method="DELETE">
        {
            for $movie in doc("movies")//movie
            where $movie/id/text() = $movieId
            return
            <div>
            <div class="form-group">
                   <label for="name">Name:</label>
                   <input type="text" value="{$movie/name/text()}" id="name" class="form-control"/>
            </div>
            </div>
        }
            <input type="hide" value="{$movieId}" name="movieId"/>
            <button type="submit">Delete</button>
        </form>
        </div>
    </body>
  </html>
};


declare
  %rest:DELETE
  %rest:path('/movie/delete')
  %rest:form-param('movieId','{$movieId}','(nomovieId)')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
updating function page:delete(
    $movieId as xs:string
) {
    for $movie in doc("movies")//movie
    where $movie/id/text() = $movieId
    return delete node $movie
};
