module namespace page = 'http://pepillo.com';

declare
  %rest:POST
  %rest:path('/movies')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:home(
) as element(html) {
  <html>
    <head>
      <title>prueba</title>
    </head>
    <body>
        <p>Phone List</p>
        <div>
        <ul>
        {
            for $phone in doc("phones")//phone
            return <li>{$phone/brand/text()} {$phone/model/text()}</li>
        }
        </ul>
        </div>
        <div>
        <form action="/phone" method="POST">
            <input type="text" name = "phoneid"/>
            <button type="submit">Consult</button>
        </form>
        </div>
    </body>
  </html>
};


declare
  %rest:POST
  %rest:path('/movie')
  %rest:form-param('phoneid','{$phoneid}','(nophoneid)')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:form(
    $phoneid as xs:string
) as element(html) {
  <html>
    <head>
      <title>Phone details</title>
    </head>
    <body>
    <div class="container">
        <p>Phone Details</p>
        <form action="/phone/delete" method="DELETE">
        {
            for $phone in doc("phones")//phone
            where $phone/phoneid/text() = $phoneid
            return
            <div>
            <div class="form-group">
                   <label for="brand">Email Address:</label>
                   <input type="text" value="{$phone/brand/text()}" id="brand" class="form-control"/>
            </div>
            <div> class="form-group">
                   <label for="model">Model:</label>
                   <input type="text" value="{$phone/model/text()}" id="model" class="form-control"/>
            </div>
            </div>
        }
            <input type="hide" value="{$phoneid}" name="phoneid"/>
            <button type="submit">Delete</button>
        </form>
        </div>
    </body>
  </html>
};


declare
  %rest:DELETE
  %rest:path('/movie/delete')
  %rest:form-param('phoneid','{$phoneid}','(nophoneid)')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
updating function page:delete(
    $phoneid as xs:string
) {
    for $phone in doc("phones")//phone
    where $phone/phoneid/text() = $phoneid
    return delete node $phone
};
