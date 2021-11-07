<?php
require_once('../config.php');
// if(isset($_GET['id']) && $_GET['id'] > 0){
//     $qry = $conn->query("SELECT * from `appointments` where id = '{$_GET['id']}' ");
//     if($qry->num_rows > 0){
//         foreach($qry->fetch_assoc() as $k => $v){
//             $$k=$v;
//         }
//     }
//     $qry2 = $conn->query("SELECT * FROM `patient_meta` where patient_id = '{$patient_id}' ");
//     foreach($qry2->fetch_all(MYSQLI_ASSOC) as $row){
//         $patient[$row['meta_field']] = $row['meta_value'];
//     }
// }
?>
<style>
    #uni_modal .modal-content>.modal-footer {
        display: none;
    }

    #uni_modal .modal-body {
        padding-top: 0 !important;
    }
</style>
<div class="container-fluid">
    <form id="appointment_form" class="py-2">
        <h1 class="text-light">Book Service</h1>
        <div class="row" id="appointment">
            <div class="col-6" id="frm-field">
                <!-- <input type="hidden" name="id" value="<?php //echo isset($id) ? $id : '' 
                                                            ?>">
                <input type="hidden" name="patient_id" value="<?php //echo isset($patient_id) ? $patient_id : '' 
                                                                ?>"> -->
                <div class="form-group">
                    <label for="veh_model" class="control-label">Vehicle model</label>
                    <input type="text" class="form-control" name="veh_model" value="<?php echo isset($patient['name']) ? $patient['name'] : '' ?>" required>
                </div>
                <div class="form-group">
                    <label for="veh_category" class="control-label">Vehicle category</label>
                    <select type="text" class="custom-select" name="veh_category" required>
                        <option disabled selected>Select category</option>
                        <option value="2" <?php echo isset($patient['veh_category']) && $patient['veh_category'] == "2" ? "selected" : "" ?>>Two wheeler</option>
                        <option value="4" <?php echo isset($patient['veh_category']) && $patient['veh_category'] == "4" ? "selected" : "" ?>>Four wheeler</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="veh_reg_no" class="control-label">Vehicle Registration number</label>
                    <input type="text" class="form-control" name="veh_reg_no" value="<?php echo isset($patient['veh_reg_no']) ? $patient['veh_reg_no'] : '' ?>" required>
                </div>
                <div class="form-group">
                    <label for="contact" class="control-label">Contact</label>
                    <input type="text" class="form-control" name="contact" value="<?php echo isset($patient['contact']) ? $patient['contact'] : '' ?>" required>
                </div>
                <div class="form-group">
                    <label for="date_sched" class="control-label">Date</label>
                    <input type="datetime-local" class="form-control" name="date_sched" value="<?php echo isset($date_sched) ? date("Y-m-d\TH:i", strtotime($date_sched)) : "" ?>" required>
                </div>
            </div>
            <div class="form-group d-flex justify-content-end w-100 form-group">
                <button class="btn-primary btn">Submit Appointment</button>
                <button class="btn-light btn ml-2" type="button" data-dismiss="modal">Cancel</button>
            </div>
    </form>
</div>
</div>
<script>
    $(function() {
        $('#appointment_form').submit(function(e) {
            e.preventDefault();
            var _this = $(this)
            $('.err-msg').remove();
            start_loader();
            $.ajax({
                url: _base_url_ + "classes/Master.php?f=save_appointment",
                data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                dataType: 'json',
                error: err => {
                    console.log(err)
                    alert_toast("An error occured", 'error');
                    end_loader();
                },
                success: function(resp) {
                    if (typeof resp == 'object' && resp.status == 'success') {
                        location.reload()
                    } else if (resp.status == 'failed' && !!resp.msg) {
                        var el = $('<div>')
                        el.addClass("alert alert-danger err-msg").text(resp.msg)
                        _this.prepend(el)
                        el.show('slow')
                        $("html, body").animate({
                            scrollTop: $('#uni_modal').offset().top
                        }, "fast");
                    } else {
                        alert_toast("An error occured", 'error');
                        console.log(resp)
                    }
                    end_loader();
                }
            })
        })
        $('#uni_modal').on('hidden.bs.modal', function(e) {
            if ($('#appointment_form').length <= 0)
                location.reload()
        })
    })
</script>