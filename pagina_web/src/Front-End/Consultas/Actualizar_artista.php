<?php

?>





<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="login_style.css">
    <script>
      var permit = <?php echo json_encode($permission); ?>;
      var x = document.getElementById("button_log")

      function visitPage(){
        if(permit == true){
          x.type = "button";
          window.location.href='https://www.google.com/?hl=es';
        } else {
          document.getElementById("button_log").type = "submit";
        }
      }
    </script>
</head>
<body>
    <form autocomplete='off' class='form' action="Login_page.php" method="post">
        <div class='control'>
          <h1>
            Sign In
          </h1>
        </div>
        <div class='control block-cube block-input'>
          <input name='username' placeholder='Username' type='text'>
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
        <div class='control block-cube block-input'>
          <input name='password' placeholder='Password' type='password'>
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
        <button class='btn block-cube block-cube-hover' id="button_log" onclick="visitPage()">
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
            Log In
          </div>
        </button>
        <br>
        <div class='center'>
          <?php echo $message_c ?>
        </div>   
      </form>
</body>
</html>