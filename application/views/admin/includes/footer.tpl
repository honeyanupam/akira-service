
<input type="hidden" id="base_url_value" value="<?php echo base_url(); ?>" /> 
	

	<div id="copyrights" style='display:none;'> 
    	<div class="container ">
			<div class="col-lg-5 col-md-6 col-sm-12">
            	<div class="copyright-text">
                    <p> &copy; <?php echo date('Y'); ?> - <?php echo WEBSITENAME; ?></p>
                </div><!-- end copyright-text -->
			</div><!-- end widget -->
				<div class="col-lg-7 col-md-6 col-sm-12 clearfix">
				</div><!-- end large-7 -->  
        </div><!-- end container -->
    </div><!-- end copyrights -->
    
	<div class="dmtop">Scroll to Top</div>
        
  <!-- Main Scripts-->
  <script src="<?php echo base_url()."assets/front/" ?>js/argalon.js"></script> 
  <script src="<?php echo base_url()."assets/front/" ?>js/menu.js"></script>
  <script src="<?php echo base_url()."assets/front/" ?>js/owl.carousel.min.js"></script>
  <script src="<?php echo base_url()."assets/front/" ?>js/jquery.parallax-1.1.3.js"></script>
  <script src="<?php echo base_url()."assets/front/" ?>js/jquery.simple-text-rotator.js"></script>
  <script src="<?php echo base_url()."assets/front/" ?>js/wow.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>
  <script src="<?php echo base_url()."assets/front/" ?>js/custom.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
  <script src="<?php echo base_url()."assets/front/" ?>js/jquery.isotope.min.js"></script>
  <script src="<?php echo base_url()."assets/front/" ?>js/custom-portfolio-masonry.js"></script>

  <!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
  <script type="text/javascript" src="<?php echo base_url()."assets/front/" ?>rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
  <script type="text/javascript" src="<?php echo base_url()."assets/front/" ?>rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
  <script type="text/javascript">
	var revapi;
	jQuery(document).ready(function() {
		revapi = jQuery('.tp-banner').revolution(
		{
			delay:9000,
			startwidth:1170,
			startheight:900,
			hideThumbs:10,
			fullWidth:"on",
			forceFullWidth:"on"
		});
	});	//ready
  </script>
      
  <!-- Royal Slider script files -->
  <script src="<?php  echo base_url(); ?>assets/front/royalslider/jquery.easing-1.3.js"></script>
  <script src="<?php  echo base_url(); ?>assets/front/royalslider/jquery.royalslider.min.js"></script>
  
<!--link href="<?php echo base_url(); ?>assets/back/font-awesome/css/font-awesome.css" rel="stylesheet" /-->
	<script>  
	(function($) {
	  "use strict";
			$("#header-style-1").affix({
			offset: {
			  top: 1100
			, bottom: function () {
				return (this.bottom = $('#copyrights').outerHeight(true))
			  }
			}
		})
	})($);
	
	$("document").ready(function()	{
		tinymce.init({ selector:'.htmleditor' });
	});
	
	
</script>
<script src="<?php  echo base_url(); ?>assets/jquery.multi-select.js"></script>
</body>
</html>
