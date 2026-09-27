<html>
    <body>
        <h1>my first PHP page</h1>

        <?php
            function test() {
                static $x = 0;
                echo $x . "<br>";
                $x++;
            }
            test(); // 0
            test(); // 1
            test(); 
        ?>
    </body>
</html>