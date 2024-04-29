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
            $date        = date('Y-m-d');
            $y           = date('Y') + 543;
            $newweek     = date('Y-m-d', strtotime($date . ' -2 week')); //ย้อนหลัง 2 สัปดาห์
            $newDate     = date('Y-m-d', strtotime($date . ' -1 months')); //ย้อนหลัง 1 เดือน
            $newyear     = date('Y-m-d', strtotime($date . ' -1 year')); //ย้อนหลัง 1 ปี 

            // $article_num = $_GET['article_num'];

            $result = mysqli_query($conn,"SELECT * FROM cctv_check WHERE cctv_check_date BETWEEN '$newweek' AND '$date' ORDER BY cctv_check_date DESC
            ");

// GROUP BY article_num
            // $result = mysqli_query($conn,"SELECT a.article_id,c.article_num, a.article_name,a.article_price ,a.article_year,a.article_status_id,a.article_img,a.article_img_name,a.store_id,a.cctv,a.cctv_location\n"
            //          . ",a.cctv_location_detail,a.cctv_type,a.cctv_code,a.cctv_monitor,a.cctv_status\n"
            //         . "FROM cctv_check c LEFT JOIN  article_data a ON a.article_num = c.article_num WHERE c.cctv_check_date BETWEEN '$newweek' AND '$date' GROUP BY c.article_num
            // ");

            // $result = mysqli_query($conn,"SELECT article_id,article_num, article_name,article_price ,article_year,article_recieve_date,article_typeid,article_typename\n"
            //         . ",article_categoryid,article_categoryname,article_groupid,article_groupname,article_status_id,article_img,article_img_name,store_id,cctv,cctv_location\n"
            //         . ",cctv_location_detail,cctv_type,cctv_code,cctv_monitor,cctv_status\n"
            //         . "FROM article_data WHERE cctv ='Y' AND article_num = '$article_num'
            // ");
            // SELECT * FROM cctv_check
          
            // $data = $result->mysqli_fetch_assoc();
            // echo json_encode($data);
            
            if ($result) {
                while($row=mysqli_fetch_assoc($result)){
                    $output[]=$row;
                }
                echo json_encode($output);
            }
            
        } else echo "Wellcome";
    }

		
    

