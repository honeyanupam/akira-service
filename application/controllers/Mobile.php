<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
if (isset($_SERVER['HTTP_ORIGIN'])) 
	{
		header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
		header('Access-Control-Allow-Credentials: true');
		header('Access-Control-Max-Age: 86400');    // cache for 1 day
	}

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS')
	{
		if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
			header("Access-Control-Allow-Methods: GET, POST, OPTIONS");         
   		if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
			header("Access-Control-Allow-Headers:{$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
	}

defined('BASEPATH') OR exit('No direct script access allowed');
class Mobile extends MY_Controller 
	{
		public function __construct()
			{
				parent::__construct();
				$this->load->helper(array('form','language','url'));
				$this->load->model('MobileModel');
				$this->load->model('CommonModel');
			}
		
		public function login()
			{
				echo $this->MobileModel->login();
			}
		public function register()
			{
				echo $this->MobileModel->register();
			}
		public function change_password()
			{
				echo $this->MobileModel->change_password();
			}
		public function get_profile()
			{
				echo $this->MobileModel->get_profile();
			}
		public function forgot()
			{ 
				echo $this->MobileModel->forgot();
			}
		
		public function provider_login()
			{
				echo $this->MobileModel->provider_login();
			}
		public function provider_register()
			{
				echo $this->MobileModel->provider_register();
			}
		public function provider_change_password()
			{
				echo $this->MobileModel->provider_change_password();
			}
		public function provider_get_profile()
			{
				echo $this->MobileModel->provider_get_profile();
			}
		public function provider_info()
			{
				echo $this->MobileModel->provider_info();
			}
		public function provider_forgot()
			{
				echo $this->MobileModel->provider_forgot();
			}
		public function provider_edit_profile()
			{
				echo $this->MobileModel->provider_edit_profile();
			}
		public function provider_enquiry_list()
			{
				echo $this->MobileModel->provider_enquiry_list();
			}
		public function provider_request() 
			{
				echo $this->MobileModel->provider_request();
			}	
		public function home()
			{
				$allcategories	=	$this->MobileModel->getheadcategories(0);
				echo json_encode($allcategories);
			}
			
		public function enquiry()
			{
				echo $this->MobileModel->enquiry();
			}
		public function cities()
			{
				echo $this->MobileModel->cities();
			}
		public function enquirylist()
			{
				echo $this->MobileModel->enquirylist();
			}
		public function sitepages()
			{
				echo $this->MobileModel->sitepages();
			}
		public function edit_profile()    
			{
				echo $this->MobileModel->edit_profile();
			}
		public function profile_image()
			{
				echo $this->MobileModel->profile_image();
			}
		public function user_info()
			{
				echo $this->MobileModel->user_info();
			}
	}
	
?>	