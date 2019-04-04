<?php
$dir = dirname(__FILE__);
echo "<p>Full path to this dir: " . $dir . "</p>";
echo "<p>Full path to a .htpasswd file in this dir: " . $dir . "/.htpasswd" . "</p>";
?>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css.css" type="text/css">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> 
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
        <script> 
        $(function(){
            $("#header").load("Header.html"); 
        });
        </script>
        <script> 
        $(function(){
            $("#izbornik").load("Izbornik-registrirani.html"); 
        });
        </script>
    </head>
    <body>
        <div id="header"></div>
        <div id="izbornik"></div>
        <div id="moderatorIzbornik" style="vertical-align: top">
        </div>
        <div class="content" style="height: 700px">
            <h1>Dobrodošli</h1>
            <div class="text">
                <p>Izaberite bilo koju od mogučnosti koje su Vam omogućene!</p>
            </div>
        </div>
    </body>
</html>
