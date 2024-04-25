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
            $article_num                  = $_GET['article_num'];
            $cctv_user_id                 = $_GET['cctv_user_id'];
            $cctv_camera_screen           = $_GET['cctv_camera_screen'];
            $cctv_camera_corner           = $_GET['cctv_camera_corner'];
            $cctv_camera_drawback         = $_GET['cctv_camera_drawback'];
            $cctv_camera_save             = $_GET['cctv_camera_save'];
            $cctv_camera_power_backup     = $_GET['cctv_camera_power_backup'];

            $datacount_ = mysqli_query($conn,"SELECT * FROM cctv_check WHERE cctv_check_date = '$date' AND article_num = '$article_num'");
            $datacount = mysqli_num_rows($datacount_);
           
            // while($objet = mysqli_fetch_array($datacount,MYSQLI_ASSOC))
            // {
            //     $checkdata =$objet["total"];    
            // } 
            if ($datacount > 0) {
                echo "false";
            } else {
                $sql = "INSERT INTO `cctv_check` (`cctv_check_id`,`cctv_check_date`,`article_num`,`cctv_user_id`,`cctv_camera_screen`,`cctv_camera_corner`,`cctv_camera_drawback`,`cctv_camera_save`,`cctv_camera_power_backup`) 
                VALUES(Null,'$date','$article_num','$cctv_user_id','$cctv_camera_screen','$cctv_camera_corner','$cctv_camera_drawback','$cctv_camera_save','$cctv_camera_power_backup')";
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

		
    

