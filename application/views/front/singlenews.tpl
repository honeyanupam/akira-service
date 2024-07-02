<?php
		echo	$layout['header'];
?>

<link href="<?php echo base_url('assets/weblayout/');?>css/star-rating.min.css" media="all" rel="stylesheet" type="text/css" />
<script src="<?php echo base_url('assets/weblayout/');?>js/star-rating.min.js" type="text/javascript"></script>


<?php 
if(!empty($categorynews))
	{
		foreach($categorynews as $sining)
			{
 ?> 
 <!-- SubHeader =============================================== -->
							
    <section class="parallax_window_in" data-parallax="scroll" data-image-src="" data-natural-width="1400" data-natural-height="420">
		 <div id="sub_content_in">
            <div id="sub_content_in_left">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                            <h1><?php echo $sining['title']; ?></h1>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End sub_content_left -->
        </div>
        <!-- End sub_content -->
    </section>
	
    <!-- End section -->
    <!-- End SubHeader ============================================ -->
	<?php }} ?>
    <div class="container margin_60">
        <div class="row">
		
            <aside class="col-md-3 col-md-push-9" id="sidebar">
			<div class='title'>
				<h4 class='text-danger'><b> Favourite </b></h4>
			</title>
                <div class="theiaStickySidebar">
						<?php 
							if(!empty($featurednews)){
								foreach($featurednews as $row){
									$newsurl = base_url()."news/".$row['alias']."/".$row['Id'];
						?>
						<div class="img_wrapper">
                            <div class="ribbon">
                                <span>Popular</span>
                            </div>
									<?php 
									if(!empty($row['url'])){
										$favouriteimage = base_url('/uploads/uploads/').$row['url'];
									}else{
										$favouriteimage = base_url('/uploads/uploads/tourismdefault.jpg');
									}
									?>
						   
						   
                            <div class="img_container">
                                <a href="<?php echo $newsurl; ?>">
                                    <img src="<?php echo $favouriteimage; ?>" width="800" height="533" class="img-responsive" alt="">
                                    <div class="short_info"> 
                                        <small><?php echo showtime4db($row['newsdate']); ?></small>
                                        <h3><?php echo $row['title']; ?></h3>
                                        <div class="score_wp">
                                            <div id="score_1" class="score" data-value="7.5"></div> 
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <!-- End img_wrapper -->
                    		<?php }} ?>			
					
				</div>
				
				<div class='title'>
				<h4 class='text-danger'><b> Latest News </b></h4>
			</title>
                <div class="theiaStickySidebar">
						<?php 
							if(!empty($kuchkhashnews)){
								foreach($kuchkhashnews as $khas){
									$khasnewsurl	=	base_url()."news/".$khas['alias']."/".$khas['Id'];
						?>
						<div class="img_wrapper">
                            <div class="ribbon">
                                <span>Popular</span>
                            </div>
									<?php 
									if(!empty($khas['url'])){
										$khasimage = base_url('/uploads/uploads/').$khas['url'];
									}else{
										$khasimage = base_url('/uploads/uploads/tourismdefault.jpg');
									}
									?>
						   
						   
                            <div class="img_container">
                                <a href="<?php echo $khasnewsurl; ?>">
                                    <img src="<?php echo $khasimage; ?>" width="800" height="533" class="img-responsive" alt="">
                                    <div class="short_info"> 
                                        <small><?php echo showtime4db($khas['newsdate']); ?></small>
                                        <h3><?php echo $khas['title']; ?></h3>
                                        <div class="score_wp">
                                            <div id="score_1" class="score" data-value="7.5"></div> 
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <!-- End img_wrapper -->
                    		<?php }} ?>			
					
				</div>
            </aside>
            <!--End aside -->
            <div class="col-md-9 col-md-pull-3">
			<?php 
			if(!empty($categorynews))
						{
							foreach($categorynews as $sininews)
								{
									
									// echo '<pre>';
									// print_r($ticketdata);
									// echo '</pre>';
							$url = base_url()."news/".$sininews['alias']."/".$sininews['Id'];									
			?>
                <div class="box_style_general add_bottom_30">
                    <div class="row">
                        <div class="col-md-6">
						 <h2><?php echo trim($sininews['title']); ?></h2>
						 <span class="tie-date"><i class="icon-clock"></i><small><?php echo showtime4db($sininews['added']);?></small></span>
						 <span class="tie-date"><i class="icon-eye"></i><small><?php echo $sininews['hits'];?> views</small></span>
                        </div>
						<div class="col-sm-6">
                    <div id="social_footer">
                        <ul>
						    <li><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=<?php echo $url;?>"><i class="icon-facebook"></i></a>
                            </li>
                            <li>
							<?php 
							  $t_url = urlencode($url);
							  $t_url = 'https://twitter.com/intent/tweet?text='.$t_url;
							?>
							<a target="_blank" href="<?php echo $t_url;?>"><i class="icon-twitter"></i></a>
                            </li>
							
                           <!-- <li><a target="_blank" href="https://plus.google.com/share?url=URL_LINK<?php echo $url;?>"><i class="icon-google"></i></a>-->
                            </li>
                            <!--li><a target="_blank" href="<?php echo 'http://instagram.com/'.base_url();?>"><i class="icon-instagram"></i></a>
                            </li>
                            <li><a target="_blank" href="http://pinterest.com/pinthis?url={<?php echo base_url();?>}"><i class="icon-pinterest"></i></a>
                            </li--> 
                        </ul>
						<a class="btn btn-info btn-sm pull-right" id="submit-contact" data-toggle="modal" data-target="#myModal" ><b><i class='icon-envelope'></i> send a friend</b></a>
                    </div>
                </div>
                    </div>
							<div class="col-md-12">
										<div class="modal fade" id="myModal" role="dialog">
  									   <div class="modal-dialog">
											 <div class="modal-content">
											 <div class="modal-header">
											  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
											  <h4 class="modal-title" id="myModalLabel">Email Sent</h4>
											</div>
											<div class="modal-body" >
											 <form action="" method="post">
											<div class="row">
											 <div class="col-md-12"> 
												<div class="form-group">
													<label>Sender Email</label>
													<input required type="email" id="senderemail" name="senderemail" class="form-control styled" placeholder="Enter Sender Email">
												</div>
												
												<div class="form-group">
													<label>Recevier Email</label>
													<input required type="email" id="receiveremail" name="receiveremail" class="form-control styled" placeholder="Enter Receiver Email">
												</div>
												<input type='hidden' name='posttitle' id='posttitle' value='<?php echo $sininews['title'];?>'/>
												<input type='hidden' name='posturl' id='posturl' value='<?php echo $url;?>'/>
										   
												<div class="form-group">
													<label>Message</label>
													<input type="text" id="message" name="message" class="form-control styled" placeholder="Enter Your Message">
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-primary">Submit</button>
													  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
												</div>

												 </div>
												</div>
										  </form>
										  </div>
										</div> 
									</div>
								  </div>
								   <hr>
                                </div>
                    <!--End row -->
                   
                   <p class="lead">
                        <?php echo trim($sininews['description']); ?>
                    </p>
                   
                   <div class="row magnific-gallery">
				   <?php if(!empty($sininews['images'])) 
					{
						foreach($sininews['images'] as $featured){
							//$newsurl	=	base_url()."/news/".$featured['alias']."/".$featured['Id'];
							
					?> 
						<div class="col-sm-3">
								<div class="img_container">
										<img src="<?php echo base_url(); ?>uploads/uploads/<?php echo $featured['url']; ?>" width="800" height="533" class="img-responsive" alt="">
								</div>
							<!-- End img_wrapper -->
						</div>
					<?php }}  ?>
					</div>
					<br/>
					<div class='col-sm-12'>
					
					<?php if(!empty($sininews['address'])){?>
						<address>
							<?php echo $sininews['address']; ?>
						</address> 
					
						<script>
						$(document).ready(function(){
							  $("address").each(function(){                         
								var embed ="<iframe width='425' height='350' frameborder='0' scrolling='no'  marginheight='0' marginwidth='0'   src='https://maps.google.com/maps?&amp;q="+ encodeURIComponent( $(this).text() ) +"&amp;output=embed'></iframe>";
															$(this).html(embed);
														 
							   });
							}); 
						</script>
						<?php } ?> 
					 <hr>
					</div>
<style>
.ticket
{
	 border: 2px solid #9ed898;
    box-shadow: 0px 0px;
    width: 29%;
    background: #b8d6b5;
    color: #756767;
	border-radius: 25px;
}
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
  -webkit-appearance: none; 
  margin: 0; 
}
</style>
							<?php 
							$price="";
							if(isset($_POST['ticket_price'])){
								 
							}
							?>

			
					<div class=' col-sm-12' id="ticket_div">
						<?php 	if(!empty($ticketdata))
									{   echo '<center><h3 style="color:green;">';
										echo 'Tickets Available';
										echo '</h3></center>';
								foreach($ticketdata as $single)
							    {
									$price=$single['ticket_price'];
									?>
			                    <form method='POST'>
									
								<div class="ticket1" style="text-align:left;">
							    <?php 	
								echo '<h3>';
								echo $single['ticket_title'];echo '</h3>';echo '<br>';	
								
								$description = substr($single['ticket_description'],0,300);
								echo $description.'...';  
								echo '<br>';	
								echo 'Price- ';
								echo $single['ticket_price'];echo '<br>';echo '<br>';
								?>
								Quantity-  
								<input type="number"  value="1"class="ticket_price" id="add_ticket_quantity" name="add_ticket_quantity" style="width: 4%;">
								<input type="hidden" value="<?php echo $single['ticket_price']; ?>" class="ticket_price" id="ticket_price" name="ticket_price">
								
								<input type="hidden" value="<?php echo $single['ticket_id']; ?>" class="ticket_id" id="ticket_id" name="ticket_id">
								 
								<input type="hidden" value="<?php echo $single['news_id']; ?>" class="news_id" id="news_id" name="news_id">
								<input type="hidden" value="<?php	echo $single['ticket_title']; ?>" class="ticket_title" id="ticket_title" name="ticket_title">
								
								<input type="hidden" value="<?php echo $single['ticket_description']; ?>" class="ticket_description" id="ticket_description" name="ticket_description">
								
								
								</div>
								<br>
								<button type='button' name='buynow' class='btn btn-warning' style=" background-color: #ffc439;
                                  border-color: #ffc439;" data-toggle="modal" data-target="#modalbuynow" onclick="myfunction()">
								<img src="https://www.paypalobjects.com/webstatic/en_US/i/btn/png/btn_buynow_107x26.png" alt="Buy Now" />
								</button>
								
								</form>
								<?php 
								
								
								
								
								
									}
						
								}			
					 ?>
					</div>
					<script>
					
					function myfunction(){
						
						var oldprice=<?php echo $price?>;
						//alert("old"+oldprice);
						var qty=$("#add_ticket_quantity").val();
						//alert("qty"+qty);
						var newprice= oldprice*qty;
						//alert("new"+newprice);
						
						if(newprice!='0'){
							$("#ticket_price").val(newprice);
							$("#lblprice").html(newprice);
						}
						else{
							$("#ticket_price").val(oldprice);
							$("#lblprice").html(newprice);
						}
					}
					
					</script>
					 <!-- Modal -->
  <div class="modal fade" id="modalbuynow" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
		 <div class="box_style_general">
		   <div class="indent_title_in">
                        <i class="icon_pencil-edit"></i>
                        <h4>You have selected this ticket to purchase</h4>
                    </div>
        <div class="modal-body">
          <form method="post" id="contactform" class="contactform">
		  <?php
		  foreach($ticketdata as $single)
							    {
									?>
			<div class="row">
			
				<div class="col-md-8 col-sm-6">
				<div class="form-group">
				<label><b><?php echo $single['ticket_title']; ?></b></label>
				<label><?php echo $single['ticket_description'];  ?></label><br>
				<label>Price -</label><label id="lblprice"></label><br>
				<input type="hidden" value="" class="ticket_price" id="ticket_price" name="ticket_price">
				
				<input type="hidden" value="<?php echo $single['ticket_id'] ?>" class="ticket_id" id="ticket_id" name="ticket_id">
				<input type="hidden" value="<?php echo $single['news_id']?>" class="news_id" id="news_id" name="news_id">
			
				
				<div id="paypal-button" class='paypal-button' style="text-align: center"></div>
			   
				<span style="color:green;" class="regitser_class" id="tbl_admin_email_error" ></span>
					   
				</div>
				</div> 
			 
			</div>
			<?php 			
								
									}
						?>
		  </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      </div>
    </div>
  </div>
					
					
					<!--end modal-->
					<br>
					<br>
					<div style="clear:both;"></div>
					<div style="clear:both;"></div>
                   <h3 class="add_bottom_15" id="contactus">Contact us</h3>
                    <div id="message-contact-detail"></div>
                        <form method="post" class="contactusform" onsubmit="return contactus();">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>First name</label>
                                        <input type="text" class="form-control styled" id="firstname" name="firstname" placeholder="First name">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Last name</label>
                                        <input type="text" class="form-control styled" id="lastname" name="lastname" placeholder="Last name">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input type="email" id="email" name="email" class="form-control styled" placeholder="Enter Email">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Phone number</label>
                                        <input type="text" id="mobile" name="mobile" class="form-control styled" placeholder="Phone number">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Your message</label>
                                        <textarea rows="5" id="messagew" name="messagew" class="form-control styled" style="height:100px;" placeholder="Your message"></textarea> 
                                    </div>
								</div>
                            </div>
                            <div class="row">
                                <div class="col-md-6"> 
                                    <div class="form-group" style='display:none;'> 
                                        <label>Are you human? 3 + 1 =</label>
                                        <input type="text" id="verify_contact" class=" form-control styled" placeholder="Are you human? 3 + 1 =">
                                    </div>
									<input type='hidden' name='businesstitle' id='businesstitle' value='<?php echo $sininews['title'];?>'/>
									<input type='hidden' name='businessurl' id='businessurl' value='<?php echo $url;?>'/>
									<input type="submit" value="Submit" class="button add_bottom_30" id="submit-contact" />
									<p class="alert hideme contactusmessage form-group"></p> 
                                </div>
                            </div>
                        </form>
						<div class="row">
						
                                <div class="col-md-12">
								<h3>Write a review</h3>
							 <form method="post" class='reviewpostform'>
									<div class="form-group">
                                        <label>Name</label>
										 <input type="text" id="username" name="username" class="form-control styled" placeholder="Enter Your Name">
								    </div>
									<div class="form-group">
                                        <label>Email</label>
										 <input type="email" id="useremail" name="useremail" class="form-control styled" placeholder="Enter Your Email">
								    </div>
									<div class="form-group">
                                        <label>Enter Your Review</label>
                                        <textarea rows="5" id="review" name="review" class="form-control styled" style="height:100px;" placeholder="Enter Your Review"></textarea>
                                    </div>
									<div class="col-md-12">
								<span class="reatting">
									<input value="<?= getRatingByProductId($sininews['Id']); ?>" type="number" class="rating" min=0 max=5 step=0.1 data-size="md" data-stars="5" productId=<?php echo $sininews['Id'];?>>
								</span>
								</div>
									<input type='hidden' name='newsid' id='newsid' value='<?php echo $sininews['Id'];?>'/>
									<input type='hidden' name='vote' id='vote'/>
                                </div>
								 <div class="col-md-12">
                                     	<input type="button" value="Submit Review" class="button add_bottom_30 " id="submit-contact" onclick='reviewpost()' />
                                </div>
								<div class="col-md-12">
								  <p class="alert hideme reviewpostmessage form-group"></p> 
								 </div> 
							  </form>
								<hr/>
                            </div>
                </div>
						
				
                <!-- End box_style_general -->
		<?php }} ?>
			<?php 
				if(!empty($ratingreview))
				{ 
			?>
						<div class="col-md-12 col-sm-4 box_style_general add_bottom_30" style='padding-bottom: 30px;'>
					
                                <h3 style='padding-left: 32px;'><u>Reviews</u></h3> 
                              <?php 
							  
								  foreach($ratingreview as $ratinglist){
									if($ratinglist->status==1)
									{
								?>
                                        <div class='col-sm-12' style='border:1px solid #f5f5f5;'>
											  <div class='col-sm-2'>
                                                <img src="<?php echo base_url('uploads/default.png');?>" alt="thumb" class="img-rounded" width="60" height="50">
											  </div>
											  <div class='col-sm-10'>
                                                <p><b style='font-size:16px;'><?php echo $ratinglist->name;?></b>
												<?php 
												$starNumber = $ratinglist->vote;

											for($x=1;$x<=$starNumber;$x++) {
													echo '<img src="'.base_url('uploads/star.png').'" style="max-width: 20px;" title="'.$starNumber.'" />';
												}
												if (strpos($starNumber,'.')) {
													echo '<img src="'.base_url('uploads/halfstar.png').'" style="max-width: 20px;" title="'.$starNumber.'" />';
													$x++;
												} 
												?>
												
												</p>
                                                <p>
												<?php
													 $review = substr($ratinglist->review,0,130); 
													 echo  $review;
												?></p>
											  </div>
                                        </div> 
									<?php }
									} ?>
						</div>
			<?php } ?>
			</div>
		    <!-- End col lg-9 -->
        </div>
        <!-- End row -->
    </div>
    <!-- End container -->

<script type="text/javascript">
$(function(){
	   $('.rating').on('rating.change', function(event, value, caption) {
	   $("#vote").val(value);
	 });
	  });
    


    </script>
	<script src="https://www.paypalobjects.com/api/checkout.js"></script>

	<script>
paypal.Button.render({  


  // Configure environment
  env: 'sandbox',
  client: {
    sandbox: 'AX6TlVKwVjq8YiTDA91n3P6ecFxgocJjl57DOmrHr1prhGZuRyUCkR6IUCFHbvJ_KeSGx08my-Vviqg4',
    production: 'AQXCYC8z7t2PdMV2arf0iFsnTukRFiiSbQN9pqwPSvX09taU2lqviW9I4ZCRuiYdYII5bkiRWbXjWh7-'
  },
  // Customize button (optional)
  locale: 'en_US',
  style: {
    size: 'small',
    color: 'gold',
    shape: 'pill',
  },
  // Set up a payment
  payment: function (data, actions) {
		 var ticket_price = $(".ticket_price").val();
		 
	 
	return actions.payment.create({
      transactions: [{
        amount: {

          total: ticket_price,
          currency: 'USD',
       
        }
      }]
    });
  }, 
  // Execute the payment
  
  onAuthorize: function (data, actions) {
					console.log('THIS IS MY DATA', data, actions,);
					return actions.payment.execute().then(function () {
					var news_id = $(".news_id").val();
					var ticket_id = $(".ticket_id").val();
					console.log('THIS IS MY DATAaaaaaa', arguments);
                 	 $.ajax({
			
				  type: 'POST',	
				  url: '<?php echo base_url();?>information/save_payment_info',
                  data: { 	'data'     : arguments,
							'news_id'  : news_id,
							'ticket_id': ticket_id,
                	   },
							  processdata:false,
                              cache: false,
                              async: true,
                              success: function (tempdata) 
                                {
                                  if(tempdata.trim()!="")
                                    {
                                      $(".actbtndiv").fadeOut("slow");
									
                                    } else {
                                      $(".actbtndiv").fadeIn("fast");
									 

                                    }
								 
									$(".tbl_admin_email_error").addClass("alert-success");
                                      $("#tbl_admin_email_error").html(tempdata);
                                }
				});
				}); 
	         }
}, '#paypal-button');


</script>
	

<?php
		echo	$layout['footer'];
?> 