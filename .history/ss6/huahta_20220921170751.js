 let arr1 = [
    [1,2,8,43],
    [9,4,53,7],
    [11,6,4,0],
    [1,2,6,51]
    ]
    
 function a(arr1) {
    let arr = [];
        for (let i = 0; i < arr1.length; i++) {
            for (let j = 0; j < arr1[i].length; j++) {
                 let check = true;
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
    }
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