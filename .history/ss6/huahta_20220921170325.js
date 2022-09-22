 function a(array[][]) {
        let str = "";
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr[i].length; j++) {
                boolean check = true;
                for (int k = 2; k < arr[i][j]/2; k++) {
                    if(arr[i][j] % k == 0) {
                        check = false;
                        break;
                    }
                }
                if(check) {
                    str += arr[i][j]; 
                }
            }
        }
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