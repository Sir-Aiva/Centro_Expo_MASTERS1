<?php
class MainFunction
{

    function check()
    {

        echo "Attempting Checking...<br>";

        $origin = mysqli_connect("localhost", "root", "teste123", "g1_origem");
        if (!$origin) {
            die('Not connected : ' . mysql_error());
        } else {
            echo "Connection Sucessful to - g1_origem -<br>";
        }

        $connect = mysqli_connect("localhost", "root", "teste123", "g1_destino");
        if (!$connect) {
            die('Not connected : ' . mysql_error());
        } else {
            echo "Connection Sucessful to - g1_destino -<br>";
        }

        

        $query = "SELECT * FROM g1_origem.log_medicao_temperatura WHERE id NOT IN (SELECT id FROM g1_destino.log_medicao_temperatura)";
        $result = mysqli_query($connect, $query);
        if (mysqli_num_rows($result) == 0) {
            echo "Não houve erros!<br>";
        } else {
            echo "Houve um erro na Migração! A migrar dados em falta da tabela log_medicao_temperatura... <br>";
            $query2 = "INSERT INTO log_medicao_temperatura SELECT * FROM g1_origem.log_medicao_temperatura WHERE id NOT IN (SELECT id FROM g1_destino.log_medicao_temperatura)";
            mysqli_query($connect, $query2);
        }

        $query = "SELECT * FROM g1_origem.log_medicao_humidade WHERE id NOT IN (SELECT id FROM g1_destino.log_medicao_humidade)";
        $result = mysqli_query($connect, $query);
        if (mysqli_num_rows($result) == 0) {
            echo "Não houve erros!<br>";
        } else {
            echo "Houve um erro na Migração! A migrar dados em falta da tabela log_medicao_humidade... <br>";
            $query2 = "INSERT INTO log_medicao_humidade SELECT * FROM g1_origem.log_medicao_humidade WHERE id NOT IN (SELECT id FROM g1_destino.log_medicao_humidade)";
            mysqli_query($connect, $query2);
        }


        $query = "SELECT * FROM g1_origem.log_medicao_luminosidade WHERE id NOT IN (SELECT id FROM g1_destino.log_medicao_luminosidade)";
        $result = mysqli_query($connect, $query);
        if (mysqli_num_rows($result) == 0) {
            echo "Não houve erros!<br>";
        } else {
            echo "Houve um erro na Migração! A migrar dados em falta da tabela log_medicao_luminosidade... <br>";
            $query2 = "INSERT INTO log_medicao_luminosidade SELECT * FROM g1_origem.log_medicao_luminosidade WHERE id NOT IN (SELECT id FROM g1_destino.log_medicao_luminosidade)";
            mysqli_query($connect, $query2);
        }


        $query = "SELECT * FROM g1_origem.log_medicao_movimento WHERE id NOT IN (SELECT id FROM g1_destino.log_medicao_movimento)";
        $result = mysqli_query($connect, $query);
        if (mysqli_num_rows($result) == 0) {
            echo "Não houve erros!<br>";
        } else {
            echo "Houve um erro na Migração! A migrar dados em falta da tabela log_medicao_movimento... <br>";
            $query2 = "INSERT INTO log_medicao_movimento SELECT * FROM g1_origem.log_medicao_movimento WHERE id NOT IN (SELECT id FROM g1_destino.log_medicao_movimento)";
            mysqli_query($connect, $query2);
        }


        $query = "SELECT * FROM g1_origem.log_alerta WHERE id NOT IN (SELECT id FROM g1_destino.log_alerta)";
        $result = mysqli_query($connect, $query);
        if (mysqli_num_rows($result) == 0) {
            echo "Não houve erros!<br>";
        } else {
            echo "Houve um erro na Migração! A migrar dados em falta da tabela log_alerta... <br>";
            $query2 = "INSERT INTO log_alerta SELECT * FROM g1_origem.log_alerta WHERE id NOT IN (SELECT id FROM g1_destino.log_alerta)";
            mysqli_query($connect, $query2);
        }


        $query = "SELECT * FROM g1_origem.log_utilizador WHERE id NOT IN (SELECT id FROM g1_destino.log_utilizador)";
        $result = mysqli_query($connect, $query);
        if (mysqli_num_rows($result) == 0) {
            echo "Não houve erros!<br>";
        } else {
            echo "Houve um erro na Migração! A migrar dados em falta da tabela log_utilizador... <br>";
            $query2 = "INSERT INTO log_utilizador SELECT * FROM g1_origem.log_utilizador WHERE id NOT IN (SELECT id FROM g1_destino.log_utilizador)";
            mysqli_query($connect, $query2);
        }


        $query = "SELECT * FROM g1_origem.log_ronda WHERE id NOT IN (SELECT id FROM g1_destino.log_ronda)";
        $result = mysqli_query($connect, $query);
        if (mysqli_num_rows($result) == 0) {
            echo "Não houve erros!<br>";
        } else {
            echo "Houve um erro na Migração! A migrar dados em falta da tabela log_ronda... <br>";
            $query2 = "INSERT INTO log_ronda SELECT * FROM g1_origem.log_ronda WHERE id NOT IN (SELECT id FROM g1_destino.log_ronda)";
            mysqli_query($connect, $query2);
        }


        $query = "SELECT * FROM g1_origem.log_ronda_extra WHERE id NOT IN (SELECT id FROM g1_destino.log_ronda_extra)";
        $result = mysqli_query($connect, $query);
        if (mysqli_num_rows($result) == 0) {
            echo "Não houve erros!<br>";
        } else {
            echo "Houve um erro na Migração! A migrar dados em falta da tabela log_ronda_extra... <br>";
            $query2 = "INSERT INTO log_ronda_extra SELECT * FROM g1_origem.log_ronda_extra WHERE id NOT IN (SELECT id FROM g1_destino.log_ronda_extra)";
            mysqli_query($connect, $query2);
        }


        $query = "SELECT * FROM g1_origem.log_sistema WHERE id NOT IN (SELECT id FROM g1_destino.log_sistema)";
        $result = mysqli_query($connect, $query);
        if (mysqli_num_rows($result) == 0) {
            echo "Não houve erros!<br>";
        } else {
            echo "Houve um erro na Migração! A migrar dados em falta da tabela log_sistema... <br>";
            $query2 = "INSERT INTO log_sistema SELECT * FROM g1_origem.log_sistema WHERE id NOT IN (SELECT id FROM g1_destino.log_sistema)";
            mysqli_query($connect, $query2);
        }
        echo "Error Checking Successfull!<br>";
    }
}
?>   

<?php

echo "Super-Duper Checking Machine 9000<br><br><br>";

//Check
$m = new MainFunction();
$m->check();

?>