<?php
		echo	$layout['header'];
?> 
	
	<section class="post-wrapper-top jt-shadow clearfix">
		<div class="container">
			<div class="col-lg-12">
				<h2><?php echo $data['seo']['title']; ?></h2>
                <ul class="breadcrumb pull-right">
                    <li><a href="<?php echo base_url(); ?>">Dashbaord</a></li>
                    <li><?php echo $data['seo']['title']; ?></li>
                </ul>
			</div>
		</div> 
	</section><!-- end post-wrapper-top -->
	<section class="blog-wrapper ">
		<div class="container">
				<div id="content" class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
				<div class="widget">
					<div class="title"><h2>Settings</h2></div> 
      				<form role="form" class="adminchangepasswordform" method="POST" onsubmit="return adminchangepassword();">
					                    
                        <div class="form-group">
                            <label for="exampleRoomtypeinfoName">Portal Name</label>
                            <input id="invoiceaddress_id" name="invoiceaddress_id" type="hidden" value=""/>
                            <input type="text" class="form-control" id="edit_invoiceaddress_hotelname" name="edit_invoiceaddress_hotelname" value="" placeholder="Enter Portal Name">
                            <span style="color:red;" id="edit_invoiceaddress_hotelname_error" class="pdt_error_class"></span>
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleRoomtypeinfoName">Portal Logo</label>
                            <input type="file" class="form-control" id="edit_invoiceaddress_hotellogo" name="edit_invoiceaddress_hotellogo" placeholder="Enter portal Logo">
                            <span style="color:red;" id="edit_invoiceaddress_hotellogo_error" class="pdt_error_class"></span>
                        </div>
                        
                        
                        <div class="form-group">
                            <label for="exampleRoomtypeinfoName">Address</label>
                            <input type="text" class="form-control" id="edit_invoiceaddress_addressline1" name="edit_invoiceaddress_addressline1" value="" placeholder="Enter Address">
                            <span style="color:red;" id="edit_invoiceaddress_addressline1_error" class="pdt_error_class"></span>
                        </div>                    
                        <div class="form-group">
                            <label for="exampleRoomtypeinfoName">Zip Code</label>
                            <input type="number" class="form-control" id="edit_invoiceaddress_zipcode" name="edit_invoiceaddress_zipcode" value="" placeholder="Enter Zip Code">
                            <span style="color:red;" id="edit_invoiceaddress_zipcode_error" class="pdt_error_class"></span>
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleRoomtypeinfoName">City</label>
                            <input type="text" class="form-control selcity" id="edit_invoiceaddress_city" name="edit_invoiceaddress_city" value="" placeholder="Enter City">
                            <span style="color:red;" id="edit_invoiceaddress_city_error" class="pdt_error_class"></span>
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleRoomtypeinfoName">Country</label>
                            <input type="text" class="form-control selcountry" id="edit_invoiceaddress_country" name="edit_invoiceaddress_country" value="" placeholder="Enter Country">
                            <span style="color:red;" id="edit_invoiceaddress_country_error" class="pdt_error_class"></span>
                        </div>
                        
                       <!-- <div class="form-group">
                            <label for="exampleRoomtypeinfoName">Time Zone</label>
                            <select required class="form-control" id="edit_invoiceaddress_timezone" name="edit_invoiceaddress_timezone">
                              <option value="">Select Time Zone</option>
                              
                            </select>
                            <span style="color:red;" id="edit_invoiceaddress_timezone_error" class="pdt_error_class"></span>
                        </div>-->
                        
                        <!--<div class="form-group">
                            <label for="exampleRoomtypeinfoName">Google Map Location</label>
                            <input type="text" class="form-control" id="edit_invoiceaddress_googlemaplocation" name="edit_invoiceaddress_googlemaplocation" value="" placeholder="Enter Google Map Location">
                            <span style="color:red;" id="edit_invoiceaddress_googlemaplocation_error" class="pdt_error_class"></span>
                        </div>-->
                        
                        <!--<div class="form-group">
                            <label for="exampleRoomtypeinfoName">Contact Number For Booking</label>
                            <input type="number" class="form-control" id="edit_invoiceaddress_contactforbooking" name="edit_invoiceaddress_contactforbooking" value="" placeholder="Enter Contact Number For Booking">
                            <span style="color:red;" id="edit_invoiceaddress_contactforbooking_error" class="pdt_error_class"></span>
                        </div>-->
                        
                        <!-- <div class="form-group">
                            <label for="exampleRoomtypeinfoName">Contact Number For General Enquiry</label>
                            <input type="number" class="form-control" id="edit_invoiceaddress_contactforgenenquiry" name="edit_invoiceaddress_contactforgenenquiry" value="" placeholder="Enter Contact Number For General Enquiry">
                            <span style="color:red;" id="edit_invoiceaddress_contactforgenenquiry_error" class="pdt_error_class"></span>
                        </div> -->
                        
                       <div class="form-group">
                            <label for="exampleRoomtypeinfoName">Contact Number For Portal Front Desk</label>
                            <input type="number" class="form-control" id="edit_invoiceaddress_contactforhotelfrontdesk" name="edit_invoiceaddress_contactforhotelfrontdesk" value="" placeholder="Enter Contact Number For Hotel Front Desk">
                            <span style="color:red;" id="edit_invoiceaddress_contactforhotelfrontdesk_error" class="pdt_error_class"></span>
                        </div> 
                        
                        <div class="form-group">
                            <label for="exampleRoomtypeinfoName">Email-Id</label>
                            <input type="email" class="form-control" id="edit_invoiceaddress_email" name="edit_invoiceaddress_email" value="" placeholder="Enter Email-Id">
                            <span style="color:red;" id="edit_invoiceaddress_email_error" class="pdt_error_class"></span>
                        </div> 
						
                        
                                             <div class="form-group">
                                               <label>Header color</label><input style="width:100px;margin-left:120px;"type="color" name="header_color_code" value="">
                                             <br><br>
                            
                                            </div>
                                            
                                            
                                             <div class="form-group">
                                               <label>Header Bottom color</label><input style="width:100px;margin-left:70px;"type="color" name="header_bottom_code" value="">
                                             <br><br>
                            
                                            </div>
                                            
                                            
                                            
                                             <div class="form-group">
                                               <label>Header Font color</label><input style="width:100px;margin-left:89px;"type="color" name="headerfont_color_code" value="">
                                             <br><br>
                            
                                            </div>
                                            
                                            
                                              <div class="form-group">
                                                <label>Footer color</label><input style="width:100px;margin-left:127px;"type="color" name="footer_color_code" value="">
                                              <br><br>
                                        
                                            </div>
                                            
                                             
                                             <div class="form-group">
                                                <label>Footer background color</label><input style="width:100px;margin-left:51px;"type="color" name="footer_bg_color_code" value="">
                                              <br><br>
                                            
                       
                                            
                                            
                                            
                                             <div class="form-group">
                                               <label>Footer font Color</label><input style="width:100px;margin-left:103px;"type="color" name="footer_font_color" value="">
                                             <br><br>
            
                                            </div>
                                            
                                            </div>
                                            
                                            
                                            <div class="form-group">
                                                <label>Google Url</label>
												<input type="text" id="google_url" name="google_url" class="form-control"  value=''>
                                                </div>
                                            
                                            	<div class="form-group">
                                                <label>Facebook Url</label>
                                                   
                                                   <input type="text" id="fb_url" name="fb_url" class="form-control" value=''>

                                                  </div>
                                                
                                                	<div class="form-group">
                                                <label>Twitter Url</label>
												<input type="text" id="tweet_url" name="tweet_url" class="form-control"  value=''>
                                                </div>
                                                
                                                	<div class="form-group">
                                                <label>Youtube Url</label>
												<input type="text" id="youtube_url" name="youtube_url" class="form-control"  value=''>
                                                </div>
                    
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary invoiceaddupdatesave1">Update</button>
                       <!--  <input type="submit" name="submit" value="Save Changes" class="btn btn-primary"> -->
                    
				</form>	                              
				</div><!-- end widget -->
			
					
			</div><!-- end container -->
		</div><!-- end white-wrapper -->
	</section><!-- end blog-wrapper -->
   
<?php
		echo	$layout['footer'];
?>