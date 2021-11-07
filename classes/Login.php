<?php
require_once '../config.php';
class Login extends DBConnection {
	private $settings;
	public function __construct(){
		global $_settings;
		$this->settings = $_settings;

		parent::__construct();
		ini_set('display_error', 1);
	}
	public function __destruct(){
		parent::__destruct();
	}
	public function index(){
		echo "<h1>Access Denied</h1> <a href='".base_url."'>Go Back.</a>";
	}
	public function login(){
		extract($_POST);
		$sql = "SELECT * from users where email = '$email' and password = md5('$password') ";
		$qry = $this->conn->query($sql);
		if($qry->num_rows > 0){
			foreach($qry->fetch_array() as $k => $v){
				if(!is_numeric($k) && $k != 'password'){
					$this->settings->set_userdata($k,$v);
					($k === 'user_type') ? $userType = $v : null;
				}

			}
			$this->settings->set_userdata('login_type',$userType);
		return json_encode(array('status'=>'success', 'userType'=>$userType, 'session' => $_SESSION));
		}else{
		return json_encode(array('status'=>'incorrect','last_qry'=>"SELECT * from users where email = '$username' and password = md5('$password') "));
		}
	}
	public function register() {
		extract($_POST);
		$chk = $this->conn->query("SELECT * FROM `users` where email ='{$email}'")->num_rows;
		if($chk > 0){
			return json_encode(array('status'=>'duplicate'));
		}else{
			if(!empty($name) && !empty($email) && !empty($password)){
				$encrypted_pwd = md5($password);
				$sql = "INSERT INTO users set firstname = '{$name}', lastname = '', email='{$email}', password= '{$encrypted_pwd}'";
				$qry = $this->conn->query($sql);
				if($qry){
					return json_encode(array('status'=>'success'));
				}
				else{
					return json_encode(array('status'=>'failed', 'query' => $sql));
				}
			}
			else {
				return json_encode(array('status'=>'validation failed'));
			}
		}
	}
	public function logout(){
		if($this->settings->sess_des()){
			redirect('admin/login.php');
		}
	}
	function login_user(){
		extract($_POST);
		$qry = $this->conn->query("SELECT * from clients where email = '$email' and password = md5('$password') ");
		if($qry->num_rows > 0){
			foreach($qry->fetch_array() as $k => $v){
				$this->settings->set_userdata($k,$v);
			}
			$this->settings->set_userdata('login_type',1);
		$resp['status'] = 'success';
		}else{
		$resp['status'] = 'incorrect';
		}
		if($this->conn->error){
			$resp['status'] = 'failed';
			$resp['_error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
}
$action = !isset($_GET['f']) ? 'none' : strtolower($_GET['f']);
$auth = new Login();
switch ($action) {
	case 'login':
		echo $auth->login();
		break;
	case 'register':
		echo $auth->register();
		break;
	case 'login_user':
		echo $auth->login_user();
		break;
	case 'logout':
		echo $auth->logout();
		break;
	default:
		echo $auth->index();
		break;
}

