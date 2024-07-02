<?php 


	
	function getyoutubeid($url)
		{
			preg_match("/^(?:http(?:s)?:\/\/)?(?:www\.)?(?:m\.)?(?:youtu\.be\/|youtube\.com\/(?:(?:watch)?\?(?:.*&)?v(?:i)?=|(?:embed|v|vi|user)\/))([^\?&\"'>]+)/", $url, $matches);
				return isset($matches[1])?$matches[1]:"";
				
		}
	

	/* function langIn($msg=null)
		{
			$obj = &get_instance();
		
				if(isset($_COOKIE['language']))
					{
						$obj->lang->load($my_lang , $my_lang);
					} else {
						$obj->lang->load('english' , 'english');	
					}
						$newlang  = $obj->lang->line($msg);			
			return $newlang ;
		} */
		
		 function file_get_contents_curl($url) 
		{
		  $ch = curl_init(); 
			curl_setopt($ch, CURLOPT_URL, $url); 
			  curl_setopt($ch, CURLOPT_HEADER, 0); 
				curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1');
					// for cookies
					  $amzcookie = "cookie.record";
					  // echo "***"; echo $amzcookie; echo "***";
						curl_setopt($ch, CURLOPT_COOKIESESSION, 1);
						  curl_setopt($ch, CURLOPT_COOKIEJAR, FCPATH.$amzcookie);
							curl_setopt($ch, CURLOPT_COOKIEFILE, FCPATH.$amzcookie);
					// for cookies
			  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
				curl_setopt($ch, CURLOPT_HTTPPROXYTUNNEL, 1);
				  $data = curl_exec($ch);
					curl_close($ch);
			return $data;
	   }
				function get_client_ip()
					{
						$ipaddress = '';
							if (isset($_SERVER['HTTP_CLIENT_IP']))
								$ipaddress = $_SERVER['HTTP_CLIENT_IP'];
							else if(isset($_SERVER['HTTP_X_FORWARDED_FOR']))
								$ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
							else if(isset($_SERVER['HTTP_X_FORWARDED']))
								$ipaddress = $_SERVER['HTTP_X_FORWARDED'];
							else if(isset($_SERVER['HTTP_FORWARDED_FOR']))
								$ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
							else if(isset($_SERVER['HTTP_FORWARDED']))
								$ipaddress = $_SERVER['HTTP_FORWARDED'];
							else if(isset($_SERVER['REMOTE_ADDR']))
								$ipaddress = $_SERVER['REMOTE_ADDR'];
							else
								$ipaddress = 'UNKNOWN';
							return $ipaddress;
					}
	function limit_words($string, $word_limit)
	{
		$words = explode(" ",$string);
		return implode(" ", array_splice($words, 0, $word_limit));
	}


	function gettime4db()
		{
			return date('Y-m-d h:i:s'); 	
		}
		
	function showtime4db($date)
		{
			if(empty($date)) $date = date('Y-m-d h:i:s'); 	
				$date = strtotime($date);
					return date("d M, Y (D)",$date);
		}
		
	function isselected($value1,$value2)
		{
			if($value2==$value1)
				{
					return "selected='selected'";	
				}
		}
	function ischecked($value1,$value2)
		{
			if($value2==$value1)
				{
					echo "checked='checked'";	
				}
		}
	function getRatingByProductId($productId) 
	{
				 $ci=& get_instance();
				 $ci->load->database();
				 $ci->db->select("SUM(vote) as vote, COUNT(vote) as count");
				 $ci->db->from('rating');
				 $ci->db->where("rating.newsid",$productId);
				$query =	$ci->db->get();
			$resultSet =	$query->result_array();
			  if($resultSet[0]['count']>0) {
				return ($resultSet[0]['vote']/$resultSet[0]['count']);
			  } else {
				return 0;
			  }
	
			}	
		
	function sendpushnotifacation($title,$message)
		{
			//return $response = 1;
			$ci= &get_instance();
			$sql = "SELECT `fb_token` FROM provider ";
			$query = $ci->db->query($sql);
			$row = $query->result_array();
			if(!empty($row))
			{
			foreach($row as $single)
			  {
				$sound = 'default';
				$fb_token = $single['fb_token'];
				$notification = "DEMO Test";
				$url = "https://fcm.googleapis.com/fcm/send";
				$serverKey = 'AAAAPGtTN18:APA91bFi1cc8LMpANb3T4aJItC9wtoxI43aNmzfqfzmYrkbqcngwtNR8RpNEmirhR-dk2nZlzEvkGMUN_YTXBcBUFsQBqTB2sXCPnCgLLXAyeJQrnqA73Ojl64QP4AzIdZqet5fyRg5W';
				$notification = array('title' =>$title , 'body' => $message, 'sound' => $sound, 'badge' => '1');
				$value1 = array('content_available' =>1); 
				$arrayToSend = array('to' => $fb_token,"content_available"=> true,'data' => $notification,'priority'=>'high');
				$json = json_encode($arrayToSend);  
				$headers = array();
				$headers[] = 'Content-Type: application/json';
				$headers[] = 'Authorization: key='. $serverKey;
				$ch = curl_init();
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_URL, $url);
				curl_setopt($ch, CURLOPT_CUSTOMREQUEST,"POST");
				curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
				curl_setopt($ch, CURLOPT_HTTPHEADER,$headers);
				$response = curl_exec($ch);
				//return $response;
			  }
			}
				
			else{
				return 0;
			}
			
		} 			
		
		
?>