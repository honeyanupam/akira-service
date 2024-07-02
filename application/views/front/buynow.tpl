<?php
		echo	$layout['header'];
?>
 


	<div class="container margin_60_30">
        <div class="row">

            <div class="col-md-12">
                <div class="box_style_general">
                    <div class="indent_title_in">
                        <i class="icon_pencil-edit"></i>
                        <h4>You have selected this ticket to purchase</h4>
                    </div>
                    <div class="wrapper_indent">
                        <div id="message-contact"></div>
                        <form method="post" id="contactform" class="contactform">
                            <div class="row">
                                <div class="col-md-8 col-sm-6">
								<div class="form-group">
								<label><b><?php   echo $ticket_title;  ?></b></label>
								<label><?php   echo $ticket_description;  ?></label><br>
								<label>Price - <?php if(!empty($new_price)){ echo $new_price;} else {  echo $ticket_price;}  ?></label><br>
								<input type="hidden" value="<?php if(!empty($new_price)){ echo $new_price;} else {  echo $ticket_price;}  ?>" class="ticket_price" id="ticket_price" name="ticket_price">
								
								<input type="hidden" value="<?php echo $ticket_id; ?>" class="ticket_id" id="ticket_id" name="ticket_id">
								<input type="hidden" value="<?php echo $news_id; ?>" class="news_id" id="news_id" name="news_id">
					 		
								
							    <div id="paypal-button" class='paypal-button' style="text-align: center"></div>
							   
							  	<span style="color:green;" class="regitser_class" id="tbl_admin_email_error" ></span>
									   
                                </div>
                                </div> 
                             
                            </div>
                          </form>
                    </div>
                    <!-- End wrapper_indent -->
                </div>
                <!-- End box style 1-->
            </div>
            <!-- End col lg 9 -->
      
            <!--End aside -->
        </div>
        <!-- End row -->
    </div>

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
