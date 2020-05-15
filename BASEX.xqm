module namespace page = 'http://pepillo.com';

declare
  %rest:POST
  %rest:path('/phones')
  %output:method('html')
  %rest:form-param('phoneid','{$phoneid}','(nophoneid)')
  %output:doctype-system('about:legacy-compat')
function page:phones(
    $phoneid as xs:string
) as element(html) {
  <html>
    <head>
      <title>prueba</title>
    </head>
    <body>
      <p>prueba</p>
      {
        for $phone in doc("phones")//phone
        where $phone/phoneid/text() = $phoneid
        return <p>{$phone/phoneid/text()},{$phone/brand/text()},{$phone/model/text()}</p>
      }
    </body>
  </html>
};

declare
  %rest:POST
  %rest:path('/allphones')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:Allphones(
) as element(html) {
  <html>
    <head>
      <title>prueba</title>
    </head>
    <body>
      <p>prueba</p>
      {
        for $phone in doc("phones")//phone
        return <p>{$phone/phoneid/text()},{$phone/brand/text()},{$phone/model/text()}</p>
      }
    </body>
  </html>
};

declare
  %rest:GET
  %rest:path('/choosephone')
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
      <form action = "/phones" method="POST">
        <input type="text" name="phoneid"/>
        <button type = "submit">Choose</button>
      </form>
    </body>
  </html>
};