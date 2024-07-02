<?php

	Class InformationModel extends CI_Model
		{
	
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
			
			public function getdataoftable($table)
				{
					$this->db->select('*');
						$this->db->from($table);
							$query	=	$this->db->get();
								return $result =	$query->result_array();
				}
				
			public function getdataoftablewhereclose($table,$column,$id)
				{
						$this->db->select('*');
						$this->db->where($column,$id);
						$this->db->from($table);
							$query	=	$this->db->get();
								return $result =	$query->result();
				}
					
			public function reviewlist()
			{
				$this->db->select("rating.*,`news`.`title`,`news`.`alias`");
				$this->db->join('news', 'rating.newsid = news.Id', 'left');
				$this->db->from('rating');
				$query	=	$this->db->get();
				return $result =	$query->result_array();
			}
			
			public function maxhitsnews()
			{
			//	SELECT `hits` FROM `news` order by `hits` DESC LIMIT 0,3
				$this->db->select("news.*,`news_images`.`url`");
				$this->db->join('news_images', 'news_images.news_id = news.Id', 'left');
						$this->db->order_by('news.hits','DESC');
						$this->db->group_by('news.hits');
						$this->db->where('news.status','1');
						$this->db->where('news.key_feature','1');
						$this->db->from('news');
						$this->db->limit(6,0); 
						$query	=	$this->db->get();
								return $result =	$query->result();
			}
			
			public function newshits($newsid)
			{
				$selectnewshits = $this->getdataoftablewhereclose('news','Id',$newsid);
				$hits 			= $selectnewshits[0]->hits;
				$totalhits 		= $hits+1;
				$uarray = array(); 
				$uarray['hits'] =	$totalhits;
				$this->db->where("Id",$newsid);
				$this->db->update("news",$uarray);
			}
			
			public function editsitepage($pageid)
			{
					$pageid 				=	$this->checkpostinput('pageid');
					$title 					=	$this->checkpostinput('title');
					$metatitle 				=	$this->checkpostinput('metatitle');
					$metadescription 		=	$this->checkpostinput('metadescription');
					$description			=	$this->checkpostinput('description');
					if(!empty($title) && !empty($description))
							{
								$uarray = array();
									$uarray['title']			=	$title;
									$uarray['description'] 		=	$description;
									$uarray['metatitle'] 		=	$metatitle;
									$uarray['metadescription'] 	=	$metadescription;
									$uarray['added'] 			=	date("Y-m-d H:i:s");
										if(!empty($pageid))
											{
												// update condition
													$this->db->where("id",$pageid);
													$this->db->update("pages",$uarray);
														return "<div class='alert alert-success lead'><b>Success!</b> $title has been updated.</div>"; 
												// update condition
											}
							}					
			}
			
			
			public function transaction_list()
			{
				        $this->db->select("tbl_payment_gateway.*,`tbl_ticket`.*,`news`.title");
				        $this->db->join('tbl_ticket', 'tbl_ticket.ticket_id = tbl_payment_gateway.ticket_id', 'left');
						$this->db->join('news', 'news.id = tbl_payment_gateway.news_id', 'left');
						$this->db->from('tbl_payment_gateway');
						
						$query	=	$this->db->get();
						return $result =	$query->result_array();
			}
			
			//101//
			public function tickets_list()
			{
				        $this->db->select("tbl_payment_gateway.*,`tbl_ticket`.*");
				        $this->db->join('tbl_ticket', 'tbl_ticket.ticket_id = tbl_payment_gateway.ticket_id', 'left');
						$this->db->from('tbl_payment_gateway');
						
						$query	=	$this->db->get();
						return $result =	$query->result_array();
			}
			//101//
			public function sendafriend()
			{
					$senderemail 			=	$this->checkpostinput('senderemail');
					$receiveremail 			=	$this->checkpostinput('receiveremail');
					$messagedata			=	$this->checkpostinput('message');
					$posttitle 				=	$this->checkpostinput('posttitle');
					$posturl 				=	$this->checkpostinput('posturl');
					
					
						if (!filter_var($senderemail, FILTER_VALIDATE_EMAIL)) 
							{
								$data['status']		=	0;
								$data['message']	=	"Invalid email format";
								return json_encode($data);
							}
							
						if (!filter_var($receiveremail, FILTER_VALIDATE_EMAIL)) 
							{
								$data['status']		=	0;
								$data['message']	=	"Invalid email format";
								return json_encode($data);
							}
					if(!empty($senderemail) && !empty($receiveremail)&& !empty($messagedata))
							{
													$to = $receiveremail;
													$subject = "Tourism Post";

													// Always set content-type when sending HTML email
														$headers = "MIME-Version: 1.0" . "\r\n";
														$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
														$headers .= 'From: <'.$senderemail.'>' . "\r\n";
													
														$loginlink	=	base_url(); 
														$message = "
																			Hi $receiveremail,
																			<br/>
																			<br/>
																			<div style='line-height: 30px;'>
																			 $messagedata, <br/><br/>
																			 <b>Post Title  :</b> $posttitle . <br/>
																			 Please click on this button <a style='padding: 5px 10px; color: #f5f5f5; font-weight: bold; font-size: 18px; background: #3498db; margin: 10px; display: block; text-decoration: none; max-width: 90px;' href='$posturl' target='_blank'>View Post</a> <br/>
																			 <b>Friend Email:</b> <a href='mailto:$senderemail'>$senderemail</a> 
																			 </div> 
																			<br/>
																			Regards,
																			<br/><br/>
																			Tourism Team's
																			<br/>
																		";
														$emailtheme = file_get_contents_curl(base_url()."assets/email.theme");
														$message = str_replace("{{emailcontent}}",$message,$emailtheme); 
														
					 
								 if (mail($to,$subject,$message,$headers)) { 
								//echo "message sent successfully";
								    $uarray = array();
									$uarray['senderemail']		=	$senderemail;
									$uarray['receiveremail'] 	=	$receiveremail;
									$uarray['message'] 			=	$message;
									
												
													$this->db->insert("emailsent",$uarray);
														return "<div class='alert alert-success lead'><b>Success!</b> $receiveremail has been Created.</div>"; 
												// create condition
											}
							}					
			}
			
			
			public function uploadflatdata()
			{
				if(isset($_POST['submitcsv']))	
				{					
					$csv = array();

					// check there are no errors
					if($_FILES['csv']['error'] == 0){
						$name = $_FILES['csv']['name'];
						$ext = explode('.', $_FILES['csv']['name']);
						// print_r($ext[1]);
						// echo $ext = strtolower(end(explode('.', $_FILES['csv']['name'])));
						// exit();
						$type = $_FILES['csv']['type'];
						$tmpName = $_FILES['csv']['tmp_name'];
 
						// check the file is a csv
						if($ext[1] == 'csv'){
							if(($handle = fopen($tmpName, 'r')) !== FALSE) {
								// necessary if a large csv file
								set_time_limit(0);

								$row = 0;

								while(($data = fgetcsv($handle, 1000, ',')) !== FALSE) {
									// number of fields in the csv
									$col_count = count($data);

									// get the values from the csv
									$csv[$row]['title'] 		  = $data[0];
									$csv[$row]['alias'] 		  = $data[1];
									$csv[$row]['metatitle'] 	  = $data[2];
									$csv[$row]['metadescription'] = $data[3];
									$csv[$row]['metakeyword']	  = $data[4];
									$csv[$row]['catname'] 	  	  = $data[5];
									$csv[$row]['description'] 	  = $data[6]; 
 
									// inc the row
									$row++;
								} 
								$token			=  $this->session->userdata('token');
								$token			=  base64_decode($token);
								 
								$run = 0; 
								foreach($csv as $single){
										$run++;
								if($run!="1")
								{
								$catname = $single['catname'];
								$resu 	  = $this->getdataoftablewhereclose('categroy','cat_title',$catname);
								if(!empty($resu)){
								$cat_title = $resu[0]->cat_title;	
								$cat_id    = $resu[0]->cat_id;	
								$insertdata['writerid']			=	$token;
								$insertdata['title']			=	$single['title']; 
								$insertdata['alias']			=	$single['alias'];
								$insertdata['metatitle']		=	$single['metatitle'];
								$insertdata['metadescription']	=	$single['metadescription'];
								$insertdata['metakeyword']		=	$single['keyword'];
								$insertdata['description']		=	$single['description'];
								$insertdata['status']			=	1;
								$insertdata['key_feature']		=	1;
								$insertdata['added'] 			=	gettime4db();
											$this->db->insert("news",$insertdata); 
											$newsid 				= 	$this->db->insert_id();
											$uarray1['news_id']		=	$newsid;
											$uarray1['cat_id']		=	$cat_id;
											$this->db->insert("news_cat",$uarray1);
											$data['refresh']	=	1;
											$data['status']		=	1;
											$data['message']	= 	"Upload CSV Data Insert Succesfully!!!"; 
								}else{
										$data['refresh']	=	0;
										$data['status']		=	0;
										$data['message']	=	"This category is not listed in the database. Please add this category $catname to proceed further.";    
									 }
								  }
								}
							}
							return $data;
							fclose($handle);
							}
						}else{
								$data['refresh']	=	0;
								$data['status']		=	0;
								$data['message']	= 	"Opps! Your File IS Not Correctly, Only Upload Csv Sample Format File!!!";
								return $data;
								
						}
					}
				
				}	 
			
			
			public function updatesitedetails()
			{
					$siteid 				=	$this->checkpostinput('siteid');
					$title 					=	$this->checkpostinput('title');
					$description			=	$this->checkpostinput('description');
					$keyword 				=	$this->checkpostinput('keyword');
					$logo 					=	$this->checkpostinput('logo');
					$portal_name 					=	$this->checkpostinput('portal_name');
					$address 					=	$this->checkpostinput('address');
					$contact					=	$this->checkpostinput('contact');
					$google_url					=	$this->checkpostinput('google_url');
					$fb_url					=	$this->checkpostinput('fb_url');
					$twit_url					=	$this->checkpostinput('twit_url');
					$youtube_url				=	$this->checkpostinput('youtube_url');
					$email					=	$this->checkpostinput('email');

					$header_color					=	$this->checkpostinput('header_color');
					$footer_color					=	$this->checkpostinput('footer_color');




					
					if(!empty($title) && !empty($description))
							{
								$uarray = array();
									$uarray['title']			=	$title;
									$uarray['description'] 		=	$description;
									$uarray['keyword'] 			=	$keyword;
									if(!empty($logo))
									$uarray['logo'] 			=	$logo;
								$uarray['portal_name']			=	$portal_name;
								$uarray['address']			=	$address;
								$uarray['contact']			=	$contact;
								$uarray['email']			=	$email;
																$uarray['google_url']			=	$google_url;
								$uarray['fb_url']			=	$fb_url;
								$uarray['twit_url']			=	$twit_url;
								$uarray['youtube_url']			=	$youtube_url;

									$uarray['header_color'] 		=	$header_color;
									$uarray['footer_color'] 			=	$footer_color;
									if(!empty($sub_logo))
									$uarray['added'] 			=	date("Y-m-d H:i:s");
										if(!empty($siteid))
											{
												// update condition
													$this->db->where("id",$siteid);
													$this->db->update("sitedetails",$uarray);
														return "<div class='alert alert-success lead'><b>Success!</b> $title has been updated.</div>"; 
												// update condition
											}
							}					
			}
			
			
		public function editcategory()
				{		
					$catid 					=	$this->checkpostinput('catid');
					$cat_title 				=	$this->checkpostinput('cat_title');
					$cat_description		=	$this->checkpostinput('cat_description');
					$cat_status 			=	$this->checkpostinput('cat_status');
					$newsimages 			=   $this->checkpostinput('allimage');
					 
					if(isset($_POST['subcategory'])) 
						{
								$subcategory			=	json_encode($_POST['subcategory']);
						 }else{
								$subcategory			=	'0';
						 }			
							
						    			
						if(!empty($cat_title))
							{
								$uarray = array();
									$uarray['cat_title']		=	$cat_title;
									$uarray['description'] 		=	$cat_description;
									$uarray['subcategory']  	=	$subcategory;
									$uarray['status'] 			=	$cat_status;
									$uarray['newsimages'] 		=	$newsimages;
									$uarray['added'] 			=	date("Y-m-d H:i:s");
										if(!empty($catid))
											{
												// update condition
													$this->db->where("cat_id",$catid);
													$this->db->update("categroy",$uarray);
														return "<div class='alert alert-success lead'><b>Success!</b> $cat_title has been updated.</div>"; 
												// update condition
											} else {
												// insert condition
													$this->db->insert("categroy",$uarray);
													return "<div class='alert alert-success lead'><b>Success!</b> $cat_title has been created.</div>";
												// insert condition
											}
							}
					
					return "";
				}
				
			public function editnews()
				{	
					$returnmsg = "";
					$writerid = $this->session->userdata("token");
					
						if(!empty($writerid))
							{
								$writerid = base64_decode($writerid);
							} else {
								$writerid = 0;
							}
				
					$newsid 					=	$this->checkpostinput('newsid');
					$news_title 				=	$this->checkpostinput('news_title');
					$news_alias 				=	$this->checkpostinput('news_alias');
					$news_description			=	$this->checkpostinput('news_description');
					$news_meta_title 			=	$this->checkpostinput('news_meta_title');
					$news_keyword 				=	$this->checkpostinput('news_keyword');
					$news_meta_description		=	$this->checkpostinput('news_meta_description');
					$news_status 				=	$this->checkpostinput('news_status');
					$key_feature                =   $this->checkpostinput('key_feature');
					$newsdate                	=   $this->checkpostinput('newsdate'); 
					$newstime                	=   $this->checkpostinput('newstime');
					$newsimages 				=   $this->checkpostinput('allimage');
					$categories					=	$this->input->post('my-select');
					$address					=   $this->checkpostinput('address');		
				
					 
						if(!empty($newsdate) && !empty($newstime))
							{
								$newsdateis = "$newsdate $newstime";
							}
						
						if(!empty($news_title) && !empty($news_alias))
							{
									$uarray = array();
									$uarray['title']			=	$news_title;
									$uarray['writerid']			=	$writerid;
									$uarray['alias'] 			=	$news_alias;
									$uarray['description'] 		=	$news_description;
									$uarray['metatitle'] 		=	$news_meta_title;
									$uarray['metadescription'] 	=	$news_meta_description;
									$uarray['metakeyword']	 	=	$news_keyword;  
									$uarray['status'] 			=	$news_status;
									$uarray['address']			=	$address;
										if(!empty($newsdateis))
											{
												$uarray['newsdate']  =	$newsdateis;
											} else {
												$uarray1['newsdate'] =	date("Y-m-d H:i:s");
											}
																					
									
									$uarray['key_feature']		=   $key_feature;
									$uarray['added'] 			=	date("Y-m-d H:i:s");
									
									
										if(!empty($newsid))
											{
												// update condition
													$this->db->where("Id",$newsid);
													$this->db->update("news",$uarray);
													$uarray1['news_id']	 =	$newsid;
														$returnmsg = "<div class='alert alert-success lead'><b>Success!</b> $news_title has been updated.</div>"; 
												// update condition
											} else { 
												// insert condition
													$this->db->insert("news",$uarray);
													$newsid = $this->db->insert_id();
													$uarray1['news_id']	 =	$newsid;
														$returnmsg =  "<div class='alert alert-success lead'><b>Success!</b> $news_title has been created.</div>";
												// insert condition
												 //coded by tanima
												$ticket_title1 = count($this->input->post('ticket_title')); 
												//print_r($ticket_title);
												   for($i=0;$i<$ticket_title1;$i++)
												   {  
														$ticket_title                	   =   $_POST['ticket_title'][$i];
														$ticket_quantity 				   =   $_POST['ticket_quantity'][$i];
														$ticket_description				   =	$_POST['ticket_description'][$i];
														$ticket_price					    =   $_POST['ticket_price'][$i];		
															//
														// Insert ticket
														$uarrayticket['news_id'] 		    =	$newsid;
														$uarrayticket['ticket_title'] 		=	$ticket_title;
														$uarrayticket['ticket_quantity'] 	=	$ticket_quantity;
														$uarrayticket['ticket_description'] =	$ticket_description;
														$uarrayticket['ticket_price'] 		=	$ticket_price;
														
														$this->db->insert("tbl_ticket",$uarrayticket);
												   }
														//
													//ends here
												}
									
									 if(!empty($newsimages))
										{
											$imageis = explode(",", $newsimages);
												if(!empty($imageis))
													{
														$this->db->where('news_id', $newsid);
														$this->db->delete('news_images');
														foreach($imageis as $sinimg)
															{
																if(!empty($sinimg))
																	{
																		$uarrayimg = array();
																		$uarrayimg['news_id'] 		=	$newsid;
																		$uarrayimg['url'] 			=	$sinimg;
																		$uarrayimg['added'] 		=	date("Y-m-d H:i:s");
																		$uarrayimg['featured'] 		=	0;
																			$this->db->insert("news_images",$uarrayimg);
																	}
															}
													}
										}
										
									
									if(!empty($categories))
										{
											$this->db->where('news_id', $newsid);
												$this->db->delete('news_cat');
											foreach($categories as $sincat)
													{
														$uarraycate = array();
														$uarraycate['news_id']  	=  $newsid;
														$uarraycate['cat_id']		=	$sincat;
															$this->db->insert("news_cat",$uarraycate);
													}
										}
							}
					return $returnmsg;
			}
			public function getcategories($catid=0,$limit=10,$page=1,$search=0)
				{
					
					$this->db->select("*");
						$this->db->from('categroy');
						if(!empty($search))
									{
										if(!empty($search['keyword']))
											{
												$keyword = strtolower($search['keyword']);
												$srhnewskeyword	=	"
																		(
																			categroy.cat_title like '%$keyword%'
																			OR 
																			categroy.description  like '%$keyword%'
																			OR
																			categroy.metatitle  like '%$keyword%'
																			OR
																			categroy.metadescription like '%$keyword%'
																		)
																	";
													$this->db->where($srhnewskeyword);
											} 
									}
							$page--;
								if($page<0) { $page=0; }
							$skip = $page*10;
							
							$this->db->limit($limit,$skip);
								if(!empty($catid))
									{
										$this->db->where("cat_id",$catid);
									}
										$query	=	$this->db->get();
										$result =	$query->result_array();
										// echo $this->db->last_query();
					return $result; 
				}	
				
				public function getnews($newsid=0,$limit=10,$page=1,$search=0)
				{
					
					$this->db->select("news.*,`categroy`.`cat_title`");
						$this->db->from('news');
						//$this->db->join('news_images', 'news_images.news_id = news.Id', 'left');
						$this->db->join('news_cat', 'news_cat.news_id = news.Id', 'inner');
						$this->db->join('categroy', ' `categroy`.`cat_id` = news_cat.cat_id', 'inner');
						
								if(!empty($search))
									{
											if(!empty($search['keyword']))
												{
													$keyword = strtolower($search['keyword']);
													$keywordsort	=	"
															(
															news.title like '%$keyword%'
															OR 
															news.description  like '%$keyword%'
															OR
															news.metatitle  like '%$keyword%'
															OR
															news.metadescription like '%$keyword%'
															)
																		";
												} else {
													$keywordsort = 1;
												}
												
											if(!empty($search['category']))
												{
													$categorysort = "news_cat.cat_id = '".$search['category']."'";
												} else {
													$categorysort = 1;
												}
												$where = "$keywordsort AND $categorysort";
										
										$this->db->where($where);
									}
						
							$page--;
								if($page<0) { $page=0; }
							$skip = $page*10;
							$this->db->limit($limit,$skip);
								if($newsid)
									{
										$this->db->where("id",$newsid);
									}
										$query	=	$this->db->get();
										$result =	$query->result_array();
										
										
										
								if($newsid)
									{
										$this->db->from('news_images');
										$this->db->where("news_id",$newsid);
											$imgresult	=	$this->db->get();
												$imgresult =	$imgresult->result_array();
													$result[0]['images']		=	$imgresult;	
										$this->db->from('news_cat');
										$this->db->where("news_id",$newsid);
											$catresult	=	$this->db->get();
												$catresult =	$catresult->result_array();	
													$result[0]['catagories']	=	$catresult;
									}
										
											// echo $this->db->last_query();
										
										//print_r($result);
					return $result; 
				}
			
			public function checkloggedin()
				{
					if($this->session->userdata('token') && $this->session->userdata('username') && $this->session->userdata('logintype'))
						{
							$token			=	$this->session->userdata('token');
							$username		=	$this->session->userdata('username');
							$logintype		=	$this->session->userdata('logintype');
								if(trim($logintype)=="admin")
									{
										$temp = array();
											$temp['token']		=	base64_decode($token);
											$temp['username']	=	$username;
											$temp['logintype']	=	$logintype;
										return $temp;
									} else {
										return 0;
									}
						} else {
							return 0;
						}
				}
	
		
				
		//Change password Admin Start
			public function changepassword()
				{
					$data = array();
					$data['refresh'] = 0;
					
					$token						=	$this->session->userdata('token');
					$token  					= 	base64_decode($token);
					$currentpassword	 	  	=	$this->checkpostinput('currentpassword');
					$newpassword	 	  		=	$this->checkpostinput('newpassword');
					$confirmpassword	 	  	=	$this->checkpostinput('confirmpassword');
					
					if($newpassword != $confirmpassword){
						$data['status']		=	0;
						$data['message']	=	'New Password And confirm Password Are not Match !!!';
						return json_encode($data);
						
					} elseif($currentpassword == $confirmpassword){
						
							$data['status']		=	0;
							$data['message']	=	'Old Password And New Password Are Same !!!';
							return json_encode($data);
							
					} else {
							if($currentpassword!="" && $newpassword!="" && $confirmpassword!="" && $token!="" ) 
								{
									$this->db->select('*');
									$this->db->from('admin');
									$this->db->where('userid',$token);
									$this->db->where('password',md5($currentpassword));
									$query=$this->db->get();
									$result = $query->result();
									if(!empty($result))
									{
										$values						=	array();
										$values['password']			=	md5($newpassword); 
										$this->db->where('userid', $token); 
										$this->db->where('password', md5($currentpassword)); 
										$check = $this->db->update('admin', $values);
										//$sql = $this->db->last_query();
										$data['refresh']	=	0;
										$data['status']		=	1;
										$data['message']	=	"<b>Successfully !!</b> Update Your Password!";
										$title				= "Update Your Password Succesfully.";
										return json_encode($data); 	
									}else{ 
										$data['refresh']		=	0;
										$data['status']			=	0;
										$data['message']		=	"<b>Sorry !! </b>old password does not match. We are not able to update the password";
										return json_encode($data); 	
									}
									
									 
								
							 } else {
									$data['status']		=	0;
									$data['message']	=	"Something Wents Wrong !!! ";
									return json_encode($data);
							}
					}			  
									$data['status']		=	0;
									$data['message']	=	'Something Wents Wrong !!!';
									return json_encode($data);
				}
			//Change password Admin End	
			
			
			
	
			public function dologin() 
				{	
					$data = array();
						$data['refresh'] = 0;
							$email 	   =  $this->checkpostinput('email');
							$password  =  $this->checkpostinput('password');
						
						if($email=="")
							{
								$data['status']		=	0;
								$data['message']	=	"email is not correct";
								return json_encode($data);
							}
						if($password=='')
							{
								$data['status']		=	0;
								$data['message']	=	"password is not correct";
								return json_encode($data); 
							}
						if (!filter_var($email, FILTER_VALIDATE_EMAIL)) 
							{
								$data['status']		=	0;
								$data['message']	=	"Invalid email format";
								return json_encode($data);
							}
						if(trim($email != "") && trim($password != ""))				
							{
									$password = md5($password);
									$this->db->select('`userid`,`username`,`email`,`lastlogin`');
									$this->db->from('admin');
									
									//	$where	=	
									
									$this->db->where('email',$email);
									$this->db->where('password',$password);
									$query	=	$this->db->get();
									$result =	$query->result();

								if(!empty($result))
									{
										$token 		= base64_encode($result[0]->userid); 
										$username 	= $result[0]->username;
										$logintype	= "admin";
											/* setting session data */
											$session = array(
																'token' 		=>	$token,
																'username'		=>	$username,
																'logintype' 	=>	$logintype
															);
												$this->session->set_userdata($session);
												$data['refresh']	=	1;
											/* setting session data */
										$data['status']		=	1;
										$data['message']	= 	" Login Succesfully.";
										return json_encode($data);
									} else {
										$data['status']		=	0;
										$data['message']	=	"Wrong Email or Password.";
										return json_encode($data);
									}
									
							} else {
									$data['status']		=	0;
									$data['message']	=	"Please check the entered details.";
								return json_encode($data);
							}
									$data['status']		=	0;
									$data['message']	=	"Something went Wrong.";
								return json_encode($data);
				}
				
		public function getdesciption(){
				$this->db->select('description');
				$this->db->where($id,1);
						$this->db->from('pages');
							$query	=	$this->db->get();
								return $result =	$query->result_array();
			}
			
			
			public function contactus() 
				{
						$data = array();
						$data['refresh'] = 0;
							$firstname		=  $this->checkpostinput('firstname');
							$lastname		=  $this->checkpostinput('lastname');
							$email	 	    =  $this->checkpostinput('email');
							$mobile			=  $this->checkpostinput('mobile');
							$message		=  $this->checkpostinput('messagew');
							$businesstitle	=  $this->checkpostinput('businesstitle');
							$businessurl	=  $this->checkpostinput('businessurl');
							
						if($firstname == "")
							{
								$data['status']		=	0;
								$data['message']	=	"Please Enter Your Name";
								return json_encode($data);
							}
						
						if (!preg_match("/^[a-zA-Z ]*$/",$firstname))
							{
								$data['status']		=	0;
								$data['message']	=	"Only letters and white space allowed on Name.";
								return json_encode($data);
							} 
								
						if($lastname == "")
							{
								$data['status']		=	0;
								$data['message']	=	"Please Enter Your Name";
								return json_encode($data);
							}
						
						if (!preg_match("/^[a-zA-Z ]*$/",$lastname))
							{
								$data['status']		=	0;
								$data['message']	=	"Only letters and white space allowed on Name.";
								return json_encode($data);
							} 
							
							
						if($email=="")
							{
								$data['status']		=	0;
								$data['message']	=	"Please Fill Your EmailID";
								return json_encode($data);
							}
						
						if (!filter_var($email, FILTER_VALIDATE_EMAIL)) 
							{
								$data['status']		=	0;
								$data['message']	=	"Invalid email format";
								return json_encode($data);
							}	
							
						if($mobile=="")
							{
								$data['status']		=	0;
								$data['message']	=	"Please Fill Mobile Number";
								return json_encode($data);
							}
							
						if($message=="")
							{
								$data['status']		=	0;
								$data['message']	=	"Please Fill Message";
								return json_encode($data);
							}
							
						
						if(trim($firstname) != "" && trim($lastname) != "" && trim($mobile) != "" &&  trim($email) != "" &&  trim($message))
							{
								$insertdata['firstname']		=	$firstname;
								$insertdata['lastname']			=	$lastname;
								$insertdata['email']			=	$email; 
								$insertdata['contactno']		=	$mobile;
								$insertdata['message']			=	$message;
								$insertdata['businesstitle']	=	$businesstitle;
								$insertdata['businessurl']		=	$businessurl;
								$insertdata['ip']				= 	get_client_ip(); 
								$insertdata['added'] 			=	gettime4db();
								$this->db->insert("contactus",$insertdata);
								$data['refresh']	=	1;
								$data['status']		=	1;
								$data['message']	= 	"Request Sent Succesfully!!!";
								return json_encode($data);
							}else{
								$data['refresh']	=	0;
								$data['status']		=	0;
									$data['message']	= 	"<b>Oops!</b> Something went wrong ";
								return json_encode($data);
							}
				}
			//101//
			
			public function newsletter()
			{
					$data = array();
						$data['refresh'] = 0;
							
							$sub_email	 	    =  $this->checkpostinput('sub_email');
					
					if($sub_email=="")
							{
								$data['status']		=	0;
								$data['message']	=	"Please Fill Your EmailID";
								return json_encode($data);
							}
					
						if (!filter_var($sub_email, FILTER_VALIDATE_EMAIL)) 
							{
								$data['status']		=	0;
								$data['message']	=	"Invalid email format";
								return json_encode($data);
							}
							 if( trim($sub_email) != "" )
							{
								
								$insertdata['sub_email']			=	$sub_email; 
								
								$insertdata['added'] 			=	gettime4db();
								$this->db->insert("newsletter_tbl",$insertdata);
								$data['refresh']	=	1;
								$data['status']		=	1;
								$data['message']	= 	"Subscribed Succesfully!!!";
								return json_encode($data);
							}else{
								$data['refresh']	=	0;
								$data['status']		=	0;
									$data['message']	= 	"<b>Oops!</b> Something went wrong ";
								return json_encode($data);
							}
				}		
			
			
			//101//
			public function reviewpost() 
				{
						$data = array();
						$data['refresh'] = 0;
							$newsid			=  $this->checkpostinput('newsid');
							$vote			=  $this->checkpostinput('vote');
							$review	 	    =  $this->checkpostinput('review');
							$email	 	    =  $this->checkpostinput('useremail');
							$name	 	    =  $this->checkpostinput('username');
							
						if($name == "")
							{
								$data['status']		=	0;
								$data['message']	=	"Please Fill Your Name";
								return json_encode($data);
							}
							
						if($email=="")
							{
								$data['status']		=	0;
								$data['message']	=	"Please Fill Your EmailID";
								return json_encode($data);
							}
						
						if (!filter_var($email, FILTER_VALIDATE_EMAIL)) 
							{
								$data['status']		=	0;
								$data['message']	=	"Invalid email format";
								return json_encode($data);
							}
						
						if($vote == "")
							{
								$data['status']		=	0;
								$data['message']	=	"Please atleast 2.0 rating";
								return json_encode($data);
							}
							
						if(trim($newsid) != "" && trim($vote) != "" && trim($name) != "" && trim($email) != "" )
							{
								$insertdata['newsid']			=	$newsid;
								$insertdata['vote']				=	$vote;
								$insertdata['review']			=	$review; 
								$insertdata['name']				=	$name; 
								$insertdata['email']			=	$email; 
								$insertdata['status']			=	1; 
								$insertdata['added'] 			=	gettime4db();
								$this->db->insert("rating",$insertdata);
								$data['refresh']	=	1;
								$data['status']		=	1;
								$data['message']	= 	"Review Sent Succesfully!!!";
								return json_encode($data);
							}else{
								$data['refresh']	=	0;
								$data['status']		=	0;
									$data['message']	= 	"<b>Oops!</b> Something went wrong ";
								return json_encode($data);
							}
				}
			
			
		
		}

?>