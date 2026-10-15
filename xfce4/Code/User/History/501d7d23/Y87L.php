<html>
    <body>
        <h1>my first PHP page</h1>

        <?php
            function test() {
                static $x = 0;
                echo $x . "<br>\n";
                $x++;
            }
            test();
            test();
            test();
        ?>
    </body>
</html>