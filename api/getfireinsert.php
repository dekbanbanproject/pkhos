<?php
    include('config.php');
        
    header("Access-Control-Allow-Origin: *");
    // $conn = mysqli_connect('27.254.191.157', 'gotowin', 'Fdm^;bog-91','gtw'); 

    if (!$conn) {
        echo "Error: Unable to connect to MySQL." . PHP_EOL;
        echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
        echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;		
        exit;
    }
    if (!$conn->set_charset("utf8")) {
        printf("Error loading character set utf8: %s\n", $conn->error);
        exit();
    }
    if(isset($_GET)){
        if ($_GET['isAdd'] == 'true') {
            $date = date('Y-m-d');
            $fire_num                     = $_GET['fire_num'];
            $user_id                      = $_GET['user_id'];
            $fire_check_injection         = $_GET['fire_check_injection'];
            $fire_check_joystick          = $_GET['fire_check_joystick'];
            $fire_check_body              = $_GET['fire_check_body'];
            $fire_check_gauge             = $_GET['fire_check_gauge'];
            $fire_check_drawback          = $_GET['fire_check_drawback'];

            $datacount_ = mysqli_query($conn,"SELECT * FROM fire_check WHERE check_date = '$date' AND fire_num = '$fire_num'");
            $datacount = mysqli_num_rows($datacount_);
 
            if ($datacount > 0) {
                echo "false";
            } else {

                //Qury article_data
                $sql2 = "SELECT fire_id,fire_name,fire_location,fire_color FROM fire WHERE fire_num = '$fire_num'";
                $result2 = mysqli_query($conn, $sql2);
                while($row = mysqli_fetch_array($result2,MYSQLI_ASSOC))
                {
                    //  $fire_id        = $row["fire_id"];
                    $fire_name       = $row->fire_name;
                    $fire_location   = $row->fire_location; 
                    $fire_color      = $row->fire_color; 
                }

                // $row = DB::table('fire')->where('fire_num', '=', $fire_num)->first(); 
                // $fire_name       = $row->fire_name;
                // $fire_location   = $row->fire_location; 
                // $fire_color      = $row->fire_color;
                // $fire_name       = 'ถังดับเพลิง (RED)';
                // $fire_location   = 'คลังเก็บถังดับเพลิง'; 
                // $fire_color      = 'red'; 
                // $post = array();
                // while($row = mysqli_fetch_array($resline2))
                // {
                //     $posts[] = $row;
                //     // $fire_name        = $row["fire_name"];
                //     // $fire_location    = $row["fire_location"]; 
                //     // $fire_color       = $row["fire_color"];   
                // }
                // while($row = mysqli_fetch_array($result2,MYSQLI_ASSOC))
                // {
                //     $fire_name       = $row['fire_name'];
                //     $fire_location   = $row['fire_location']; 
                //     $fire_color      = $row['fire_color']; 
                // }
                // foreach ($result2 as $key => $value) {
                    // $fire_name       = $value['fire_name'];
                    // $fire_location   = $value['fire_location']; 
                    // $fire_color      = $value['fire_color']; 
                // }
            //     $sql2 = $conn->query("SELECT fire_name,fire_location,fire_color FROM fire WHERE fire_num = '$fire_num'");
            //     $product_count = mysqli_num_rows ($sql2);
            //     if ($product_count > 0) {
            //           while($row = $sql->fetch_assoc()) {
            //               $id = $row['fire_id'];
            //               $fire_name       = 'ถังดับเพลิง (RED)';
            //               $fire_location   = 'คลังเก็บถังดับเพลิง'; 
            //               $fire_color      = 'red'; 
              
            //       }
            //   } else {
            //       $product_list = "You have no products listed in your store yet";
            //   }

                   

                $sql = "INSERT INTO `fire_check` (`fire_check_id`,`check_date`,`fire_num`,`user_id`,`fire_check_injection`,`fire_check_joystick`,`fire_check_body`,`fire_check_gauge`,`fire_check_drawback`,`fire_name`,`fire_check_location`,`fire_check_color`) 
                VALUES(Null,'$date','$fire_num','$user_id','$fire_check_injection','$fire_check_joystick','$fire_check_body','$fire_check_gauge','$fire_check_drawback','$fire_name','$fire_location','$fire_color')";
                $result = mysqli_query($conn, $sql) or die ("Error : $sql" .mysqli_error());
                
                if ($result) {
                    echo "true";
                }else{
                    echo "false";
                }
            }
            
           
            // $sql = "INSERT INTO `cctv_check` (`cctv_check_id`,`cctv_check_date`,`article_num`,`cctv_user_id`,`cctv_camera_screen`,`cctv_camera_corner`,`cctv_camera_drawback`,`cctv_camera_save`,`cctv_camera_power_backup`) 
            // VALUES(Null,'$date','$article_num','$cctv_user_id','$cctv_camera_screen','$cctv_camera_corner','$cctv_camera_drawback','$cctv_camera_save','$cctv_camera_power_backup')";
            // $result = mysqli_query($conn, $sql) or die ("Error : $sql" .mysqli_error());
            
            // if ($result) {
            //     echo "true";
            // }else{
            //     echo "false";
            // }
            
        } else echo "Wellcome";
    }

		
    

