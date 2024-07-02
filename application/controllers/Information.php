<?php
		defined('BASEPATH') OR exit('No direct script access allowed');

	class Information extends MY_Controller 
		{

			public function __construct()
				{
					parent::__construct();
						$this->load->helper(array('form','language','url'));
						$this->load->model('CommonModel');
						$this->load->model('InformationModel');
							if(isset($_COOKIE['language']))
								{
									$this->lang->load($_COOKIE['language']."_landing" , $_COOKIE['language']);
								} else {
									$this->lang->load('english_landing' , 'english');
								}
				}
			
			public function index()
				{
					$data = array();
					$seo  = array();
					$checklogin	=	$this->InformationModel->checkloggedin();
						if($checklogin)
							{
								redirect("information/dashboard?token=".md5(time()));	
							}
						$data['checklogin']		=	$checklogin;
						$seo['url']				=	site_url("Information");
						$seo['title']			=	lang('logintext')." - ".WEBSITENAME;
						$seo['metatitle']		=	lang('textmetatitle')." - ".WEBSITENAME;
						$seo['metadescription']	=	lang('textmetadescription')." - ".WEBSITENAME;
						$data['data']['seo']	=	$seo;

									$data['layout'] = $this->frontLayout($data);

									$this->load->view("login.tpl" ,$data);

				} 

			
			public function emailtest(){
				$sendemailto    =  	"shuklaanupam994@gmail.com";
					$sendnameto     =  	"Anupam Shukla";
					$password 		=   '123456';
					$sendemailsub   =  	"Welcome to Akira Services .";	
					
					$message		=	" Hello $sendnameto, 
												<br/> <br/>
											We have received a new password for your account with Akira services.  <br/>
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
				{
					echo 'Yes';
				}else{
					echo 'No';
				}					
			}
			public function dashboard()
				{
					redirect("admin/enquiry");
					$data = array();
					$seo  = array();
						$checklogin	=	$this->InformationModel->checkloggedin();
							if(!$checklogin)
								{
									redirect("information?token=invalid");	
								}
						$data['checklogin']		=	$checklogin;
						$seo['url']				=	site_url("Admin/dashboard");
						$seo['title']			=	lang('welcometext')." - ".WEBSITENAME;
						$seo['metatitle']		=	lang('welcomemetatitle')." - ".WEBSITENAME;
						$seo['metadescription']	=	lang('welcomemetadescription')." - ".WEBSITENAME;
							$data['data']['seo'] = $seo;
							$data['layout'] = $this->frontLayout($data);
							$this->load->view("admin/dashboard.tpl" ,$data );
				}
				
			public function enquiry()
				{
					$data = array();
					$seo  = array();
						$checklogin			=	$this->InformationModel->checkloggedin();
							if(!$checklogin)
								{
									redirect("information?token=invalid");	
								}
						$data['checklogin']		=	$checklogin;
						$seo['url']				=	site_url("Admin/enquiry");
						$seo['title']			=	"Enquiry List - ".WEBSITENAME;
						$seo['metatitle']		=	"Enquiry List - ".WEBSITENAME;
						$seo['metadescription']	=	"Enquiry List - ".WEBSITENAME;
						$data['enquiry']		=	$this->InformationModel->getdataoftable('enquiry');
							$data['data']['seo'] = $seo;
							$data['layout'] = $this->frontLayout($data);
							$this->load->view("admin/enquiry.tpl" ,$data );
				}
				
			public function customers()
				{
					$data = array();
					$seo  = array();
						$checklogin			=	$this->InformationModel->checkloggedin();
							if(!$checklogin)
								{
									redirect("information?token=invalid");	
								}
						$data['checklogin']		=	$checklogin;
						$seo['url']				=	site_url("Admin/customers");   
						$seo['title']			=	"Customer List - ".WEBSITENAME;
						$seo['metatitle']		=	"Customer List - ".WEBSITENAME;
						$seo['metadescription']	=	"Customer List - ".WEBSITENAME;
						$data['customer']		=	$this->InformationModel->getdataoftable('users');
							$data['data']['seo'] = $seo;
							$data['layout'] = $this->frontLayout($data);
							$this->load->view("admin/customers.tpl" ,$data );
				}
				
				//101//
				
				public function newsletter()
				{
					$data = array();
					$seo  = array();
						$checklogin			=	$this->InformationModel->checkloggedin();
							if(!$checklogin)
								{
									redirect("information?token=invalid");	
								}
						$data['checklogin']		=	$checklogin;
						$seo['url']				=	site_url("Admin/newsletter");
						$seo['title']			=	"Newsletter - ".WEBSITENAME;
						$seo['metatitle']		=	"Newsletter - ".WEBSITENAME;
						$seo['metadescription']	=	"Newsletter - ".WEBSITENAME;
						$data['newsletter']		=	$this->db->get('newsletter_tbl')->result_array();
							$data['data']['seo'] = $seo;
							$data['layout'] = $this->frontLayout($data);
							$this->load->view("admin/newsletter.tpl" ,$data );
				}
				
				
				//101//
				public function transaction() 
				{
					$data = array();
					$seo  = array();
						$checklogin			=	$this->InformationModel->checkloggedin();
							if(!$checklogin)
								{
									redirect("information?token=invalid");	
								}
						$data['checklogin']		=	$checklogin;
						$seo['url']				=	site_url("Admin/transaction");
						$seo['title']			=	"Transaction List - ".WEBSITENAME;
						$seo['metatitle']		=	"Transaction List - ".WEBSITENAME;
						$seo['metadescription']	=	"Transaction List - ".WEBSITENAME;
						$data['data']['seo']    =   $seo;
					$data['transaction']	=	$this->InformationModel->transaction_list();
						
						$data['layout'] = $this->frontLayout($data);
						$this->load->view("admin/transactions.tpl" ,$data );
				}  
				
				
				//101//
				
				public function tickets() 
				{
					$data = array();
					$seo  = array();
						$checklogin			=	$this->InformationModel->checkloggedin();
							if(!$checklogin)
								{
									redirect("information?token=invalid");	
								}
						$data['checklogin']		=	$checklogin;
						$seo['url']				=	site_url("Admin/tickets");
						$seo['title']			=	"Tickets List - ".WEBSITENAME;
						$seo['metatitle']		=	"Tickets List - ".WEBSITENAME;
						$seo['metadescription']	=	"Tickets List - ".WEBSITENAME;
						$data['data']['seo']    =   $seo;
					$data['tickets']	=	$this->InformationModel->tickets_list();
						
						$data['layout'] = $this->frontLayout($data);
						$this->load->view("admin/tickets.php" ,$data );
				}  
				//101//
			public function reviews()
				{
					$data = array();
					$seo  = array();
						$checklogin			=	$this->InformationModel->checkloggedin();
							if(!$checklogin)
								{
									redirect("information?token=invalid");	
								}
						$data['checklogin']		 =	$checklogin;
						$seo['url']				 =	site_url("Admin/enquiry");
						$seo['title']			 =	"Review List - ".WEBSITENAME;
						$seo['metatitle']		 =	"Review List - ".WEBSITENAME;
						$seo['metadescription']	 =	"Review List - ".WEBSITENAME;
						$data['reviewlist']		 =	$this->InformationModel->reviewlist();
							$data['data']['seo'] =  $seo;
							$data['layout'] 	 =  $this->frontLayout($data);
							$this->load->view("admin/reviews.tpl" ,$data );
				}
				
			public function sitedetails()
				{
					$data = array();
					$seo  = array();
						$checklogin			=	$this->InformationModel->checkloggedin();
							if(!$checklogin)
								{
									redirect("information?token=invalid");	
								}
						$data['checklogin']		 	=	$checklogin;
						$seo['url']				 	=	site_url("Admin/enquiry");
						$seo['title']			 	=	"Site Details - ".WEBSITENAME;
						$seo['metatitle']		 	=	"Site Details - ".WEBSITENAME;
						$seo['metadescription']	 	=	"Site Details - ".WEBSITENAME;
						$data['updatesitedetails']	=	$this->InformationModel->updatesitedetails();
						$data['sitedetails']	 	=	$this->InformationModel->getdataoftable('sitedetails');
							$data['data']['seo'] 	= 	$seo;
							$data['layout']      	= 	$this->frontLayout($data);
							$this->load->view("admin/sitedetails.tpl" ,$data );
				}
				
			public function settings()
				{
					$data = array();
					$seo  = array();
						$checklogin			=	$this->InformationModel->checkloggedin();
							if(!$checklogin)
								{
									redirect("information?token=invalid");	
								}
						$data['checklogin']		 	=	$checklogin;
						$seo['url']				 	=	site_url("Admin/enquiry");
						$seo['title']			 	=	"Change Password - ".WEBSITENAME;
						$seo['metatitle']		 	=	"Change Password - ".WEBSITENAME;
						$seo['metadescription']	 	=	"Change Password - ".WEBSITENAME;
						$data['updatesitedetails']	=	$this->InformationModel->updatesitedetails();
						$data['sitedetails']	 	=	$this->InformationModel->getdataoftable('sitedetails');
							$data['data']['seo'] 	= 	$seo;
							$data['layout']      	= 	$this->frontLayout($data);
							$this->load->view("admin/settings.tpl" ,$data );
				}	
				
				
				
			public function sitepages()
				{
					$data = array();
					$seo  = array();
						
						$checklogin			=	$this->InformationModel->checkloggedin();
							if(!$checklogin)
								{
									redirect("information?token=invalid");	
								}
								
						$pageid 					=	$this->input->get('pageid');
							if(!empty($pageid))
								{
									
									$value					=	$this->InformationModel->getdataoftablewhereclose('pages','id',$pageid);
									$data['editsitepages']	=	$this->InformationModel->editsitepage($pageid);

									$value	=	$value[0];	
									
									$data['pageid']					=	$pageid;
									$data['title']					=	$value->title;
									$data['description']			=	$value->description;
									$data['metatitle']				=	$value->metatitle;
									$data['metadescription']		=	$value->metadescription;
								
								} else {
									$data['pageid']					=	0;
									$data['title']					=	"";
									$data['description']			=	"";
									$data['metatitle']				=	"";
									$data['metadescription']		=	"";
								}	
					
						$data['sitepages']		=	$this->InformationModel->getdataoftable('pages');		
						$data['checklogin']		=	$checklogin;
						$seo['url']				=	site_url("Admin/sitepages");
						$seo['title']			=	"Site Pages - ".WEBSITENAME;
						$seo['metatitle']		=	"Site Pages - ".WEBSITENAME;
						$seo['metadescription']	=	"Site Pages - ".WEBSITENAME;
						
					
							$data['data']['seo'] = $seo;
							$data['layout'] = $this->frontLayout($data);
							$this->load->view("admin/sitepages.tpl" ,$data );
				} 
				
			public function makenewsisfeatured(){
				$newsid		=	$this->input->POST('newsid');
					$is_featured	=	$this->input->POST('is_featured');
						if(!empty($newsid))
							{
								$uarray = array();
									$uarray['key_feature']		=	$is_featured;
										$this->db->where("Id",$newsid);
											$this->db->update("news",$uarray);
							}
			}
			
			public function reviewstatus()
				{
					$id			=	$this->input->POST('statusid');
					$is_active	=	$this->input->POST('is_active');
						if(!empty($id))
							{
								$uarray = array();
									$uarray['status']		=	$is_active;
										$this->db->where("id",$id);
											$this->db->update("rating",$uarray);
							}
				}
				
			public function makectgisactive()
				{
					$catid		=	$this->input->POST('catid');
					$is_active	=	$this->input->POST('is_active');
						if(!empty($catid))
							{
								$uarray = array();
									$uarray['status']		=	$is_active;
										$this->db->where("cat_id",$catid);
											$this->db->update("categroy",$uarray);
							}
				}
				
			public function makenewsisactive(){
				$newsid		=	$this->input->POST('newsid');
					$is_active	=	$this->input->POST('is_active');
						if(!empty($newsid))
							{
								$uarray = array();
									$uarray['status']		=	$is_active;
										$this->db->where("Id",$newsid);
											$this->db->update("news",$uarray);
							}
			}				
		
		public function maketranisactive()
				{
					$pid		=	$this->input->POST('pid');
					$is_active	=	$this->input->POST('is_active');
						if(!empty($catid))
							{
								$uarray = array();
									$uarray['status']		=	$is_active;
										$this->db->where("pid",$pid);
											$this->db->update("transaction",$uarray);
							}
				}
		
		
			public function save_payment_info()
				{
						$data   			= 	$_POST['data'][0];
						$id		     		=	$data['id'];
						$amount	     		=	$data['transactions'][0]['amount']['total'];
						$currency	     	=	$data['transactions'][0]['amount']['currency'];
						$news_id	     	=	$_POST['news_id'];
						$ticket_id	     	=	$_POST['ticket_id'];
						$email		        =	$data['payer']['payer_info']['email'];
						$first_name			=	$data['payer']['payer_info']['first_name'];
						$middle_name		=	$data['payer']['payer_info']['middle_name'];
						$last_name	     	=	$data['payer']['payer_info']['last_name'];
						$recipient_name   	=	$data['payer']['payer_info']['shipping_address']['recipient_name'];
						$line1	     	    =	$data['payer']['payer_info']['shipping_address']['line1'];
						$city	         	=	$data['payer']['payer_info']['shipping_address']['city'];
						$state	     	    =	$data['payer']['payer_info']['shipping_address']['state'];
						$postal_code	    =	$data['payer']['payer_info']['shipping_address']['postal_code'];
						$country_code	    =	$data['payer']['payer_info']['shipping_address']['country_code'];
				
						if(!empty($data))
							{
								$uarray = array();
									$uarray['payment_id']		=	$id;
									$uarray['news_id']		    =	$news_id;
									$uarray['ticket_id']		=	$ticket_id;
									$uarray['amount']		    =	$amount;
									$uarray['currency']		    =	$currency;
									$uarray['email']		    =	$email;
									$uarray['first_name']		=	$first_name;
									$uarray['middle_name']		=	$middle_name;
									$uarray['last_name']		=	$last_name;
									$uarray['recipient_name']		    =	$recipient_name;
									$uarray['line1']		    =	$line1;
									$uarray['city']		        =	$city;
									$uarray['state']		    =	$state;
									$uarray['postal_code']		=	$postal_code;
									$uarray['country_code']		=	$country_code;
						 			$uarray['payment_method']	=	'paypal';
									$x= $this->db->insert("tbl_payment_gateway",$uarray);
										
										$this->db->select("*");
										$this->db->from('tbl_payment_gateway');
										$this->db->where('payment_id',$id);
										$query	=	$this->db->get();
										$result =	$query->result_array();
									 
									  if(count($result)>0)
										{
										  echo "Thank you for purchasing this ticket ";
										} else {
										 echo "Oops!looks like something went wrong. Please try again later.";
								  
									  }
							}
				} 
				
			public function catlist()
				{
					$data = array();
					$seo  = array();
						 $checklogin	=	$this->InformationModel->checkloggedin();
							if(!$checklogin)
								{
									redirect("information?token=invalid");	
								} 
								
								$page = $this->input->get("page");
								$data['srhcatkeyword'] 	=	$this->input->post("srhcatkeyword");
									if(empty($page)) { $page=1; }
						
								$catid 					=	$this->input->get('catid');
							if(!empty($catid))
								{
									$value	=	$this->InformationModel->getcategories($catid);
									$value	=	$value[0];	
									
									$data['catid']					=	$catid;
									$data['cat_title']				=	$value['cat_title'];
									$data['cat_description']		=	$value['description'];
									$data['subcategory']			=	$value['subcategory'];
									$data['newsimages']				=	$value['newsimages'];
									$data['cat_status']				=	$value['status'];
								} else {
									$data['catid']					=	0;
									$data['cat_title']				=	"";
									$data['cat_description']		=	"";
									$data['subcategory']			=	"";
									$data['newsimages']				=	""; 
									$data['cat_status']				=	"";
								}
						
									$data['addupmessage']	=	$this->InformationModel->editcategory();
									$search	=	array();
									$search['keyword'] 		= 	$data['srhcatkeyword'];
									
									
									$data['categories']		=	$this->InformationModel->getcategories(0,300,$page,$search);
									$data['allcategories']		=	$this->CommonModel->getheadcategories(0);
									
									$data['checklogin']		=	$checklogin;
									$seo['url']				=	site_url("admin/category");
									$seo['title']			=	"List Category - ".WEBSITENAME;
									$seo['metatitle']		=	"List Category - ".WEBSITENAME;
									$seo['metadescription']	=	"List Category - ".WEBSITENAME;
									$data['data']['seo'] 	= 	$seo;
									$data['layout'] 		= 	$this->frontLayout($data);
									$this->load->view("admin/catlist.tpl" ,$data );
				}
			
			public function newslist()
				{
					$data = array();
					$seo  = array();
						$checklogin	=	$this->InformationModel->checkloggedin();
							if(!$checklogin)
								{
									redirect("information?token=invalid");	
								}
								
								$page = $this->input->get("page");
								
								$data['srhkeyword'] 	=	$this->input->post("srhkeyword");
								$data['srhcategory']	=	$this->input->post("srhcategory");
								
									if(empty($page)) { $page=1; }
									
						$newsid 					=	$this->input->get('newsid');
						if(!empty($newsid)){
							$value	=	$this->InformationModel->getnews($newsid);
									$value	=	$value[0];	
									$data['newsid']					=	$newsid;
									$data['news_title']				=	$value['title'];
									$data['news_alias']				=	$value['alias'];
									$data['news_description']		=	$value['description'];
									$data['news_meta_title']		=	$value['metatitle'];
									$data['news_meta_description']	=	$value['metadescription'];
									$data['news_keyword']			=	$value['metakeyword'];
									$data['news_status']			=	$value['status'];
									$data['news_featured']			=	$value['key_feature'];
									$data['newsimages']				=   $value['images'];
									$data['newscatagories']			=   $value['catagories'];
									$data['address']				=	$value['address'];  

						}else{ 
									$data['newsid']					=	0;
									$data['news_title']				=	"";
									$data['news_alias']				=	"";
									$data['news_description']		=	"";
									$data['news_meta_title']		=	"";
									$data['news_meta_description']	=	"";
									$data['news_keyword']			=	"";
									$data['news_status']			=	0;
									$data['news_featured']			=	0; 
									$data['newsimages']				=   "";
									$data['newscatagories']			=   "";
									$data['address']				=	"";
						}		
						$data['addupmessage']		=	$this->InformationModel->editnews();
						$data['uploadflatdata']		=	$this->InformationModel->uploadflatdata(); 
				$search	=	array();
					$search['keyword'] 	= $data['srhkeyword'];
					$search['category'] = $data['srhcategory'];
				$data['news']			=	$this->InformationModel->getnews(0,500,$page,$search);


				$data['categories']		=	$this->InformationModel->getcategories(0,300,$page);
				$data['allcategories']		=	$this->CommonModel->getheadcategories(0);
						$data['checklogin']		=	$checklogin;
						$seo['url']				=	site_url("admin/news");
						$seo['title']			=	"List Business - ".WEBSITENAME;
						$seo['metatitle']		=	"List Business - ".WEBSITENAME;
						$seo['metadescription']	=	"List Business - ".WEBSITENAME;
							$data['data']['seo'] = $seo;
							$data['layout'] = $this->frontLayout($data);
							$this->load->view("admin/newslist.tpl" ,$data );
				}
				
			public function logout()  
				{
					$this->session->sess_destroy();
					header("Location: ".base_url());
				}

		}		
?>

