 <!DOCTYPE html>
 <html lang="en">
 <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
 </head>
 <body>
    
 </body>
 <script>  </script>
 </html>
    function kiemTra(index) {
        if (index < 2) {
            return false;
        } else {
            for (let i = 2; i < index; i++) {
                if (index % i === 0) {
                    return false;
                }
            }
            return true;
        }
    }