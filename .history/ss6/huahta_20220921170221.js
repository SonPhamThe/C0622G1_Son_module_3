 public static int[] newarray(int[][] arr) {
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