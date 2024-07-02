<?php

	Class CommonModel extends CI_Model
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
				
			
			public function getcategories($catid=0,$limit=10,$page=1,$search=0,$select="*")
				{
						if($select)
							{
								$this->db->select($select);
							}
						$this->db->from('categroy');
						
							
						
							if(!empty($search))
								{
									if(!empty($search['alias']))
										{
											$this->db->where("categroy.alias",$search['alias']);
										}
									if(!empty($search['featured']))
										{
											$this->db->where("categroy.featured",$search['featured']);
										}
								}
									if(empty($page)) $page=1;
										$page--;
											if($page<0) { $page=0; }
												$skip = $page*10;
													$this->db->limit($limit,$skip);
								if(!empty($catid))
									{
										$this->db->where("cat_id",$catid);
									}
										$this->db->where("status","1");
											$query	=	$this->db->get();
												$result =	$query->result_array();
										// echo $this->db->last_query();
					return $result; 
				}
				
			public function getheadcategories($catid=0)
				{
					$data = array();
					$catresult = array();
						$this->db->from('categroy');
							$this->db->where("subcategory",$catid);
								$this->db->where("status","1");
									$query	=	$this->db->get();
										$result =	$query->result_array();
						//print_r($result);
							if(!empty($result))
								{
									foreach($result as $single)
										{
											$index= $single['cat_id'];
											$catresult[$index]['value'] = $single;
											$catresult[$index]['sub'] 	= $this->getheadcategories($index);
										}
								}
								if(!empty($result))
								{
									$data['status'] = 1; 
									$data['message'] = "Category List"; 
									$data['data'] = $result; 
								}else{
									$data['status'] = 1; 
									$data['message'] = "Category List"; 
									$data['data'] = array(); 
								}									
									return $data; 
				}
				 
			public function getnews($newsid=0,$limit=10,$page=1,$search=0,$orderby=0)
				{
							if($newsid)
								{						
									$this->db->select("news.*,`categroy`.`cat_title`,admin.username");
									$this->db->from('news');
									
								} else {
									$this->db->select("news.*,`categroy`.`cat_title`,`news_images`.`url`,admin.username");
									$this->db->from('news');
									$this->db->join('news_images', 'news_images.news_id = news.Id', 'left');
									$this->db->group_by('Id'); 									
								}
									$this->db->join('news_cat', 'news_cat.news_id = news.Id', 'inner');
									$this->db->join('categroy', ' `categroy`.`cat_id` = news_cat.cat_id', 'inner');
									$this->db->join('admin', ' `admin`.`userid` = news.writerid', 'inner');
						
							if(!empty($orderby))
								{
									foreach($orderby as $ind=>$val)
										{
											$this->db->order_by($ind, $val, "DESC");
										}
								}
						
								if(!empty($search))
									{
											if(!empty($search['alias']))
												{
													$this->db->where("categroy.alias",$search['alias']);
												}
											if(!empty($search['feature']))
												{
													$this->db->where("news.key_feature",$search['feature']);
												}
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
													$this->db->group_by('news.hits');
												}
												$where = "$keywordsort AND $categorysort";
										
										$this->db->where($where);
									}
						
							$page--;
								if($page<0) { $page=0; }
							$skip = $page*$limit;
							$this->db->limit($limit,$skip);
								if($newsid)
									{
										$this->db->where("news.id",$newsid);
									}
										$this->db->where("news.status","1");
										$this->db->where("news.newsdate <=",date("Y-m-d H:i:s")); // 2018-02-14 14:30:00
										$query	=	$this->db->get();
										$result =	$query->result_array();
										// echo $this->db->last_query();
										
										
								if($newsid)
									{
										$this->db->from('news_images');
										$this->db->where("news_id",$newsid);
											$imgresult	=	$this->db->get();
												$imgresult =	$imgresult->result_array();
													$result[0]['images']		=	$imgresult;	
										$this->db->from('news_cat');
										$this->db->join('categroy', ' `categroy`.`cat_id` = news_cat.cat_id', 'inner');
										$this->db->where("news_id",$newsid);
											$catresult	=	$this->db->get();
												$catresult =	$catresult->result_array();	
													$result[0]['catagories']	=	$catresult;
									}
										
														// echo "##".$this->db->last_query()."##";
										//print_r($result);
					return $result; 
				}
				
			
			
			public function selectticket($news_id)
			{
					$this->db->select("*");
					$this->db->from('tbl_ticket');
					$this->db->where('news_id',$news_id);
					$query	=	$this->db->get();
					$result =	$query->result_array();
					return $result;
			} 
			
			public function countgetnews($newsid=0,$limit=10,$page=1,$search=0,$orderby=0) 
				{
							
									$this->db->select("news.*,`categroy`.`cat_title`,`news_images`.`url`,admin.username");
									$this->db->from('news');
									$this->db->join('news_images', 'news_images.news_id = news.Id', 'left');
									$this->db->group_by('news.Id'); 									
								
									$this->db->join('news_cat', 'news_cat.news_id = news.Id', 'inner');
									$this->db->join('categroy', ' `categroy`.`cat_id` = news_cat.cat_id', 'inner');
									$this->db->join('admin', ' `admin`.`userid` = news.writerid', 'inner');
						
								if(!empty($search))
									{
											if(!empty($search['alias']))
												{
													$this->db->where("categroy.alias",$search['alias']);
												}
											if(!empty($search['feature']))
												{
													$this->db->where("news.key_feature",$search['feature']);
												}
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
							$skip = $page*$limit;
						//	$this->db->limit($limit,$skip);
								
										$this->db->where("news.status","1");
										$this->db->where("news.newsdate <=",date("Y-m-d H:i:s")); // 2018-02-14 14:30:00
										$query	=	$this->db->get();
										$result =	$query->num_rows();
					return ($result); 
				}	
				
		}

?>