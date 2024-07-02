<?php
		defined('BASEPATH') OR exit('No direct script access allowed');

	class Front extends MY_Controller 
		{

			
			public function __construct()
				{
					parent::__construct();
						$this->load->helper(array('form','language','url'));
						$this->load->model('CommonModel');
						$this->load->model('InformationModel');
							GLOBAL $categorydata,$featurednews ,$latestnews,$sitedetails;
								$categorydata	=	$this->CommonModel->getcategories(0,15);
								$latestnews		= 	$this->CommonModel->getnews(0,3,1,array("category"=>3),array("added"=>"DESC"));
								$sitedetails	=	$this->InformationModel->getdataoftable('sitedetails');
								$featurednews	=	$this->CommonModel->getnews(0,5,1,array("feature"=>1),array("Id"=>"DESC"));
								//print_r($featurednews);
						
							if(isset($_COOKIE['language']))
								{
									$this->lang->load($_COOKIE['language']."_landing" , $_COOKIE['language']);
								} else {
									$this->lang->load('english_landing' , 'english');
								}
								
								$this->load->library('pagination');
				}

			public function index()
				{ 
					$data = array();
					$seo  = array();
			        $fetcategorydata		=	$this->CommonModel->getcategories(0,15,1,array("featured"=>'1'),"cat_id,cat_title");
			        $allneews				=	$this->CommonModel->getnews(0,0,0);
					GLOBAL $categorydata,$featurednews ,$latestnews,$sitedetails;
					$data['sitedetails']	=	$sitedetails;
					$seo['url']				=	base_url();
					$seo['title']			=	$data['sitedetails'][0]['title'];
					$seo['metatitle']		=	strip_tags($data['sitedetails'][0]['title']);
					$seo['metakeyword']		=	strip_tags($data['sitedetails'][0]['keyword']);
					$seo['metadescription']	=	strip_tags($data['sitedetails'][0]['description']);
					$data['subcategorydata']=	$this->CommonModel->getcategories(0,100);
					$getheadcategories=	$this->CommonModel->getheadcategories(0);
						$data['getheadcategories']	=	$getheadcategories;
					$latestnews		= 	$this->CommonModel->getnews(0,12,1,array("category"=>0),array("added"=>"DESC"));	
					$data['latestnews']		= 	$latestnews;	
					$data['statesnews'] 	=	$this->CommonModel->getnews(0,10,1,array("category"=>2),array("Id"=>"DESC"));
					$data['featurednews'] 	=	$featurednews;
					$data['kuchkhashnews'] 	=	$this->CommonModel->getnews(0,5,2,array("feature"=>1),array("Id"=>"DESC"));
					$data['maxhitsnews'] 	=	$this->InformationModel->maxhitsnews();
										
					$fetcatnews = array();
						if(!empty($fetcategorydata))
								{
									foreach($fetcategorydata as $sinfetcat)
										{
											$cat_id 	=	$sinfetcat['cat_id'];
											$cat_title 	=	$sinfetcat['cat_title'];
											$fetcatnews[$cat_id]['name'] = $cat_title;
											$fetcatnews[$cat_id]['data'] = $this->CommonModel->getnews(0,10,1,array("category"=>$cat_id),array("Id"=>"DESC"));
										}
								}
											$data['fetcatnews']	=	$fetcatnews;
					$data['data']['seo']	=	$seo;
					$data['layout'] = $this->webLayout($data);
					$this->load->view("front/index.tpl" ,$data);
				}
				
			public function getdesciption(){
				$this->db->select('description');
				$this->db->where($id,1);
						$this->db->from('pages');
							$query	=	$this->db->get();
								return $result =	$query->result_array();
			}

			public function singlenews($newsid)
				{
					// echo $newsid;
					
					$data = array();
						$seo  = array();
						 
						$singlenews						=	$this->CommonModel->getnews($newsid,1,0);
						$morenews						=	$this->CommonModel->getnews(0,3,1,array("category"=>1),array("Id"=>"DESC"));
						$data['ticketdata']				=	$this->CommonModel->selectticket($newsid);
						$data['sendafriend']			=	$this->InformationModel->sendafriend();
						$data['ratingreview']			=	$this->InformationModel->getdataoftablewhereclose('rating','newsid',$newsid);
						$newshits						=	$this->InformationModel->newshits($newsid);
						$getheadcategories=	$this->CommonModel->getheadcategories(0);
						$data['getheadcategories']	=	$getheadcategories;
						$data['subcategorydata']		=	$this->CommonModel->getcategories(0,100);
						$seo['url']						=	site_url("news")."/".$singlenews[0]['alias']."/".$singlenews[0]['Id'];
						$seo['title']					=	$singlenews[0]['title'];
						$seo['metatitle']				=	$singlenews[0]['metatitle'];
						$seo['metakeyword']				=	$singlenews[0]['metakeyword'];
						$seo['metadescription']			=	$singlenews[0]['metadescription'];
						if(!empty($singlenews[0]['images'][0]['url'])){
										$seo['metaimage']= base_url('/uploads/uploads/').$singlenews[0]['images'][0]['url'];
									}else{
										$seo['metaimage'] = base_url('/uploads/uploads/tourismdefault.jpg');
									} 
						GLOBAL $categorydata,$featurednews ,$latestnews,$sitedetails;
						//101//
						$data['kuchkhashnews'] 	=	$this->CommonModel->getnews(0,5,2,array("feature"=>1),array("added"=>"DESC"));				
                       //101//
						$data['sitedetails']			=	$sitedetails;
							$data['latestnews']			= 	$latestnews;
								$data['featurednews'] 	=	$featurednews;
								$data['categorydata']	=	$categorydata;
								$data['categorynews'] 	= 	$singlenews;
								$data['morenews']		=	$morenews;
								$data['data']['seo']	=	$seo;
									$data['layout'] = $this->webLayout($data);
									$this->load->view("front/singlenews.tpl" ,$data);
				}

			public function categorynews($catalias,$page)
				{
					  $data = array();
						$seo  = array();
						
						
						 // for pagination
						 
		
								$config['base_url'] = site_url("category/$catalias/");
								
									$config['total_rows'] = 200;
										$config['per_page'] = 6;
										
							$data['srhkeyword'] 	=	$this->input->post("srhkeyword");
							$data['srhcategory']	=	$this->input->post("srhcategory");
							$keyword 	= $data['srhkeyword'];
							$category   = $data['srhcategory'];	 	
							if(!empty($keyword)){
								$categorynews	=	$this->CommonModel->getnews(0,6,$page,array("keyword"=>$keyword),array("added"=>"DESC"));
							}elseif(!empty($category)){
								$categorynews	=	$this->CommonModel->getnews(0,6,$page,array("alias"=>$category),array("added"=>"DESC"));
							}elseif((!empty($category)) && (!empty($keyword))){
								$categorynews	=	$this->CommonModel->getnews(0,6,$page,array("alias"=>$category,"keyword"=>$keyword),array("added"=>"DESC"));
							}else{
								$categorynews	=	$this->CommonModel->getnews(0,6,$page,array("alias"=>$catalias),array("added"=>"DESC"));
							}							
						$data['subcategorydata']=	$this->CommonModel->getcategories(0,100);
						$data['allcategories']	=	$this->CommonModel->getheadcategories(0);
						$getheadcategories=	$this->CommonModel->getheadcategories(0);
						$data['getheadcategories']	=	$getheadcategories;
									//	if(isset($_GET['dev']))  
											{ 
												//error_reporting(E_ALL);
												$countgetnews	=	$this->CommonModel->countgetnews(0,6,$page,array("alias"=>$catalias),array("added"=>"DESC"));
												//	echo "##<br/>##<br/>##<br/>##<br/>##<br/>##<br/><pre>";
														$config['total_rows'] = ($countgetnews); 
														$data['total_rows'] = ($countgetnews); 
												//	echo "</pre>##<br/>##<br/>##<br/>##<br/>";
											}
										
											$config['use_page_numbers'] = TRUE;
											$config['full_tag_open'] 	= 	"<ul class='pagination'>";
											$config['full_tag_close'] 	= 	'</ul>';
											$config['num_tag_open'] 	= 	'<li>';
											$config['num_tag_close'] 	= 	'</li>';
											$config['cur_tag_open'] 	= 	'<li class="active"><a>';
											$config['cur_tag_close'] 	= 	'</a></li>';
											$config['prev_tag_open'] 	= 	'<li>';
											$config['prev_tag_close'] 	= 	'</li>';
											$config['first_tag_open'] 	= 	'<li>';
											$config['first_tag_close'] 	= 	'</li>';
											$config['last_tag_open'] 	= 	'<li>';
											$config['last_tag_close'] 	= 	'</li>';
											$config['prev_link'] 		= 	'<i class="fa fa-long-arrow-left"></i>Previous Page';
											$config['prev_tag_open'] 	= 	'<li>';
											$config['prev_tag_close'] 	= 	'</li>';
											$config['next_link'] 		= 	'Next Page<i class="fa fa-long-arrow-right"></i>';
											$config['next_tag_open'] 	=	'<li>';
											$config['next_tag_close'] 	=	'</li>';
										
										
										
											$this->pagination->initialize($config);
												
												
												$data['pagination']		=	$this->pagination->create_links();
						 
						 // for pagination
						
						
						  // getcategories($catid=0,$limit=10,$page=1,$search=0,$select="*")
						
						 $fetcategorydata	=	$this->CommonModel->getcategories(0,1,1,array("alias"=>$catalias));
						 $featurednews	=	$this->CommonModel->getnews(0,5,1,array("feature"=>1),array("Id"=>"DESC"));

								// echo "<pre style='display:none;'>"; print_r($fetcategorydata); echo "</pre>";
							
						//print_r($categorynews);
						$seo['url']						=	site_url("category/$catalias");
						$seo['title']					=	$fetcategorydata[0]['cat_title'];
						$seo['metatitle']				=	$fetcategorydata[0]['metatitle'];
						$seo['metakeyword']				=	$fetcategorydata[0]['metakeyword'];
						$seo['metadescription']			=	$fetcategorydata[0]['metadescription'];
						//GLOBAL $categorydata,$sitedetails;
						GLOBAL $categorydata,$featurednews ,$latestnews,$sitedetails;
	                    $data['featurednews'] 	=	$featurednews;
						//$data['categorynews'] 	= 	$singlenews;
						$data['sitedetails']			=	$sitedetails;
						$data['categorydata']			=	$categorydata;
						$page							= 	$this->input->get("page");
        				$data['categorynews']			=	$categorynews;
        				$data['kuchkhashnews'] 	=	$this->CommonModel->getnews(0,5,2,array("feature"=>1),array("added"=>"DESC"));				
							// echo "<pre>"; print_r($categorynews); echo "</pre>";
								$data['data']['seo']	=	$seo;
									$data['layout'] = $this->webLayout($data);
									$this->load->view("front/categorynews.tpl" ,$data);
				}

			public function about()
				{
					$data = array();
					$seo  = array();
						$data['subcategorydata']	=	$this->CommonModel->getcategories(0,100);
						$value						=	$this->InformationModel->getdataoftablewhereclose('pages','id','1');
						$value1						=	$value[0];	
						$seo['url']					=	site_url("front/about");
						$seo['title']				=	$value1->title;
						$data['description']		=	$value1->description;
						$seo['metatitle']			=	$value1->metatitle;
						$seo['metakeyword']			=	$value1->metadescription;
						$seo['metadescription']		=	$value1->metadescription;
						$data['selectdata']			=	$value[0];
						GLOBAL $sitedetails;
						$data['sitedetails']	=	$sitedetails;
							$data['data']['seo'] = $seo;
							$data['layout'] = $this->webLayout($data);
					//$data['selectdata'] 	=	$this->CommonModel->getnews(0,5,2,array("feature"=>1),array("added"=>"DESC"));				

							$this->load->view("front/about.tpl" ,$data);
				}
				
			public function buynow()
				{ 
					
					if(!empty($_POST['news_id']))
					{
					$data = array();
					$data['ticket_price']                	    =   $_POST['ticket_price'];
					$data['news_id']                	        =   $_POST['news_id'];
					$data['add_ticket_quantity']                =   $_POST['add_ticket_quantity'];
					$data['new_price']                          =  $data['add_ticket_quantity']*$data['ticket_price'];
					//print_r($data['add_ticket_quantity']);
					$data['ticket_id']                	        =   $_POST['ticket_id'];
					$data['ticket_title']                	    =   $_POST['ticket_title'];
					$data['ticket_description']                 =   $_POST['ticket_description'];
					//print_r($data['ticket_description']);
				//	exit(0);
					    $seo  = array();
						$value						=	$this->InformationModel->getdataoftablewhereclose('pages','id','1');
						$value1						=	$value[0];	
						$seo['url']					=	site_url("front/about");
						$seo['title']				=	$value1->title;
						$seo['description']			=	$value1->description;
						$seo['metatitle']			=	$value1->metatitle;
						$seo['metakeyword']			=	$value1->metadescription;
						$seo['metadescription']		=	$value1->metadescription;
						$data['selectdata']			=	$value[0];
						GLOBAL $categorydata,$featurednews ,$latestnews,$sitedetails;
						$data['sitedetails']			=	$sitedetails;
							$data['latestnews']			= 	$latestnews;
								$data['featurednews'] 	=	$featurednews;
								$data['categorydata']	=	$categorydata;
								$data['sitedetails']	=	$sitedetails;
							$data['data']['seo'] = $seo;
							$data['layout'] = $this->webLayout($data);
							$this->load->view("front/buynow.tpl" ,$data);
							
				    }
				else
				{       
						
					$this->error404();
				}
			}	
		
			
			public function error404()
			{
				$seo 						= array();
				$value						=	$this->InformationModel->getdataoftablewhereclose('pages','id','1');
				$value1						=	$value[0];	
				$seo['url']					=	site_url("front/error404");
				$seo['title']				=	'error404';
				$seo['description']			=	'error404';
				$seo['metatitle']			=	'error404';
				$seo['metakeyword']			=	'error404';
				$seo['metadescription']		=	'error404';
				$data['selectdata']			=	'error404';
				GLOBAL $sitedetails;
				$data['sitedetails']		=	$sitedetails;
				$data['data']['seo'] = $seo;
				$data['layout'] = $this->webLayout($data);
				$this->load->view("front/error404.tpl");
			}
			
			public function faqs()
				{
					$data = array();
					$seo  = array();
						GLOBAL $sitedetails;
						$data['sitedetails']		=	$sitedetails;
						$data['subcategorydata']	=	$this->CommonModel->getcategories(0,100);
						$value						=	$this->InformationModel->getdataoftablewhereclose('pages','id','2');
						$value1						=	$value[0];	
						$seo['url']					=	site_url("front/faqs");
						$seo['title']				=	$value1->title;
						$data['description']		=	$value1->description;
						$seo['metatitle']			=	$value1->metatitle;
						$seo['metakeyword']			=	$value1->metadescription;
						$seo['metadescription']		=	$value1->metadescription;
						$data['selectdata']			=	$value[0];
							$data['data']['seo'] = $seo;
							$data['layout'] = $this->webLayout($data);
							$this->load->view("front/faqs.tpl" ,$data);
				}	
		
			public function terms()
				{
					$data = array();
					$seo  = array();
						GLOBAL $sitedetails;
						$data['sitedetails']		=	$sitedetails;
						$data['subcategorydata']	=	$this->CommonModel->getcategories(0,100);
						$value						=	$this->InformationModel->getdataoftablewhereclose('pages','id','3');
						$value1						=	$value[0];	
						$seo['url']					=	site_url("front/terms");
						$seo['title']				=	$value1->title;
						$data['description']		=	$value1->description;
						$seo['metatitle']			=	$value1->metatitle;
						$seo['metakeyword']			=	$value1->metadescription;
						$seo['metadescription']		=	$value1->metadescription;
						$data['selectdata']			=	$value[0];
						$data['data']['seo'] = $seo;
						$data['layout'] = $this->webLayout($data);
						$this->load->view("front/terms.tpl" ,$data);
				}	
		
			public function privacy()
				{
					$data = array();
					$seo  = array();
						GLOBAL $sitedetails;
						$data['sitedetails']		=	$sitedetails;
						$data['subcategorydata']	=	$this->CommonModel->getcategories(0,100);
						$value						=	$this->InformationModel->getdataoftablewhereclose('pages','id','4');
						$value1						=	$value[0];	
						$seo['url']					=	site_url("front/privacy");
						$seo['title']				=	$value1->title;
						$data['description']		=	$value1->description;
						$seo['metatitle']			=	$value1->metatitle;
						$seo['metakeyword']			=	$value1->metadescription;
						$seo['metadescription']		=	$value1->metadescription;
						$data['selectdata']			=	$value[0];
						$data['data']['seo'] = $seo;
						$data['layout'] = $this->webLayout($data);
						$this->load->view("front/privacy.tpl" ,$data); 
				}	
		
			
			public function reviewpost()
				{
					echo $this->InformationModel->reviewpost();
				}
				
			public function contactus()
				{
					echo $this->InformationModel->contactus();
				}
            public function newsletter()
				{
					echo $this->InformationModel->newsletter();
				}				
               
			  /* public function getdesciption()
				{
					echo $this->InformationModel->getdesciption();
				}	*/			

		}		
?>

