<?php
class Connections
{

    function test_connections()
    {
        /*Inicio das conexões*/

        echo "Testing Connections...<br>";

        $origin = mysqli_connect("localhost", "root", "teste123", "g1_origem");
        if (!$origin) {
            die('Not connected: ' . mysql_error());
        } else {
            echo "Connection Sucessful<br>";
        }


        $connect = mysqli_connect("localhost", "root", "teste123", "g1_destino");
        if (!$connect) {
            die('Not connected : ' . mysql_error());
        } else {
            echo "Connection Sucessful<br>";
        }

        echo "Connection is Good!<br>";

        mysqli_close($origin);
        mysqli_close($connect);
    }
}
?> 


<?php
class MainFunction
{

    function migracao()
    {

        echo "Attempting Migration...<br>";

        $origin = mysqli_connect("localhost", "root", "teste123", "g1_origem");
        if (!$origin) {
            die('Not connected : ' . mysql_error());
        } else {
            echo "Connection Sucessful<br>";
        }

        $connect = mysqli_connect("localhost", "root", "teste123", "g1_destino");
        if (!$connect) {
            die('Not connected : ' . mysql_error());
        } else {
            echo "Connection Sucessful<br>";
        }


        $query = "INSERT INTO log_medicao_temperatura SELECT *
       FROM g1_origem.log_medicao_temperatura WHERE id NOT IN (SELECT id FROM g1_destino.log_medicao_temperatura)";
        mysqli_query($connect, $query);

        $query = "INSERT INTO log_medicao_humidade SELECT *
       FROM g1_origem.log_medicao_humidade WHERE id NOT IN (SELECT id FROM g1_destino.log_medicao_humidade)";
        mysqli_query($connect, $query);

        $query = "INSERT INTO log_medicao_luminosidade SELECT *
       FROM g1_origem.log_medicao_luminosidade WHERE id NOT IN (SELECT id FROM g1_destino.log_medicao_luminosidade)";
        mysqli_query($connect, $query);

        $query = "INSERT INTO log_medicao_movimento SELECT *
       FROM g1_origem.log_medicao_movimento WHERE id NOT IN (SELECT id FROM g1_destino.log_medicao_movimento)";
        mysqli_query($connect, $query);

        $query = "INSERT INTO log_alerta SELECT *
       FROM g1_origem.log_alerta WHERE id NOT IN (SELECT id FROM g1_destino.log_alerta)";
        mysqli_query($connect, $query);

        $query = "INSERT INTO log_utilizador SELECT *
       FROM g1_origem.log_utilizador WHERE id NOT IN (SELECT id FROM g1_destino.log_utilizador)";
        mysqli_query($connect, $query);

        $query = "INSERT INTO log_ronda SELECT *
       FROM g1_origem.log_ronda WHERE id NOT IN (SELECT id FROM g1_destino.log_ronda)";
        mysqli_query($connect, $query);

        $query = "INSERT INTO log_ronda_extra SELECT *
       FROM g1_origem.log_ronda_extra WHERE id NOT IN (SELECT id FROM g1_destino.log_ronda_extra)";
        mysqli_query($connect, $query);

        $query = "INSERT INTO log_sistema SELECT *
       FROM g1_origem.log_sistema WHERE id NOT IN (SELECT id FROM g1_destino.log_sistema)";
        mysqli_query($connect, $query);


        echo "Migration Successfull!<br>";
    }
}
?>   

<?php

echo "Super-Duper Migration Machine 9000<br><br><br><br>";

//Test Connections
$c = new Connections();
$c->test_connections();


//Migration of Data
$m = new MainFunction();
$m->migracao();

?>