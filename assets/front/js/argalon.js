	
	var base_url_value = $("#base_url_value").val();
	
	console.log(" I am Called... ");
	
		//featured Active Section
			function makenewsisfeatured(selectoris){
				var newsid = $(selectoris).attr("newsid");
                	var is_featured = $(selectoris).attr("is_featured");
                	    if(is_featured=='1' || is_featured==1)
                	        {
								is_featured = "0";
								$(selectoris).attr("is_featured",is_featured);
                	            $(selectoris).html("Not Featured");
                	            $(selectoris).removeClass("btn-success");
                	            $(selectoris).addClass("btn-danger");
                	        } else {
								is_featured = "1";
								$(selectoris).attr("is_featured",is_featured);
                	            $(selectoris).html("Featured");
                	            $(selectoris).removeClass("btn-danger");
                	            $(selectoris).addClass("btn-success");
                	        }
									 $.ajax({
											type: "POST",  
											url: base_url_value+"admin/makenewsisfeatured",
											data: {
												newsid:newsid,
												is_featured:is_featured
											},
											processdata:false,
											cache: false,
											success: function (tempdata) 
												{
													console.log(tempdata);  
												}
											});
			}
			
			//News Active Section
			function makenewsisactive(selectoris){
				var newsid = $(selectoris).attr("newsid");
                	var is_active = $(selectoris).attr("is_active");
                	    if(is_active=='1' || is_active==1)
                	        {
								is_active = "0";
								$(selectoris).attr("is_active",is_active);
                	            $(selectoris).html("Inactive");
                	            $(selectoris).removeClass("btn-success");
                	            $(selectoris).addClass("btn-danger");
                	        } else {
								is_active = "1";
								$(selectoris).attr("is_active",is_active);
                	            $(selectoris).html("Active");
                	            $(selectoris).removeClass("btn-danger");
                	            $(selectoris).addClass("btn-success");
                	        }
									 $.ajax({
											type: "POST",  
											url: base_url_value+"admin/makenewsisactive",
											data: {
												newsid:newsid,
												is_active:is_active
											},
											processdata:false,
											cache: false,
											success: function (tempdata) 
												{
													console.log(tempdata);  
												}
											});
			}

            function makectgfeatured(selectoris)
                {
					alert("ghghh");
                	var newsid = $(selectoris).attr("newsid");
                	var isfeaturedval = $(selectoris).attr("featuredval");
                	    if(isfeaturedval=='1' || isfeaturedval==1)
                	        {
								isfeaturedval = 0;
								$(selectoris).attr("featuredval",isfeaturedval);
                	            $(selectoris).html("Not Featured");
                	            $(selectoris).removeClass("btn-success");
                	            $(selectoris).addClass("btn-danger");
                	        } else {
								isfeaturedval = 1;
								$(selectoris).attr("featuredval",isfeaturedval);
                	            $(selectoris).html("Featured");
                	            $(selectoris).removeClass("btn-danger");
                	            $(selectoris).addClass("btn-success");
                	        }
									 $.ajax({
											type: "POST",  
											url: realbasepath+"isfeaturedval",
											data: {
												newsid:newsid,
												featuredval:isfeaturedval
											},
											processdata:false,
											cache: false,
											success: function (tempdata) 
												{
													console.log(tempdata);  
												}
											});
                } 
				//101//
				
      
				
				
				//101//
                
            function makectgisactive(selectoris)
                {
                	var catid = $(selectoris).attr("catid");
                	var is_active = $(selectoris).attr("is_active");
                	    if(is_active=='1' || is_active==1)
                	        {
								is_active = "0";
								$(selectoris).attr("is_active",is_active);
                	            $(selectoris).html("Inactive");
                	            $(selectoris).removeClass("btn-success");
                	            $(selectoris).addClass("btn-danger");
                	        } else {
								is_active = "1";
								$(selectoris).attr("is_active",is_active);
                	            $(selectoris).html("Active");
                	            $(selectoris).removeClass("btn-danger");
                	            $(selectoris).addClass("btn-success");
                	        }
									 $.ajax({
											type: "POST",  
											url: base_url_value+"admin/makectgisactive",
											data: {
												catid:catid,
												is_active:is_active
											},
											processdata:false,
											cache: false,
											success: function (tempdata) 
												{
													console.log(tempdata);  
												}
											});
                }
      
            function reviewstatus(selectoris)
                {
                	var statusid = $(selectoris).attr("statusid");
                	var is_active = $(selectoris).attr("is_active");
                	    if(is_active=='1' || is_active==1)
                	        {
								is_active = "0";
								$(selectoris).attr("is_active",is_active);
                	            $(selectoris).html("Inactive");
                	            $(selectoris).removeClass("btn-success");
                	            $(selectoris).addClass("btn-danger");
                	        } else {
								is_active = "1";
								$(selectoris).attr("is_active",is_active);
                	            $(selectoris).html("Active");
                	            $(selectoris).removeClass("btn-danger");
                	            $(selectoris).addClass("btn-success");
                	        }
									 $.ajax({
											type: "POST",  
											url: base_url_value+"admin/reviewstatus",
											data: {
												statusid:statusid,
												is_active:is_active
											},
											processdata:false,
											cache: false,
											success: function (tempdata) 
												{
													console.log(tempdata);  
												}
											});
                }



$('.usernamecheck').keypress(function (e) {
    var value = $('.usernamecheck').val();
		value = value.replace(/[^a-z0-9\s]/gi, '-').replace(/[_\s]/g, '-');
		value = value.replace("---", '-').replace("--", '-');
		value = value.replace("---", '-').replace("--", '-');
    $('.usernamecheck').val(value);
});

$('.usernamecheck').keyup(function (e) {
    var value = $('.usernamecheck').val();
		value = value.replace(/[^a-z0-9\s]/gi, '-').replace(/[_\s]/g, '-');
		value = value.replace("---", '-').replace("--", '-');
		value = value.replace("---", '-').replace("--", '-');
    $('.usernamecheck').val(value);
});

$('.usernamecheck').keydown(function (e) {
    var value = $('.usernamecheck').val();
		value = value.replace(/[^a-z0-9\s]/gi, '-').replace(/[_\s]/g, '-');
		value = value.replace("---", '-').replace("--", '-');
		value = value.replace("---", '-').replace("--", '-');
    $('.usernamecheck').val(value);
});


	 
	function reviewpost() 
		{
			var newsid			=	$("#newsid").val();
			var vote			=	$("#vote").val();
			var review			=	$("#review").val();
			var username			=	$("#username").val();
			var useremail			=	$("#useremail").val();
					$.ajax({
						type: "POST",
						async: true,
						url: base_url_value+'front/reviewpost', 
						data: {
							'newsid'		:	newsid,
							'vote'			:	vote,
							'useremail'		:	useremail,
							'username'		:	username,
							'review'		:	review
						},
						success: function(tempdata) 
							{
								if (tempdata.trim() != '') 
									{
										var values = JSON.parse(tempdata);
										showresponse(values.status,values.message,"reviewpostmessage","reviewpostform",'1');
											if(values.refresh==1)
												{
													 window.location.reload();
												}
									} else {
										showresponse(0,"Something went wrong, Please try again later.","reviewpostmessage","reviewpostform",'1');
									}
							} 
					});
			return false;
		}
		
	 
	function contactus() 
		{
			var firstname		=	$("#firstname").val();
			var lastname		=	$("#lastname").val();
			var email			=	$("#email").val();
			var mobile			=	$("#mobile").val();
			var messagew		=   $("#messagew").val();
			var businesstitle	=	$("#businesstitle").val();
			var businessurl		=	$("#businessurl").val();

	if (mobile.length != 10)
        {
						
           showresponse(0,"<b>Error!</b> Phone number must be 10 digits.","contactusmessage","contactusform");
				$('#mobile').focus();
			return false;
        }  
			
					$.ajax({
						type: "POST",
						async: true,
						url: base_url_value+'front/contactus', 
						data: {
							'firstname'		:	firstname,
							'lastname'		:	lastname,
							'email'			:	email,
							'mobile'		:	mobile,
							'businesstitle'	:	businesstitle,
							'businessurl'	:	businessurl,
							'messagew'		:	messagew
						},
						success: function(tempdata) 
							{
								if (tempdata.trim() != '') 
									{
										var values = JSON.parse(tempdata);
										showresponse(values.status,values.message,"contactusmessage","contactusform");
											if(values.refresh==1)
												{
													 window.location.reload();
												}
									} else {
										showresponse(0,"Something went wrong, Please try again later.","contactusmessage","contactusform");
									}
							} 
					});
			return false;
		}
		
		
		function newsletter() 
		{
			var sub_email			=	$("#sub_email").val();
	
					$.ajax({
						type: "POST",
						async: true,
						url: base_url_value+'front/newsletter', 
						data: {
							'sub_email'			:	sub_email	
						},
						success: function(tempdata) 
							{
								if (tempdata.trim() != '') 
									{
										var values = JSON.parse(tempdata);
										showresponse(values.status,values.message,"newsletterform");
											if(values.refresh==1)
												{
													 window.location.reload();
												}
									} else {
										showresponse(0,"Something went wrong, Please try again later.","newsletterform");
									}
							} 
					});
			return false;
		}
		
	function loginme()
		{
			var email			=	$("#loginemail").val();
			var password		=	$("#loginpassword").val();
			var loginremember	=	0;
			
			
			if($("#loginremember").is(':checked'))
				{
					loginremember = 1;
				} else {
					loginremember = 0;
				}

			
					$.ajax({
						type: "POST",
						async: true,
						url: base_url_value+'Informationajax/dologin',
						data: {
							'password'		:	password,
							'loginremember'	:	loginremember,
							'email'			:	email
						},
						success: function(tempdata) 
							{
								if (tempdata.trim() != '') 
									{
										var values = JSON.parse(tempdata);
										showresponse(values.status,values.message,"adminmessage","adminloginform");
											if(values.refresh==1)
												{
													window.location.reload();
												}
									} else {
										showresponse(0,"Something went wrong, Please try again later.","adminmessage","adminloginform");
									}
							}
					});
			return false;
		}
		
				
	function adminchangepassword()
		{
			var currentpassword			=	$("#password").val();
			var newpassword				=	$("#newpassword").val();
			var confirmpassword			=	$("#confirmpassword").val();
					$.ajax({ 
						type: "POST",
						async: true, 
						url: base_url_value+'Informationajax/changepassword', 
						data: {
							'currentpassword' 	 		: currentpassword,
							'newpassword'		 	 	: newpassword,
							'confirmpassword'		 	: confirmpassword
						},
						success: function(tempdata) 
							{
								$(".loadingme").fadeOut("slow");
								if (tempdata.trim() != '') 
									{
										var values = JSON.parse(tempdata);
										showresponse(values.status,values.message,"adminchangepasswordpassmessage","adminchangepasswordform");
											if(values.refresh)
												{
													window.location.reload();
												}
									} else {
										showresponse(0,"Something went wrong, Please try again later.","adminchangepasswordpassmessage","adminchangepasswordform"); 
									} 
							}
					});
			return false;
		}		
		
function uploadmulptipleme()
			{
				$("fileresponse").html("<img src='"+base_url_value+"loader.gif' style='max-width:30px;' />");
					console.log("start");
						$("fileresponse").html("");
						for(i=0;i<12;i++)
							{	
								if(typeof($('.userfiles')[0].files[i]) != "undefined" && $('.userfiles')[0].files[i] !== null)
									{
										var	filesizeis	=	$('.userfiles')[0].files[i].size/1024/1024; 
										var	filenameis	=	$('.userfiles')[0].files[i].name; 
											filesizeis = Number(filesizeis);
											filesizeis = filesizeis.toFixed(2);
											if(filesizeis>10)
												{
													$("fileresponse").append("<div class='alert alert-danger'>"+filenameis+" size ("+filesizeis+" MB) is greater than 2MB, please upload file less than 10MB.</div><br/>");
												} else {
				$("fileresponse").html("<img src='"+base_url_value+"loader.gif' style='max-width:30px;' />");
						var formData = new FormData();
					formData.append( 'files' , 1);
						formData.append( 'userfile'  , $('.userfiles')[0].files[i]);
							$.ajax({
								   url 	: base_url_value+'uploads/backup_index.php?files=1',
								   type : 'POST',
								   data : formData,
								   processData: false,  // tell jQuery not to process the data
								   contentType: false,  // tell jQuery not to set contentType
								   success : function(data) 
										{
											if (data.trim() != '') 
												{
													var values = JSON.parse(data);
													
													
														if(values.response=="1" || values.response==1)
															{
																 $("fileresponse").html("<div class='alert alert-success'>"+values.message+"</div>");
																 var allimage = $(".allimage").val();
																	$(".allimage").val(allimage+values.data);
															} else {
																 $("fileresponse").html("<div class='alert alert-danger'>"+values.message+"</div>");
																 // $("fileresponse").html(values.message);
															}
													
														
												} else {
													$("fileresponse").append("<div class='alert alert-danger'>There was an error uploading your files.</div>");
												}
										}
							});
								// upload file to server 	
												}										
										
													
											
									}
							}
				console.log("stop");
			}	


				function uploadme() 
					{
						var formData = new FormData();
							formData.append( 'files' , 1);
								formData.append( 'userfile'  , jQuery('.userfiles')[0].files[0]);
									jQuery.ajax({
										   url 	: base_url_value+'uploads/index.php?files=1',
										   type : 'POST',
										   data : formData,
										   processData: false,  // tell jQuery not to process the data
										   contentType: false,  // tell jQuery not to set contentType
										   success : function(data) 
												{
													if (data.trim() != '') 
														{
															var values = JSON.parse(data);
																if(values.response) 
																	{
																		jQuery("fileresponse").html("<div class='text-success'>Images uploaded.</div>");
																		jQuery(".sweetimageval").val("uploads/uploads/"+values.data);
																	} else {
																		jQuery("fileresponse").html("<div class='text-danger'>"+values.message+"</div>");
																	}
														} else {
															jQuery("fileresponse").html("<div class='text-danger'>There was an error uploading your files.</div>");
														}
												}
									});
					}			
		