<?php require_once('config.php'); ?>
<!DOCTYPE html>
<html lang="en">
<?php require_once('inc/header.php') ?>

<body>
  <?php if ($_settings->chk_flashdata('success')) : ?>
    <script>
      alert_toast("<?php echo $_settings->flashdata('success') ?>", 'success')
    </script>
  <?php endif; ?>
  <?php require_once('inc/topBarNav.php') ?>
  <?php $page = isset($_GET['p']) ? $_GET['p'] : 'login';  ?>
  <?php
  if (!file_exists($page . ".php") && !is_dir($page)) {
    include '404.html';
  } else {
    if (is_dir($page))
      include $page . '/index.php';
    else
      include $page . '.php';
  }
  ?>
  <div class="modal fade" id="confirm_modal" role='dialog'>
    <script>
      start_loader();
      $(function() {
        end_loader()
      })
    </script>

</body>

</html>