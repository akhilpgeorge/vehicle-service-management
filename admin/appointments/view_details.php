<?php
require_once('../../config.php');
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `appointments` where id = '{$_GET['id']}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=$v;
        }
    }
    $qry2 = $conn->query("SELECT * FROM `users` where id = '{$user_id}' ");
        foreach($qry2->fetch_array() as $k => $v){
            // echo `key: ${k}`;
            // echo `value ${v}`;
            // $user[$k] = $v;
            $$k=$v;
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
    <p><b>Appointment Schedule:</b> <?php echo date("F d, Y",strtotime($date_sched))  ?></p>
    <p><b>Name:</b> <?php echo $firstname ?></p>
    <!-- <p><b>Gender:</b> <?php //echo ucwords($user['gender']) ?></p> -->
    <p><b>Contact #:</b> <?php echo $contact ?></p>
    <p><b>Email #:</b> <?php echo $email ?></p>
    <!-- <p><b>Address:</b> <?php //echo $user['address'] ?></p> -->
    <p><b>Ailment:</b> <?php echo $comments ?></p>
    <p><b>Status:</b>
        <?php 
        switch($status){ 
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
