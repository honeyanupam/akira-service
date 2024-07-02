<?php
Class MobileModel extends CI_Model
	{
		
	function upload_documents($input=null) 
		{
			
			if(!empty($input))
			{
				$filepath  =  FCPATH.'images/';

				$input = str_replace("data:image/png;base64,","",$input);
				$image_base64            = base64_decode($input);
				$imgname          	   = uniqid() .".jpg";
				$file                  = $filepath .$imgname;
				$success                 = file_put_contents($file, $image_base64);
				$filename          	   = 'images/'.$imgname;
				return $success ? $filename : 0; 
			}
			else
			{ 
				return 0;
			}
		}
		
	public function checkpostinput($index)
		{
			$return = $this->input->post($index);
			$return = $this->security->xss_clean($return);
			return trim($return); 
		}
			
	public function checkgetinput($index)
		{
				$return = $this->input->get($index);
				$return = $this->security->xss_clean($return);
			return trim($return); 
		}
		
	
	public function checkrightobject($objectarray,$objectindex,$defaultvalue)
		{
		  if(isset($objectarray->$objectindex))
			return filter_var($objectarray->$objectindex, FILTER_SANITIZE_STRING,FILTER_FLAG_ENCODE_LOW);
		  return $defaultvalue;
		}
	
	
	public function login()
		{ 
			$Senddata 				= 	array();
			$Senddata['status'] 	= 	0;
			$Senddata['data'] 		= 	"";
			$Senddata['message'] 	= 	"Something went wrong, Please try again later!";
			$json   				= 	file_get_contents('php://input');
			$obj					=	json_decode($json);
			if(empty($obj)) { return (json_encode($Senddata)); }
			$email					=	trim(strtolower($this->checkrightobject($obj,"email",0)));
			$password				=	$this->checkrightobject($obj,"password",0); 
			if(empty($email))
			{
				$Senddata['message'] = "email ID is mandatory!";
				return json_encode($Senddata);
			}
			if(empty($password))
			{
				$Senddata['message'] = "Password is mandatory!";
				return json_encode($Senddata);
			}
			if(trim($email !='') && trim($password !=''))
			{
				//$query = $this->db->query("select * from users where email='".$email."' and password= '".md5($password)."' ");
				$this->db->select('*');
				$this->db->from('users');
				$this->db->where("email",$email);
				$this->db->or_where("mobileno",$email);
				$this->db->where("password",md5($password));
				$query	=	$this->db->get();
				$res = $query->result_array();
				
				if(!empty($res))
				{
					$Senddata['status'] 	= 1;
					$Senddata['data'] 		= $res;
					$Senddata['message'] 	= "Logged in successfully!";
					return json_encode($Senddata);
				} 
				else 
				{
					$Senddata['status'] 	= 0;
					$Senddata['message'] 	= "No user with this credential!";
					return json_encode($Senddata);
				}
			}else 
			{
				$Senddata['status'] 	= 0;
				$Senddata['message'] 	= "Something went wrong!";
				return json_encode($Senddata);
			}
		}
		
	
    public function register(){
    
		$sendarray 				= 	array();
		$sendarray['status'] 	= 	0;
		$sendarray['data'] 		= 	"";
		$sendarray['message'] 	= 	"Something went wrong, Please try again later!";
		$json   				= 	file_get_contents('php://input');
		$obj					=	json_decode($json);
		if(empty($obj)) { return (json_encode($sendarray)); }
		$name					=	$this->checkrightobject($obj,"name",0); 
		$email					=	$this->checkrightobject($obj,"email",0); 
		$mobileno				=	$this->checkrightobject($obj,"mobileno",0); 
		$gender					=	$this->checkrightobject($obj,"gender",0); 
		$address				=	$this->checkrightobject($obj,"address",0); 
		$password				=	$this->checkrightobject($obj,"password",0); 
		$c_password				=	$this->checkrightobject($obj,"c_password",0); 
        
		if(strlen($password) < 5 )
        {
        $sendarray['status']    =  0;
        $sendarray['message']  =  "Password Should Be at least 5 Characters";
        return json_encode($sendarray);
        }else{  
        
        
        $this->db->select('*');
        $this->db->from('users');
        //$this->db->where('email',$email);
        $this->db->or_where('mobileno',$mobileno);
        $email_check = $this->db->get()->result_array();

            if(!empty($email_check)){
            $sendarray['status'] = 0; 
            $sendarray['message'] = 'Email or contact number is already exist'; 
            return json_encode($sendarray);
            }elseif(empty($email_check)){
            
            $insdata['name'] 					= 		$name;
            $insdata['email'] 			        = 		$email;
            $insdata['password'] 			    = 		md5($password);
            $insdata['mobileno'] 				= 		$mobileno;
            $insdata['gender'] 					= 		$gender;
            $insdata['address'] 				= 		$address;
            
            if($password==$c_password){
            $this->db->insert('users',$insdata);
            $sendarray['status'] = 1;
			$sendemailto    =  	$email;
					$sendnameto     =  	$name;
					$sendemailsub   =  	"Welcome Akira A to Z Services .";	
					
					$message		=	" Hello $sendnameto, 
												<br/> <br/>
											We have received a new password for your account with Akira A to Z Services.  <br/>
											<table>
												<tr>
													<td>
														<b>Email:</b>
													</td>
													<td>
														$sendemailto
													</td>
												</tr>
												<tr>
													<td>
														<b>Password:</b> 
													</td>
													<td>
															$password 
													</td>
												</tr>
											</table>
											<br/>
										
										";	
				$sendemailaddreplyto     = 'noreply@akiraservices.in';						
				$template 				 = FCPATH."email.theme";
				$template 				 = file_get_contents($template);
				$message				 = str_replace("###CONTENT###",$message,$template);
				$to						 = $sendemailto;
				$subject 				 = "Welcome to Akira Services";
				$headers 				 = "MIME-Version: 1.0" . "\r\n";
				$headers 				.= "Content-type:text/html;charset=UTF-8" . "\r\n";
				$headers 				.= 'From: Akira Services <noreply@akiraservices.in>' . "\r\n";
				if(mail($sendemailto,$sendemailsub,$message,$headers)) 
				$sendarray['message'] 	= 'Thankyou Regitration Successfully'; 
				 
            }else{
            $sendarray['status'] = 0; 
            $sendarray['message'] = 'Something went wrong!';
            }
            return json_encode($sendarray);
            
            }else{
            $sendarray['status'] = 0;
            $sendarray['message'] = 'Something went wrong!';
            return json_encode($sendarray);
            }
        } 
    }
	
	
    public function user_info()
	{
		$sendarray 				= 	array();
		$sendarray['status'] 	= 	0;
		$sendarray['data'] 		= 	"";
		$sendarray['message'] 	= 	"Something went wrong, Please try again later!";
		$json   				= 	file_get_contents('php://input');
		$obj					=	json_decode($json);
		if(empty($obj)) { return (json_encode($sendarray)); } 
		$id						=	$this->checkrightobject($obj,"id",0); 
		$name					=	$this->checkrightobject($obj,"name",0); 
		$email					=	$this->checkrightobject($obj,"email",0); 
		$mobileno				=	$this->checkrightobject($obj,"mobileno",0); 
		$gender					=	$this->checkrightobject($obj,"gender",0); 
		$address				=	$this->checkrightobject($obj,"address",0); 
		$adhaar					=	$this->checkrightobject($obj,"adhaar",0); 
		$samgra_id				=	$this->checkrightobject($obj,"samgra_id",0); 
		$education		    	=	$this->checkrightobject($obj,"education",0); 
		$job					=	$this->checkrightobject($obj,"job",0); 
		$problem				=	$this->checkrightobject($obj,"problem",0); 
		$house					=	$this->checkrightobject($obj,"house",0); 
		$remark					=	$this->checkrightobject($obj,"remark",0);   
		if(!empty($id) && !empty($adhaar))
		{
			$insdata = array();
			$insdata['name'] 					= 		$name;
            $insdata['email'] 			        = 		$email;
            $insdata['mobileno'] 				= 		$mobileno;
            $insdata['gender'] 					= 		$gender;
            $insdata['address'] 				= 		$address;
            $insdata['adhaar'] 					= 		$adhaar;
            $insdata['samgra_id'] 			    = 		$samgra_id;
            $insdata['education'] 			    = 		$education;
            $insdata['job'] 					= 		$job;
            $insdata['problem'] 				= 		$problem;
            $insdata['remark'] 					= 		$remark;
            
            $this->db->where('id',$id);
            $this->db->update('users',$insdata);
			$query = $this->db->query("select * from users where id='".$id."'");
				$res = $query->result_array();
				
				if(!empty($res))
				{
					$sendarray['status'] 	= 1;
					$sendarray['data'] 		= $res;
					$sendarray['message'] 	= "Details Updated Successfully!";
					return json_encode($sendarray);
				} 
		}else 
			{
				$sendarray['status'] 	= 0;
				$sendarray['message'] 	= "Adhaar Number is required !!";
				return json_encode($sendarray);
			}
		   
		
    }
    public function change_password(){
		$sendarray 				= 	array();
		$sendarray['status'] 	= 	0;
		$sendarray['data'] 		= 	"";
		$sendarray['message'] 	= 	"Something went wrong, Please try again later!";
		$json   				= 	file_get_contents('php://input');
		$obj					=	json_decode($json);
		if(empty($obj)) { return (json_encode($sendarray)); }
		$id						=	$this->checkrightobject($obj,"id",0); 
		$password				=	$this->checkrightobject($obj,"password",0); 
		$old_password			=	$this->checkrightobject($obj,"old_password",0); 
		$confirm_password		=	$this->checkrightobject($obj,"confirm_password",0); 

            $this->db->select('*');
            $this->db->from('users');
            $this->db->where('id',$id);
            $this->db->where('password',md5($old_password));
            $pass_check = $this->db->get()->result_array();

            if(strlen($password) < 6 )
            {
            $sendarray['status']    =  0;
            $sendarray['message']  =  "Password Should Be at least 6 Characters";
            return json_encode($sendarray);
            }elseif(!preg_match("/[A-z]/",$password) )
            {
            $sendarray['status']    =  0;
            $sendarray['message']  =  "Password Should Be at least One Letter";
            return json_encode($sendarray);
            }elseif(!preg_match("/[A-Z]/",$password) )
            {
            $sendarray['status']    =  0;
            $sendarray['message']  =  "Password Should Be at least One Capital Letter";
            return json_encode($sendarray);
            }elseif(!preg_match("/\d/",$password) )
            {
            $sendarray['status']    =  0;
            $sendarray['message']  =  	"Password Should Be at least One Number";
            return json_encode($sendarray);
            }elseif(empty($pass_check)){
            $data['status'] = 0; 
            $data['message'] = 'Old password is wrong'; 
            }elseif(!empty($password && $old_password && $confirm_password && $pass_check)){
            
            if($password==$confirm_password){
            $insdata['password'] 	= 	md5($password);
            
            $this->db->where('id',$id);
            $status_update=$this->db->update('users',$insdata);
            
            $sendarray['status'] = 1;
            $sendarray['message'] = 'Updated';
            }else{
            $sendarray['status'] = 0;
            $sendarray['message'] = 'New & confirm password is not same';    
            }
            
            
            }else{
            $sendarray['status'] = 0;
            $sendarray['message'] = 'Error';     
            }
            
            return json_encode($sendarray);
            
    }
	
	
		public function get_profile()
		{ 
			$Senddata 				= 	array();
			$Senddata['status'] 	= 	0;
			$Senddata['data'] 		= 	"";
			$Senddata['message'] 	= 	"Something went wrong, Please try again later!";
			$json   				= 	file_get_contents('php://input');
			$obj					=	json_decode($json);
			if(empty($obj)) { return (json_encode($Senddata)); }
			$id						=	trim($this->checkrightobject($obj,"id",0));
			if(!empty($id)){
				 $this->db->select('*');
				 $this->db->from('users');
				 $this->db->where('id',$id);
				 $result = $this->db->get()->result_array();
			if(!empty($result))
			{
				$Senddata['status'] 	= 1;
				$Senddata['data'] 		= $result;
				$Senddata['message'] 	= "Data found!";
				return json_encode($Senddata);
			}else{
				$Senddata['status'] 	= 0;
				$Senddata['data'] 		= '';
				$Senddata['message'] 	= "Data not found!";
				return json_encode($Senddata);
			}	
			}else{
				$Senddata['status'] 	= 0;
				$Senddata['data'] 		= '';
				$Senddata['message'] 	= "Data not found!";
				return json_encode($Senddata);
			}
		}	
		
		
		public function forgot()
		{
			$Senddata 			 	= array();
			$Senddata['status']  	= 0;
			$Senddata['message'] 	= "Something went wrong, Please try again later!";
			$json   				= 	file_get_contents('php://input');
			$obj					=	json_decode($json);
			if(empty($obj)) { return (json_encode($Senddata)); }
			$email					=	trim($this->checkrightobject($obj,"email",0));
			//$email					=	$_POST['email'];
			$randpassword        	= rand('9999',2);
			if(empty($email))
			{
				$Senddata['status'] = 	0;
				$Senddata['message']= 	"Email address is mandatory!";
				return json_encode($Senddata);
			} 
			if(!filter_var($email, FILTER_VALIDATE_EMAIL))
			{
				$Senddata['status'] = 	0;
				$Senddata['message']= 	"Please enter a valid email address!";
				return json_encode($Senddata);
			}
			if(trim($email !=''))
			{
				$this->db->where('email',$email);
				$this->db->set('password',md5($randpassword));
				$this->db->update('users');
				$results = $this->db->get_where('users',array('email'=>$email))->result_array();
				if(!empty($results))
				{
					$sendemailto    =  	$results[0]['email'];
					$sendnameto     =  	$results[0]['name'];
					$sendemailsub   =  	"Welcome to Akira Services.";	
					
					$message		=	" Hello $sendnameto, 
												<br/> <br/>
											We have received a new password for your account with Akira Services.  <br/>
											<table>
												<tr>
													<td>
														<b>Email:</b>
													</td>
													<td>
														$sendemailto
													</td>
												</tr>
												<tr>
													<td>
														<b>Password:</b> 
													</td>
													<td>
															$randpassword 
														<small>
															( Your new password for your account )
														</small>  
													</td>
												</tr>
											</table>
											<br/>
										
										";	
				$sendemailaddreplyto     = 'noreply@akiraservices.in';						
				$template 				 = FCPATH."email.theme";
				$template 				 = file_get_contents($template);
				$message				 = str_replace("###CONTENT###",$message,$template);
				$to						 = $sendemailto;
				$subject 				 = "Welcome to Akira Services";
				$headers 				 = "MIME-Version: 1.0" . "\r\n";
				$headers 				.= "Content-type:text/html;charset=UTF-8" . "\r\n";
				$headers 				.= 'From: Akira Services <noreply@akiraservices.in>' . "\r\n";
				if(mail($sendemailto,$sendemailsub,$message,$headers))   
					{  
						$Senddata['status']		=	1;
						$Senddata['message']	=	'We have sent you a email with new password';
						return json_encode($Senddata); 
					}else{
						$Senddata['status']		=	0;
						$Senddata['message']	=	'Something went wrong';
						return json_encode($Senddata);
					}
				}else{
						$Senddata['status'] = 0;
						$Senddata['message'] = "No user with this Email address ($email)!";
						return json_encode($Senddata);
				}
			}
		}
    	
		
	
	public function getheadcategories($catid=0)
		{
			$data = array();
			$this->db->select('cat_id,cat_title,description,newsimages,subcategory');
			$this->db->from('categroy');
			$this->db->where("subcategory",$catid);
			$this->db->where("status","1");
			$query	=	$this->db->get();
			$result =	$query->result_array();
			if(!empty($result)){
				$data['status'] = 1;
				$data['message'] = "Category List";
				$data['data'] = $result;
			}else{
				$data['status'] = 0;
				$data['message'] = "There is no data";
				$data['data'] = "";  
			}
			return $data; 
		}
	public function enquiry()
		{
			$Senddata 				= array();
			$Senddata['status'] 	= 0;
			$Senddata['data'] 		= "";
			$Senddata['message'] 	= "Something went wrong, Please try again later!";
			$json   				= file_get_contents('php://input');
			$obj  					= json_decode($json);
			$servicetype 			= $this->checkrightobject($obj,'servicetype',0);
			$fullname  				= $this->checkrightobject($obj,'fullname',0);
			$mobile  				= $this->checkrightobject($obj,'mobile',0);
			$service_date  			= $this->checkrightobject($obj,'service_date',0);
			$start_time  			= $this->checkrightobject($obj,'start_time',0);
			$end_time  				= $this->checkrightobject($obj,'end_time',0);
			$city  					= $this->checkrightobject($obj,'city',0);
			$landmark  				= $this->checkrightobject($obj,'landmark',0);
			$address  				= $this->checkrightobject($obj,'address',0); 
			$cat_id  				= $this->checkrightobject($obj,'cat_id',0);
			$subcategory			= $this->checkrightobject($obj,'subcategory',0);
			$user_id  				= $this->checkrightobject($obj,'user_id',0);
			if(!empty($cat_id)){
					$insert                     =   array();
					$insert['servicetype']      =   $servicetype;
					$insert['fullname'] 	    =   $fullname;
					$insert['mobile']          	=   $mobile;
					$insert['cat_id']           =   $cat_id;
					$insert['subcategory']      =   $subcategory;
					$insert['service_date']     =   $service_date;
					$insert['start_time']       =   $start_time;
					$insert['end_time']        	=   $end_time;
					$insert['city']   			=   $city;
					$insert['otp']   			=   rand(0000,9999);
					$insert['landmark']         =   $landmark;
					$insert['address']         	=   $address;
					$insert['user_id']         	=   $user_id;
					$this->db->insert("enquiry", $insert);
					$Senddata['status']		=	1;
					$Senddata['message']	=	'Your Request is submit successfully your OTP is '.$insert['otp'];
					$title = "New Order Request";
					$message = "You have new order generated please accepted and complete the process";
					sendpushnotifacation($title,$message);
			}else{
				$Senddata['status']		=	0;
				$Senddata['message']	=	'Data not found';
			}
			return json_encode($Senddata);
		}

	public function enquirylist()
		{
			$Senddata 				= array();
			$Senddata['status'] 	= 0;
			$Senddata['data'] 		= "";
			$Senddata['message'] 	= "Something went wrong, Please try again later!";
			$json   				= file_get_contents('php://input');
			$obj  					= json_decode($json);
			$user_id 				= $this->checkrightobject($obj,'user_id',0);
			
			if(!empty($user_id))
			{
					$this->db->select('*');
					$this->db->from('enquiry');
					$this->db->where("user_id",$user_id);
					$this->db->order_by("id","DESC");
					$query	=	$this->db->get();
					$result =	$query->result_array();
					if(!empty($result)){
						$data['status'] = 1;
						$data['message'] = "Enquiry List";
						$data['data'] = $result;
					}else{
						$data['status'] = 0;
						$data['message'] = "There is no data";
						$data['data'] = "";
					}
			}else{
					$data['status'] = 0;
					$data['message'] = "User Information is wrong, please try again !!!";
					$data['data'] = "";
					
			}
			return json_encode($data);	
			
		}
		
	public function sitepages()  
		{
			$Senddata 				= array();
			$Senddata['status'] 	= 0;
			$Senddata['data'] 		= "";
			$Senddata['message'] 	= "Something went wrong, Please try again later!";
			$json   				= file_get_contents('php://input');
			$obj  					= json_decode($json);
			$id		 				= $this->checkrightobject($obj,'id',0);
			$result= array();
			if(!empty($id))
			{
					$this->db->select('*');
					$this->db->from('pages');
					$this->db->where('id',$id);
					$query	=	$this->db->get();
					$result =	$query->result_array();
					
			}
					if(!empty($result)){
						$data['status'] = 1;
						$data['message'] = "site pages List";     
						$data['data'] = $result;
					}else{
						$data['status'] = 0;
						$data['message'] = "There is no data";
						$data['data'] = "";
					}
			return json_encode($data);	
			
		}

	public function profile_image()
		{
			$data 				= 	array();
			$data['status'] 	= 	0;
			$data['data'] 		= 	"";
			$data['message'] 	= 	"Something went wrong, Please try again later!";
			$json   			= 	file_get_contents('php://input');
			$obj				=	json_decode($json);
			if(empty($obj)) { return (json_encode($data)); }
			$id					=	$this->checkrightobject($obj,"user_id",0); 
			$image				=	$this->checkrightobject($obj,"image",0); 
			$image   			= 	$this->upload_documents($image);  
			$insdata = array();
			$insdata['image'] 	= 		$image;
			$this->db->where('id',$id);
			$status_update=$this->db->update('users',$insdata);
			if(!empty($status_update)){
				$data['message'] = 'image uploaded';
				$data['status'] = '1';
			}else{
				$data['status'] 	= 0;
				$data['message'] 	= "Something went wrong!";
			}
			return json_encode($data);
		}


    public function edit_profile(){
		$data 				= 	array();
		$data['status'] 	= 	0;
		$data['data'] 		= 	"";
		$data['message'] 	= 	"Something went wrong, Please try again later!";
		$json   				= 	file_get_contents('php://input');
		$obj					=	json_decode($json);
		if(empty($obj)) { return (json_encode($data)); }
		$id						=	$this->checkrightobject($obj,"id",0); 
		$name					=	$this->checkrightobject($obj,"name",0);  
		$email					=	$this->checkrightobject($obj,"email",0); 
		$mobileno				=	$this->checkrightobject($obj,"mobileno",0); 
		$gender					=	$this->checkrightobject($obj,"gender",0); 
		$address				=	$this->checkrightobject($obj,"address",0); 
		
        if(!empty($id && $mobileno && $email)){
            
            $insdata['name'] 					= 		$name;
            $insdata['mobileno'] 				= 		$mobileno;
            $insdata['email'] 			        = 		$email;
            $insdata['gender'] 			        = 		$gender;
            $insdata['address'] 		        = 		$address;
            $this->db->where('id',$id);
            $status_update=$this->db->update('users',$insdata);
            
            $data['message'] = 'Updated';
            }
            
            $this->db->select('*');
            $this->db->from('users');
            $this->db->where('id',$id);
            $user_detail = $this->db->get()->result_array();
            
            $data['status'] = 1;
            $data['data'] = $user_detail;
            return json_encode($data);
            
    }		
	
		
	public function provider_login()
		{ 
			$Senddata 				= 	array();
			$Senddata['status'] 	= 	0;
			$Senddata['data'] 		= 	"";
			$Senddata['message'] 	= 	"Something went wrong, Please try again later!";
			$json   				= 	file_get_contents('php://input');
			$obj					=	json_decode($json);
			if(empty($obj)) { return (json_encode($Senddata)); }
			$email					=	trim(strtolower($this->checkrightobject($obj,"email",0)));
			$password				=	$this->checkrightobject($obj,"password",0); 
			$fb_token				=	$this->checkrightobject($obj,"fb_token",0); 
			if(empty($email))
			{
				$Senddata['message'] = "email ID is mandatory!";
				return json_encode($Senddata);
			}
			if(empty($password))
			{
				$Senddata['message'] = "Password is mandatory!";
				return json_encode($Senddata);
			}
			if(trim($email !='') && trim($password !=''))
			{
				$query = $this->db->query("select * from provider where email='".$email."' and password= '".md5($password)."' ");
				$res = $query->result_array();
				
				if(!empty($res))
				{
					$insdata = array();
					$insdata['fb_token'] = $fb_token;
					$this->db->where('id',$res[0]['id']);
					$status_update=$this->db->update('provider',$insdata);
					$Senddata['status'] 	= 1;
					$Senddata['data'] 		= $res;
					$Senddata['message'] 	= "Logged in successfully!";
					return json_encode($Senddata);
				} 
				else 
				{
					$Senddata['status'] 	= 0;
					$Senddata['message'] 	= "No user with this credential!";
					return json_encode($Senddata);
				}
			}else 
			{
				$Senddata['status'] 	= 0;
				$Senddata['message'] 	= "Something went wrong!";
				return json_encode($Senddata);
			}
		}
		
    public function provider_register(){
    
		$sendarray 				= 	array();
		$sendarray['status'] 	= 	0;
		$sendarray['data'] 		= 	"";
		$sendarray['message'] 	= 	"Something went wrong, Please try again later!";
		$json   				= 	file_get_contents('php://input');
		$obj					=	json_decode($json);
		if(empty($obj)) { return (json_encode($sendarray)); }
		$name					=	$this->checkrightobject($obj,"name",0); 
		$email					=	$this->checkrightobject($obj,"email",0); 
		$mobileno				=	$this->checkrightobject($obj,"mobileno",0); 
		$gender					=	$this->checkrightobject($obj,"gender",0); 
		$address				=	$this->checkrightobject($obj,"address",0); 
		$password				=	$this->checkrightobject($obj,"password",0); 
		$c_password				=	$this->checkrightobject($obj,"c_password",0); 
		$city_id				=	$this->checkrightobject($obj,"city_id",0); 
        
		if(strlen($password) < 6 )
        {
        $sendarray['status']    =  0;
        $sendarray['message']  =  "Password Should Be at least 6 Characters";
        return json_encode($sendarray);
        }elseif(!preg_match("/[A-z]/",$password) )
        {
        $sendarray['status']    =  0;
        $sendarray['message']  =  "Password Should Be at least One Letter";
        return json_encode($sendarray);
        }elseif(!preg_match("/[A-Z]/",$password) )
        {
        $sendarray['status']    =  0;
        $sendarray['message']  =  "Password Should Be at least One Capital Letter";
        return json_encode($sendarray);
        }elseif(!preg_match("/\d/",$password) )
        {
        $sendarray['status']    =  0;
        $sendarray['message']  =  	"Password Should Be at least One Number";
        return json_encode($sendarray);
        }else{  
        
        
        $this->db->select('*');
        $this->db->from('provider');
        $this->db->where('email',$email);
        $this->db->or_where('mobileno',$mobileno);
        $email_check = $this->db->get()->result_array();

            if(!empty($email_check)){
            $sendarray['status'] = 0; 
            $sendarray['message'] = 'Email or contact number is already exist'; 
            return json_encode($sendarray);
            }elseif(empty($email_check)){
            
            $insdata['name'] 					= 		$name;
            $insdata['email'] 			        = 		$email;
            $insdata['password'] 			    = 		md5($password);
            $insdata['mobileno'] 				= 		$mobileno;
            $insdata['gender'] 					= 		$gender;
            $insdata['address'] 				= 		$address;
            $insdata['city_id'] 				= 		$city_id;
            
            if($password==$c_password){
            $this->db->insert('provider',$insdata);
            $sendarray['status'] = 1;
			$sendemailto    =  	$email;
					$sendnameto     =  	$name;
					$sendemailsub   =  	"Welcome to Akira Services Provider App.";	
					
					$message		=	" Hello $sendnameto, 
												<br/> <br/>
											We have received a new password for your account with Akira Services.  <br/>
											<table>
												<tr>
													<td>
														<b>Email:</b>
													</td>
													<td>
														$sendemailto
													</td>
												</tr>
												<tr>
													<td>
														<b>Password:</b> 
													</td>
													<td>
															$password 
													</td>
												</tr>
											</table>
											<br/>
										
										";	
				$sendemailaddreplyto     = 'noreply@akiraservices.com';						
				$template 				 = FCPATH."email.theme";
				$template 				 = file_get_contents($template);
				$message				 = str_replace("###CONTENT###",$message,$template);
				$to						 = $sendemailto;
				$subject 				 = "Welcome to Akira Services Provider App";
				$headers 				 = "MIME-Version: 1.0" . "\r\n";
				$headers 				.= "Content-type:text/html;charset=UTF-8" . "\r\n";
				$headers 				.= 'From: Akira Services <noreply@akiraservices.com>' . "\r\n";
				if(mail($sendemailto,$sendemailsub,$message,$headers)) 
				$sendarray['message'] 	= 'We have sent you a email with login details'; 
				 
            }else{
            $sendarray['status'] = 0; 
            $sendarray['message'] = 'Something went wrong!';
            }
            return json_encode($sendarray);
            
            }else{
            $sendarray['status'] = 0;
            $sendarray['message'] = 'Something went wrong!';
            return json_encode($sendarray);
            }
        } 
    }
	
	
	public function provider_change_password(){
		$sendarray 				= 	array();
		$sendarray['status'] 	= 	0;
		$sendarray['data'] 		= 	"";
		$sendarray['message'] 	= 	"Something went wrong, Please try again later!";
		$json   				= 	file_get_contents('php://input');
		$obj					=	json_decode($json);
		if(empty($obj)) { return (json_encode($sendarray)); }
		$id						=	$this->checkrightobject($obj,"id",0); 
		$password				=	$this->checkrightobject($obj,"password",0); 
		$old_password			=	$this->checkrightobject($obj,"old_password",0); 
		$confirm_password		=	$this->checkrightobject($obj,"confirm_password",0); 

            $this->db->select('*');
            $this->db->from('provider');
            $this->db->where('id',$id);
            $this->db->where('password',md5($old_password));
            $pass_check = $this->db->get()->result_array();

            if(strlen($password) < 6 )
            {
            $sendarray['status']    =  0;
            $sendarray['message']  =  "Password Should Be at least 6 Characters";
            return json_encode($sendarray);
            }elseif(!preg_match("/[A-z]/",$password) )
            {
            $sendarray['status']    =  0;
            $sendarray['message']  =  "Password Should Be at least One Letter";
            return json_encode($sendarray);
            }elseif(!preg_match("/[A-Z]/",$password) )
            {
            $sendarray['status']    =  0;
            $sendarray['message']  =  "Password Should Be at least One Capital Letter";
            return json_encode($sendarray);
            }elseif(!preg_match("/\d/",$password) )
            {
            $sendarray['status']    =  0;
            $sendarray['message']  =  	"Password Should Be at least One Number";
            return json_encode($sendarray);
            }elseif(empty($pass_check)){
            $data['status'] = 0; 
            $data['message'] = 'Old password is wrong'; 
            }elseif(!empty($password && $old_password && $confirm_password && $pass_check)){
            
            if($password==$confirm_password){
            $insdata['password'] 	= 	md5($password);
            
            $this->db->where('id',$id);
            $status_update=$this->db->update('provider',$insdata);
            
            $sendarray['status'] = 1;
            $sendarray['message'] = 'Updated';
            }else{
            $sendarray['status'] = 0;
            $sendarray['message'] = 'New & confirm password is not same';    
            }
            
            
            }else{
            $sendarray['status'] = 0;
            $sendarray['message'] = 'Error';     
            }
            
            return json_encode($sendarray);
            
    }
	
	public function provider_get_profile()
		{ 
			$Senddata 				= 	array();
			$Senddata['status'] 	= 	0;
			$Senddata['data'] 		= 	"";
			$Senddata['message'] 	= 	"Something went wrong, Please try again later!";
			$json   				= 	file_get_contents('php://input');
			$obj					=	json_decode($json);
			if(empty($obj)) { return (json_encode($Senddata)); }
			$id						=	trim($this->checkrightobject($obj,"id",0));
			if(!empty($id)){
				 $this->db->select('*');
				 $this->db->from('provider');
				 $this->db->where('id',$id);
				 $result = $this->db->get()->result_array();
			if(!empty($result))
			{
				$Senddata['status'] 	= 1;
				$Senddata['data'] 		= $result;
				$Senddata['message'] 	= "Data found!";
				return json_encode($Senddata);
			}else{
				$Senddata['status'] 	= 0;
				$Senddata['data'] 		= '';
				$Senddata['message'] 	= "Data not found!";
				return json_encode($Senddata);
			}	
			}else{
				$Senddata['status'] 	= 0;
				$Senddata['data'] 		= '';
				$Senddata['message'] 	= "Data not found!";
				return json_encode($Senddata);
			}
		}	
		
	public function provider_forgot()
		{
			$Senddata 			 	= array();
			$Senddata['status']  	= 0;
			$Senddata['message'] 	= "Something went wrong, Please try again later!";
			$json   				= 	file_get_contents('php://input');
			$obj					=	json_decode($json);
			if(empty($obj)) { return (json_encode($Senddata)); }
			$email					=	trim($this->checkrightobject($obj,"email",0));
			//$email					=	$_POST['email'];
			$randpassword        	= rand('9999',2);
			if(empty($email))
			{
				$Senddata['status'] = 	0;
				$Senddata['message']= 	"Email address is mandatory!";
				return json_encode($Senddata);
			} 
			if(!filter_var($email, FILTER_VALIDATE_EMAIL))
			{
				$Senddata['status'] = 	0;
				$Senddata['message']= 	"Please enter a valid email address!";
				return json_encode($Senddata);
			}
			if(trim($email !=''))
			{
				$this->db->where('email',$email);
				$this->db->set('password',md5($randpassword));
				$this->db->update('provider');
				$results = $this->db->get_where('provider',array('email'=>$email))->result_array();
				if(!empty($results))
				{
					$sendemailto    =  	$results[0]['email'];
					$sendnameto     =  	$results[0]['name'];
					$sendemailsub   =  	"Welcome to Akira Services Provider App.";	
					
					$message		=	" Hello $sendnameto, 
												<br/> <br/>
											We have received a new password for your account with Akira Services.  <br/>
											<table>
												<tr>
													<td>
														<b>Email:</b>
													</td>
													<td>
														$sendemailto
													</td>
												</tr>
												<tr>
													<td>
														<b>Password:</b> 
													</td>
													<td>
															$randpassword 
														<small>
															( Your new password for your account )
														</small>  
													</td>
												</tr>
											</table>
											<br/>
										
										";	
				$sendemailaddreplyto     = 'noreply@akiraservices.com';						
				$template 				 = FCPATH."email.theme";
				$template 				 = file_get_contents($template);
				$message				 = str_replace("###CONTENT###",$message,$template);
				$to						 = $sendemailto;
				$subject 				 = "Welcome to Akira Services Provider App";
				$headers 				 = "MIME-Version: 1.0" . "\r\n";
				$headers 				.= "Content-type:text/html;charset=UTF-8" . "\r\n";
				$headers 				.= 'From: Akira Services <noreply@akiraservices.com>' . "\r\n";
				if(mail($sendemailto,$sendemailsub,$message,$headers))   
					{  
						$Senddata['status']		=	1;
						$Senddata['message']	=	'We have sent you a email with new password';
						return json_encode($Senddata); 
					}else{
						$Senddata['status']		=	0;
						$Senddata['message']	=	'Something went wrong';
						return json_encode($Senddata);
					}
				}else{
						$Senddata['status'] = 0;
						$Senddata['message'] = "No user with this Email address ($email)!";
						return json_encode($Senddata);
				}
			}
		}
    	 
	public function provider_info()
	{
		$sendarray 				= 	array();
		$sendarray['status'] 	= 	0;
		$sendarray['data'] 		= 	"";
		$sendarray['message'] 	= 	"Something went wrong, Please try again later!";
		$json   				= 	file_get_contents('php://input');
		$obj					=	json_decode($json);
		if(empty($obj)) { return (json_encode($sendarray)); } 
		$id						=	$this->checkrightobject($obj,"id",0); 
		$name					=	$this->checkrightobject($obj,"name",0); 
		$email					=	$this->checkrightobject($obj,"email",0); 
		$mobileno				=	$this->checkrightobject($obj,"mobileno",0); 
		$gender					=	$this->checkrightobject($obj,"gender",0); 
		$address				=	$this->checkrightobject($obj,"address",0); 
		$city_id				=	$this->checkrightobject($obj,"city_id",0); 
		if(!empty($id))  
		{  
			$insdata = array();
			$insdata['name'] 					= 		$name;
            $insdata['email'] 			        = 		$email;   
            $insdata['mobileno'] 				= 		$mobileno;
            $insdata['gender'] 					= 		$gender;
            $insdata['address'] 				= 		$address;
            $insdata['city_id'] 				= 		$city_id;
            
            $this->db->where('id',$id);
            $this->db->update('provider',$insdata);
			$query = $this->db->query("select * from provider where id='".$id."'");
			$res = $query->result_array();
				
				if(!empty($res))
				{
					$sendarray['status'] 	= 1;
					$sendarray['data'] 		= $res;
					$sendarray['message'] 	= "Details Updated Successfully!";
					return json_encode($sendarray);        
				} 
		}  
		
    }
   
    public function provider_edit_profile()
	{
		$data 				= 	array();
		$data['status'] 	= 	0;
		$data['data'] 		= 	"";
		$data['message'] 	= 	"Something went wrong, Please try again later!";
		$json   				= 	file_get_contents('php://input');
		$obj					=	json_decode($json);
		if(empty($obj)) { return (json_encode($data)); }
		$id						=	$this->checkrightobject($obj,"id",0); 
		$name					=	$this->checkrightobject($obj,"name",0);  
		$email					=	$this->checkrightobject($obj,"email",0); 
		$mobileno				=	$this->checkrightobject($obj,"mobileno",0); 
		$gender					=	$this->checkrightobject($obj,"gender",0); 
		$address				=	$this->checkrightobject($obj,"address",0); 
		$city_id				=	$this->checkrightobject($obj,"city_id",0); 
		
        if(!empty($id && $mobileno && $email)){
            
            $insdata['name'] 					= 		$name;
            $insdata['mobileno'] 				= 		$mobileno;
            $insdata['email'] 			        = 		$email;
            $insdata['gender'] 			        = 		$gender;
            $insdata['address'] 		        = 		$address;
            $insdata['city_id'] 		        = 		$city_id;
            $this->db->where('id',$id);
            $status_update=$this->db->update('provider',$insdata);
            
            $data['message'] = 'Updated';
            }
            
            $this->db->select('*');
            $this->db->from('provider');
            $this->db->where('id',$id);
            $provider_detail = $this->db->get()->result_array();
            
            $data['status'] = 1;
            $data['data'] = $provider_detail;   
            return json_encode($data);
            
    }		
	
	public function provider_enquiry_list()
	{
			$Senddata 				= array();
			$Senddata['status'] 	= 0;
			$Senddata['data'] 		= "";
			$Senddata['message'] 	= "Something went wrong, Please try again later!";
			$json   				= file_get_contents('php://input');
			$obj  					= json_decode($json);
			$provider_id 			= $this->checkrightobject($obj,'provider_id',0);
			$city_id	 			= $this->checkrightobject($obj,'city_id',0);
			
			if(!empty($city_id))
			{
					$this->db->select('*');
					$this->db->from('enquiry');
					$this->db->where("city",$city_id);
					$this->db->order_by("id","DESC");
					$query	=	$this->db->get();
					$result =	$query->result_array();
					$tempdata = array();
					if(!empty($result))
					{
						foreach($result as $single)
						{
							$single['makeascomplete'] = 0;
							$single['completed'] = 0;
							$single['rejected'] = 0;
							$this->db->select('enquiry_id,provider_id,provider_status');
							$this->db->from('enquiry_request');
							$this->db->where("provider_id",$provider_id);
							$this->db->where("enquiry_id",$single['id']);
							$this->db->order_by("id","DESC");
							$querydata	=	$this->db->get();
							$resultdata =	$querydata->row_array();
							if(!empty($resultdata))
							{
								if($resultdata['provider_status']=='1')
								{
									$single['makeascomplete'] = 1;
								}elseif($resultdata['provider_status']=='2'){
									$single['completed'] = 1;  
								}elseif($resultdata['provider_status']=='3'){
									$single['rejected'] = 1;
								}
							}
							$tempdata[] = $single;
						}
					}
					if(!empty($tempdata)){
						$data['status'] = 1;
						$data['message'] = "Enquiry List";
						$data['data'] = $tempdata;   
					}else{
						$data['status'] = 0;
						$data['message'] = "There is no data";
						$data['data'] = "";
					}
			}else{
					$data['status'] = 0;
					$data['message'] = "User Information is wrong, please try again !!!";
					$data['data'] = "";
					
			}
			return json_encode($data);	
		}
		
	public function provider_request()
	{
			$Senddata 				= array();
			$Senddata['status'] 	= 0;
			$Senddata['data'] 		= "";
			$Senddata['message'] 	= "Something went wrong, Please try again later!";
			$json   				= file_get_contents('php://input');
			$obj  					= json_decode($json);
			$enquiry_id 			= $this->checkrightobject($obj,'enquiry_id',0);
			$provider_id 			= $this->checkrightobject($obj,'provider_id',0);
			$provider_status 		= $this->checkrightobject($obj,'provider_status',0);
			$otp			 		= $this->checkrightobject($obj,'otp',0);
			
			
			if(!empty($enquiry_id) && !empty($provider_id))
			{
				if($provider_status=='2')
				{
					$this->db->select('*');
					$this->db->from('enquiry');
					$this->db->where("id",$enquiry_id);
					$this->db->where("otp",$otp);
					$querydata	=	$this->db->get();
					$resultdata =	$querydata->result_array();
					if(empty($resultdata))
					{
						$data['status'] = 0;
						$data['message'] = "Otp is wrong, please try again later!! ";
						return json_encode($data);
					}
				}
				
				$uarray = array(); 
				$uarray['enquiry_id']  		=	$enquiry_id;
				$uarray['provider_id'] 		=	$provider_id;
				$uarray['provider_status']  =	$provider_status;
				$uarray['provider_otp']  	=	$otp;      
				
					$this->db->select('*');
					$this->db->from('enquiry_request');
					$this->db->where("enquiry_id",$enquiry_id);
					$this->db->where("provider_id",$provider_id);
					$query	=	$this->db->get();
					$result =	$query->result_array();
				
				if(!empty($result))
				{
					$this->db->where("enquiry_id",$enquiry_id);
					$this->db->update("enquiry_request",$uarray);
				}else{
					$this->db->insert("enquiry_request",$uarray);
				}
					$this->db->select('*');
					$this->db->from('enquiry_request');
					$this->db->where("enquiry_id",$enquiry_id);
					$query	=	$this->db->get();
					$result =	$query->result_array();
					if(!empty($result)){
						$data['status'] = 1;
						$data['message'] = "Request update status successfully";
						$data['data'] = $result;
					}else{
						$data['status'] = 0;
						$data['message'] = "There is no data";
						$data['data'] = "";
					}
			}else{
					$data['status'] = 0;
					$data['message'] = "User Information is wrong, please try again !!!";
					$data['data'] = "";
					
			}
			return json_encode($data);	
	}
		
	public function cities()
		{
			$data = array();
			$this->db->select('*');
			$this->db->from('cities');
			$this->db->where("status","1");
			$query	=	$this->db->get();
			$result =	$query->result_array();
			if(!empty($result)){
				$data['status'] = 1;
				$data['message'] = "cities List";
				$data['data'] = $result;
			}else{
				$data['status'] = 0;
				$data['message'] = "There is no data";
				$data['data'] = "";
			}
			return json_encode($data); 
		}
	}
?>