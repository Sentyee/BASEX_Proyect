module namespace page = 'http://pepillo.com';

declare
  %rest:POST
    %rest:path('/movie')
    %rest:form-param('movieId','{movieId}','(nomovieId)')
    %output:method('html')
    %output:doctype-system('about:legacy-compat')
  function page:form(
      $movieId as xs:string
  ) as element(html) {
    <html>
      <head>
        <title>Add Movie Form</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"></link>

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
      </head>
      <body>
      <div class="container">
          <h1>Add Movie</h1>
          <form action="/movies/add" method="POST">
          {
              for $movie in doc("movies")//movie
              where $movie/id/text() = $movieId
              return
              <div>
              <div class="form-group">
                     <label for="movieId">Id:</label>
                     <input type="text" value="{$movie/id/text()}" id="movieId" class="form-control"/>
              </div>
              <div> class="form-group">
                     <label for="name">Name:</label>
                     <input type="text" value="{$movie/name/text()}" id="name" class="form-control"/>
              </div>
              <div> class="form-group">
                     <label for="name">Name:</label>
                     <input type="text" value="{$movie/year/text()}" id="year" class="form-control"/>
              </div>
              <div> class="form-group">
                     <label for="name">Name:</label>
                     <input type="text" value="{$movie/boxOffice/text()}" id="boxOffice" class="form-control"/>
              </div>
              </div>
          }
              <button class="btn btn-success" type="submit">Add</button>
          </form>
          </div>
      </body>
    </html>
};


declare
  %rest:POST
  %rest:path('/movies/add')
  %rest:form-param('movieId','{$movieId}','(nomovieId)')
  %rest:form-param('name','{$name}','(noname)')
  %rest:form-param('year','{$year}','(noyear)')
  %rest:form-param('boxOffice','{$boxOffice}','(noboxOffice)')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
updating function page:add(
    $movieId as xs:string,
    $name as xs:string,
    $year as xs:string,
    $boxOffice as xs:string)
{
  for $movies in doc("movies")/movies
  return
    insert node
        <movie>
            <id>{$movieId}</id>
            <name>{$name}</name>
            <year>{$year}</year>
            <boxOffice>{$boxOffice}</boxOffice>
        </movie>
    as last into $movies
};