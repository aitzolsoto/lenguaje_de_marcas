<?php

  echo "Nombre y Apellido:";
  echo "<br>";
if(isset($_GET["nombre"]))
   echo $_GET["nombre"];

   echo " ";
if(isset($_GET["apellido"]))
echo $_GET["apellido"];

 echo "<br>";
 echo "<br>";
 echo "Sexo:";
 echo "<br>";
/*Select */
 if(isset($_GET["sexo"]))
echo $_GET["sexo"];

echo "<br>";
 echo "<br>";
 echo "Nivel de estudios:";
 echo "<br>";
 /*RadioButton */
 if(isset($_GET["estudios"]))
 echo $_GET["estudios"];
 
  
 echo "<br>";
 echo "<br>";
 echo "Vehiculo:";
 echo "<br>";
  /*CheckBox */

    if(isset( $_GET["coche"]))
    echo $_GET["coche"];
    

    if(isset( $_GET["Moto"]))
    echo $_GET["Moto"];

    echo "<br>";
    echo "<br>";
    echo "Descripción:";
    echo "<br>";
   
    /*TextArea */
    if(isset( $_GET["descripcion"]))
    echo $_GET["descripcion"];