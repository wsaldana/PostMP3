<?php
  $id_song = $_POST['delete_song'];
  $data = json_decode(file_get_contents("https://0415813673e8.ngrok.io/songs/$id_song"), true);
  $delete_song = $_DELETE['delete_song'];
    //echo $data['id_user'];


    /* OnClick="location.href= ´../Home/Home.html´"*/ 
?>

<!DOCTYPE html>
<html lang="en">
<head>
  
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="login_style.css">
</head>
<body>
    <form autocomplete='off' class='form' action= '' method="POST">
        <div class='control'>
          <h1>
           Eliminar cancion
          </h1>
        </div>
        <div class='control block-cube block-input'>
          <input name='delete_song' placeholder='delete_song' type='text'>
          <div class='bg-top'>
            <div class='bg-inner'></div>
          </div>
          <div class='bg-right'>
            <div class='bg-inner'></div>
          </div>
          <div class='bg'>
            <div class='bg-inner'></div>
          </div>
        </div>
        <button  class='btn block-cube block-cube-hover' type='submit'>
          <div class='bg-top'>
            <div class='bg-inner'></div>
          </div>
          <div class='bg-right'>
            <div class='bg-inner'></div>
          </div>
          <div class='bg'>
            <div class='bg-inner'></div>
          </div>
          <div class='text'>
            Eliminar
          </div>
          
        </button>
      </form>      
</body>
</html>