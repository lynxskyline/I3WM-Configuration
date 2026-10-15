<html>
    <body>
        <h1>my first PHP page</h1>

        <?php 
            function myTest() {
                $x = 5;
                echo "variable x inside function is : $x<br>";
            }
            myTest();
            echo"Variable x outside function is : $x";
        ?>
    </body>
</html>