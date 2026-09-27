<html>
    <body>
        <h1>my first PHP page</h1>

        <?php
            $x = 5;
            $y = 10;

            function test() {
                global $x, $y;
                $y = $x + $y;
            }
            
            test();
            echo $y . "<br>\n";
        ?>
    </body>
</html>