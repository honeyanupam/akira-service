<html lang="en"> 
<head> 
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" /> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title><?php echo $data['seo']['title']; ?></title>
	<link rel="icon" href="<?php echo WEBSITESEOIMAGE; ?>" type="image/png" sizes="16x16">
	<meta name="description" content="<?php echo $data['seo']['metadescription']; ?>" />
	<meta name="summary" content="<?php echo $data['seo']['metadescription']; ?>" />
	<meta name="keywords" content="<?php echo $data['seo']['metakeyword']; ?>" />
	<meta property="og:site_name" content="<?php echo WEBSITENAME; ?>" />
	<meta property="og:type" content="website" />
	<meta property="og:url" content="<?php echo $data['seo']['url']; ?>" />
	<meta property="og:title" content="<?php echo $data['seo']['metatitle']; ?>" />
	<meta property="og:description" content="<?php echo $data['seo']['metadescription']; ?>" />
	<meta property="og:image" content="<?php echo WEBSITEIMAGE; ?>" />
 
    <!-- Favicons-->
    <link rel="shortcut icon" href="<?php echo base_url('assets/weblayout/');?>img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="<?php echo base_url('assets/weblayout/');?>img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="<?php echo base_url('assets/weblayout/');?>img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="<?php echo base_url('assets/weblayout/');?>img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="<?php echo base_url('assets/weblayout/');?>img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE FONT -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700,300" rel="stylesheet" type="text/css">
<script src="<?php echo base_url('assets/weblayout/');?>js/jquery-2.2.4.min.js"></script>
    <!-- BASE CSS --> 
	<script src="<?php echo base_url();?>assets/commonargalon.js"></script>
    <link href="<?php echo base_url('assets/weblayout/');?>css/animate.min.css" rel="stylesheet">
    <link href="<?php echo base_url('assets/weblayout/');?>css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo base_url('assets/weblayout/');?>css/style.css" rel="stylesheet">
    <link href="<?php echo base_url('assets/weblayout/');?>css/menu.css" rel="stylesheet">
    <link href="<?php echo base_url('assets/weblayout/');?>css/icon_fonts/css/all_icons.min.css" rel="stylesheet">
	 <link href="<?php echo base_url('assets/weblayout/');?>css/pop_up.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
    <!-- YOUR CUSTOM CSS -->
    <link href="<?php echo base_url('assets/weblayout/');?>css/custom.css" rel="stylesheet">

    <!-- Modernizr -->
    <script src="<?php echo base_url('assets/weblayout/');?>js/modernizr.js"></script>

<style>
body
{
	
	background-color:#655a5a;
	top: 0px; position: relative; min-height: 100%;
}
.link
{
	text-decoration:none;
}

</style>
  
 <section class="header-video">
        <div id="hero_video">
            <div id="sub_content_in">
                <h1>ERROR 404!</h1>
                <p>
                  The url you have entered does not exist !   Return to the  <a class="link" href="<?php echo base_url();?>">Home</a> page
                </p>

            </div>
            <!-- End sub_content -->
        </div>
        <img src="<?php echo base_url('assets/weblayout/');?>img/video_fix.png" alt="" class="header-video--media" data-video-src="<?php echo base_url('assets/weblayout/');?>video/intro" data-teaser-source="<?php echo base_url('assets/weblayout/');?>video/intro" data-provider="" data-video-width="1920" data-video-height="960">
    </section>
	
	

 <!-- Footer ================================================== -->
 <style>
 .skiptranslate{
	 display:non2e;
 }
 
 </style>
 <input type="hidden" id="base_url_value" value="<?php echo base_url(); ?>" /> 
    <footer class="footer_bg_color">
        <div class="container">
            <div class="row">
                
              
                <div class="col-md-3 col-sm-4" id="newsletter">
                 
                    <p>
                        Join our newsletter to keep be informed about offers and news...
                    </p>
                    <div id="message-newsletter_2">
                    </div>
                    <!--form method="POST" action="assets/newsletter.htm" name="newsletter_2" id="newsletter_2">
                        <div class="form-group">
                            <input name="email_newsletter_2" id="email_newsletter_2" type="email" value="" placeholder="Your mail" class="form-control">
                        </div>
                        <p>
                            <input type="submit" value="Subscribe" class="button" id="submit-newsletter_2">
                        </p>
                    </form-->
                </div>
                
            </div>
            <!-- End row -->
            
            <!-- End row -->
        </div>
		<div class="footer_btm">
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						© Tourism 2018 - All Rights Reserved
					</div>
					<div class="col-sm-6">
						<div id="social_footer">
							<ul>
								<li class="icon-fb"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=<?php echo base_url();?>"><i class="icon-facebook"></i></a>
								</li>
								<li class="icon_twitt">
								<?php 
								  $url = urlencode(base_url());
								  $url = 'https://twitter.com/intent/tweet?text='.$url;
								?>
								<a target="_blank" href="<?php echo $url;?>"><i class="icon-twitter"></i></a>
								</li>
								
								<li class="icon_gogle"><a target="_blank" href="https://plus.google.com/share?url=<?php echo base_url();?>"><i class="icon-google"></i></a>
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
     
	 <script src="<?php echo base_url()."assets/front/" ?>js/argalon.js"></script> 
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
	
	
    <!--script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCWHYAF8lMWqmuHmX81BG0PeTnFEPKEKbY"></script>
    <script src="<?php echo base_url('assets/weblayout/');?>js/map_home.js"></script>
    <script src="<?php echo base_url('assets/weblayout/');?>js/infobox.js"></script-->
</body>
</html>
    <script src="<?php echo base_url('assets/weblayout/');?>js/theia-sticky-sidebar.min.js"></script>
 