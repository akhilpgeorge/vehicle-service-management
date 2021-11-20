<?php
require_once('../../config.php');
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `appointments` where id = '{$_GET['id']}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $appointment[$k]=$v;
        }
    }
    $qry2 = $conn->query("SELECT * FROM `users` where id = '{$appointment['user_id']}' ");
        foreach($qry2->fetch_array() as $k => $v){
            // echo `key: ${k}`;
            // echo `value ${v}`;
            // $user[$k] = $v;
            $user[$k]=$v;
        }
  }
?>
<style>
#uni_modal .modal-content>.modal-footer{
    display:none;
}
#uni_modal .modal-body{
    padding-bottom:0 !important;
}
</style>
<div class="container-fluid">
    <p><b>Appointment Schedule:</b> <?php echo date("F d, Y",strtotime($appointment['date_sched']))  ?></p>
    <p><b>Vehicle Reg No:</b> <?php echo $appointment['veh_reg_no'] ?></p>
    <p><b>Vehicle Model:</b> <?php echo $appointment['veh_model'] ?></p>
    <p><b>Vehicle Category:</b> <?php echo $appointment['veh_category'] == 2 ? "Two wheeler" : "Four wheeler"?></p>
    <p><b>Owner:</b> <?php echo $user['firstname']; echo " "; echo $user['lastname']; ?></p>
    <!-- <p><b>Gender:</b> <?php //echo ucwords($user['gender']) ?></p> -->
    <p><b>Contact #:</b> <?php echo $appointment['contact'] ?></p>
    <p><b>Email #:</b> <?php echo $user['email'] ?></p>
    <!-- <p><b>Address:</b> <?php //echo $user['address'] ?></p> -->
    <p><b>Comments:</b> <?php echo $appointment['comments'] ?></p>
    <p><b>Status:</b>
        <?php 
        switch($appointment['status']){ 
            case(0): 
                echo '<span class="badge badge-primary">Pending</span>';
            break; 
            case(1): 
            echo '<span class="badge badge-success">Confirmed</span>';
            break; 
            case(2): 
                echo '<span class="badge badge-danger">Cancelled</span>';
            break; 
            case(-1): 
                echo '<span class="badge badge-secondary">Deleted</span>';
            break; 
            default: 
                echo '<span class="badge badge-secondary">NA</span>';
        }
        ?>
    </p>
</div>
<div class="modal-footer border-0">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
</div>
