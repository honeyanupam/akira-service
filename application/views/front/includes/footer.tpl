 <!-- Footer ================================================== -->
 <style>
 .skiptranslate{
	 display:non2e;
 }
 
 </style>
 <input type="hidden" id="base_url_value" value="<?php echo base_url(); ?>" /> 
   <footer style="background-color:<?php echo $sitedetails[0]['footer_color'];?>" >
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-12">
                    <h3 class="newsletter_box">About us</h3>
					<p id="para_about"style="color: white">
          Lorem Ipsum is simply dummy text of the printing and typesetting industry.  
				
                   <!-- <span><a href="<?php echo base_url('front/about');?>">...Read More</a></span>  </p>-->
                    <p><img style='display:none;' src="<?php echo base_url('assets/weblayout/');?>img/logo_2.png" alt="img" class="hidden-xs" width="170" height="30" data-retina="true">
                    </p>
                </div>
                <div class="col-md-3 col-sm-4">
                    <h3 class="newsletter_box page_setting">Pages</h3>
                    <ul>
                        <li><a href="<?php echo base_url('front/about');?>">About us</a>
                        </li>
                        <li><a href="<?php echo base_url('front/faqs');?>">FAQs</a>
                        </li>
                        <li><a href="<?php echo base_url('admin');?>">Login</a>
                        </li>
                        <li><a href="<?php echo base_url('front/terms');?>">Terms and conditions</a>
                        </li>
                    </ul>
                </div>
				
                <div class="col-md-3 col-sm-4" id="newsletter">
                    <h3 class="newsletter_box page_setting">Newsletter</h3>
<p style="color:white;">
Join our newsletter to keep informed about offers and news.
</p>
<form method="post" action="" class="newsletterform" onsubmit="return newsletter();">
<div class="form-group">
<input name="sub_email" id="sub_email" type="email" value="" placeholder="Your mail" class="form-control">
</div>
<p>
<input type="submit" value="Subscribe" class="button" >
</p>
</form>
<div id="message-newsletter_2"></div>
</div>
                 <div class="col-md-3 col-sm-4" id="newsletter">
                    <h3 class=" newsletter_box">ContactUs</h3>
	
                    <ul style="color: white">
                        <li>Address:<?php echo $sitedetails[0]['address'];?>
                        </li>
                        <li>Contact Number:<?php echo $sitedetails[0]['contact'];?>
                        </li>
                       
                        <li>Email:<?php echo $sitedetails[0]['email'];?>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- End row -->
            
            <!-- End row -->
        </div>
		<div class="footer_btm">
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
					<p style = "color:white">	© Tourism <?php echo date('Y');?>- All Rights Reserved </p>
					</div>
					<div class="col-sm-6">
						<div id="social_footer">
							<ul>
								<li class="icon-fb"><a target="_blank" href="<?php echo $sitedetails[0]['fb_url'];?>"><i class="icon-facebook"></i></a>
								</li>
								<li class="icon_twitt">
								
								<a target="_blank" href="<?php echo $sitedetails[0]['twit_url'];?>"><i class="icon-twitter"></i></a>
								</li>
								
								<li class="icon_gogle"><a target="_blank" href="<?php echo $sitedetails[0]['google_url'];?>"><i class="icon-google"></i></a>
								</li>
								<!--li><a target="_blank" href="<?php echo 'http://instagram.com/'.base_url();?>"><i class="icon-instagram"></i></a>
								</li>
								<li><a target="_blank" href="http://pinterest.com/pinthis?url={<?php echo base_url();?>}"><i class="icon-pinterest"></i></a>
								</li-->
								
							</ul>

						</div>
					</div>
				</div>
            </div>
		</div>
        <!-- End container -->
    </footer>
    <!-- End Footer =============================================== -->

    <!-- COMMON SCRIPTS -->
     
	 <script src="<?php echo base_url()."assets/front/" ?>js/argalon.js?v=<?php echo time();?>"></script> 
    <script src="<?php echo base_url('assets/weblayout/');?>js/common_scripts_min.js"></script>
    <script src="<?php echo base_url('assets/weblayout/');?>js/validate.js"></script>
    <script src="<?php echo base_url('assets/weblayout/');?>js/functions.js"></script>

    <!-- Specific scripts -->
    <script src="<?php echo base_url('assets/weblayout/');?>js/video_header.js"></script>
	<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
}
</script>

<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
    <script>
        'use strict';
        HeaderVideo.init({
            container: $('.header-video'),
            header: $('.header-video--media'),
            videoTrigger: $("#video-trigger"),
            autoPlayVideo: true
        });
        // Tabs
        new CBPFWTabs(document.getElementById('tabs'));
    </script>
	<script>
	$( document ).ready(function() {
		//alert("fgthfth");
		var base_url_value = $("#base_url_value").val();
		function test(){
		$.ajax({
			url: base_url_value+'front/getdesciption', 
			alert();
			success: function(tempdata) 
				{
					alert();
					if (tempdata.trim() != '') 
						{
							var text = tempdata;
							  if (text.length > 100) {
								var display = jQuery(this).text(text.substr(0, text.lastIndexOf(' ', 97)) + '...');
								$("#para_about").html(display);
							  }
						} else {
							
						}
				} 
		});
		}
	});
	</script>
	
    <!--script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCWHYAF8lMWqmuHmX81BG0PeTnFEPKEKbY"></script>
    <script src="<?php echo base_url('assets/weblayout/');?>js/map_home.js"></script>
    <script src="<?php echo base_url('assets/weblayout/');?>js/infobox.js"></script-->
</body>
</html>