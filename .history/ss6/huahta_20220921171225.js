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
 <script> 
 let arr1 = [
    [1,2,8,43],
    [9,4,53,7],
    [11,6,4,0],
    [1,2,6,51]
    ]
    alert(a);
 function a(arr1) {
    let arr = [];
        for (let i = 0; i < arr1.length; i++) {
            for (let j = 0; j < arr1[i].length; j++) {
                 let check = true;
                 if(arr1[i][j] <2 ) {
                    continue;
                 }
                for (let k = 2; k <= arr1[i][j]/2; k++) {
                    if(arr1[i][j] % k == 0) {
                        check = false;
                        break;
                    }
                }
                if(check) {
                    arr.push(arr1[i][j]); 
                }
            }
        }
        return arr;
    </script>
 </html>
