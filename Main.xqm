module namespace page = 'http://pepillo.com';

declare
  %rest:POST
  %rest:path('/movieDetails')
  %output:method('html')
  %rest:form-param('movieId','{$movieId}','(nomovieId)')
  %output:doctype-system('about:legacy-compat')
function page:movieInfo(
    $movieId as xs:string
) as element(html) {
  <html>
    <head>
      <title>prueba</title>
       <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"></link>

      <!-- jQuery library -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

      <!-- Popper JS -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

      <!-- Latest compiled JavaScript -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </head>
    <body>
      <h1>Movie Details</h1>
      {
        for $movie in doc("movies")//movie
        where $movie/id/text() = $movieId
        return
        <table class="table">
          <thead class="thead-dark">
            <tr>
              <th>Name</th>
              <th>Year</th>
              <th>Box Office</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>{$movie/name/text()}</td>
              <td>{$movie/year/text()}</td>
              <td>{$movie/boxOffice/text()}</td>
            </tr>
          </tbody>
        </table>
      }
    </body>
  </html>
};

declare
  %rest:GET
  %rest:path('/allMovies')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:allMovies(
) as element(html) {
  <html>
    <head>
      <title>allMovies</title>
       <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"></link>

      <!-- jQuery library -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

      <!-- Popper JS -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

      <!-- Latest compiled JavaScript -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </head>
    <body>
      <h1>Movies</h1>
      <table class="table">
                        <thead class="thead-dark">
                          <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Year</th>
                            <th>Box Office</th>
                          </tr>
                        </thead>
      {
        for $movie in doc("movies")//movie
        return

                  <tbody>
                    <tr>
                      <td>{$movie/id/text()}</td>
                      <td>{$movie/name/text()}</td>
                      <td>{$movie/year/text()}</td>
                      <td>{$movie/boxOffice/text()}</td>
                    </tr>
                  </tbody>

      }
      </table>
    </body>
  </html>
};

declare
  %rest:GET
  %rest:path('/findMovie')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:findMovie(
) as element(html) {
  <html>
    <head>
      <title>prueba</title>
       <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"></link>

      <!-- jQuery library -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

      <!-- Popper JS -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

      <!-- Latest compiled JavaScript -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </head>
    <body>
      <h1>Find a Movie</h1>
      <form action = "/movieDetails" method="POST">
        <input type="text" name="movieId"/>
        <button class="btn btn-primary" type = "submit">Find Movie</button>
      </form>
    </body>
  </html>
};