<?php
		echo	$layout['header'];
	
?>  
					
    
    <!-- SubHeader =============================================== -->
    <section class="header-video">
        <div id="hero_video">
            <div id="sub_content_in">
                <h1>The most important info<br>on your Mobile during a visit</h1>
                <p>
                    Museum Guides / Directions / Tips&amp;info
                </p>

            </div>
            <!-- End sub_content -->
        </div>
        <img src="<?php echo base_url('assets/weblayout/');?>img/video_fix.png" alt="" class="header-video--media" data-video-src="<?php echo base_url('assets/weblayout/');?>video/intro" data-teaser-source="<?php echo base_url('assets/weblayout/');?>video/intro" data-provider="" data-video-width="1920" data-video-height="960">
    </section>
    <!-- End Header video -->
    <!-- End SubHeader ============================================ -->
<!-- End bg_white -->
    <div class="pattern_dots latest_traval_guid">
        <div class="container margin_60_45">
            <div class="main_title" style='display:none;'>
                <h2><strong>Latest</strong> in TravelGuide</h2>
                <span><em></em></span>
            </div>
            <!-- End main_title -->

           <h2><strong>Latest</strong> in TravelGuide</h2>
            <!-- End row -->
            <div class="row"> 
			<?php 
			if(!empty($latestnews))
				{
				foreach($latestnews as $latestnewsall)
					{
						$topnewsurl	=	base_url()."news/".$latestnewsall['alias']."/".$latestnewsall['Id'];
			?>
									<?php 
									if(!empty($latestnewsall['url'])){
										$latestimage = base_url('/uploads/uploads/').$latestnewsall['url'];
									}else{
										$latestimage = base_url('/uploads/uploads/tourismdefault.jpg');
									}
									?>
                <div class="col-md-4">
                    <div class="img_wrapper_grid hg-230">
                        <div class="ribbon top">
                            <span>Top rated</span>
                        </div>
                        <!-- End tools i-->
                        <div class="img_container_grid"> 
                            <a href="<?php echo $topnewsurl; ?>">
                                <img src="<?php  echo $latestimage; ?>" width="800" height="468" class="img-responsive" alt="">
                                <div class="short_info_grid">
                                    <h3><?php echo $latestnewsall['title']; ?></h3>
                                    <small><strong><?php echo $latestnewsall['cat_title']; ?></strong></small>
                                    <em><?php echo showtime4db($latestnewsall['newsdate']); ?></em>
                                    <p>
                                        Read more
                                    </p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <!-- End img_wrapper_grid -->
                </div>
				<?php }} ?>
                  </div>
            <!-- End row -->
        </div>
        <!-- End container -->
    </div>
    <!-- End pattern dots -->

    <div class="container all_categories_box"  style="display:none; ">
        <div class="main_title">
            <h2><strong>All Categories</strong></h2>
           
        </div>

			<div class="row box_cat">
			<div class="col-md-1">
			</div>
          <?php 
						if(!empty($subcategorydata))
						{
							foreach($subcategorydata as $singledata)
							{
							if($singledata['subcategory']==0)
								{
									$image= explode(",",$singledata['newsimages']);
						?>
									<?php 
									if(!empty($image[0])){
										$catimage = base_url('/uploads/uploads/').$image[0];
									}else{
										$catimage = base_url('/uploads/uploads/tourismdefault.jpg');
									}
									?>
						<div class="col-md-2 col-sm-6">
						<div class="img_container_grid"> 
                            <a href="<?php echo base_url("category"); ?>/<?php echo $singledata['alias']; ?>">
                                <img src="<?php echo $catimage; ?>" width="800" height="468" class="img-responsive" alt="">
                                <div class="short_info_grid">
                                    <h3><?php echo ucfirst($singledata['cat_title']); ?></h3>
                                </div>
                            </a>
                        </div>
						</div>
					<?php
								}
							}
						}
					?>
			<div class="col-md-1">
			</div>					
            </div>
			
        <!-- End row -->

          <!-- End row -->
    </div>
    <!-- End container -->
	
    <div class="bg_whitea owl_carousel_home_page">
			

        <div class="container margin_60_30">
		<h2><strong>All Categories</strong></h2>
           <div class="carousel box_cat small">
			  <?php 
						if(!empty($subcategorydata))
						{
							
							foreach($subcategorydata as $singledata)
							{
							if($singledata['subcategory']!=0)
								{
									$subimages = explode(",",$singledata['newsimages']);
						?>
									<?php 
									if(!empty($subimages[0])){
										$subcatimages = base_url('/uploads/uploads/').$subimages[0];
									}else{
										$subcatimages = base_url('/uploads/uploads/tourismdefault.jpg');
									}
									?>
									
						<div class="col-md-12 ">
						<div class="img_container_grid"> 
							<a href="<?php echo base_url("category"); ?>/<?php echo $singledata['alias']; ?>">
								 <img src="<?php echo $subcatimages; ?>" class="img-responsive" alt="" ">
								<?php 
										$titlename = ucfirst($singledata['cat_title']); 
										$titlename = substr($titlename,0,10);  
								?> 
								<div class="short_info_grid">
                                    <h3><?php echo $titlename;  ?></h3>
                                </div>								
							</a>
						</div>
						</div>
					<?php
								}
							}
						}
					?>	
			  </div>
            <!-- End Carousel -->
        </div>
        <!-- End Container -->
    </div>
    
  <section class="parallax_window_home bright most_view_home" style='display:nodne;'>
        <div class="container">
            <div class="main_title">
                <h3><strong>Most View Post</strong></h3>
            </div>
            <div class="row features add_bottom_45">
			<?php 
			if(!empty($maxhitsnews)){
				foreach($maxhitsnews as $sinmaxhits){
					$maxnewsurl	 =	base_url()."news/".$sinmaxhits->alias."/".$sinmaxhits->Id;
					$description = substr($sinmaxhits->description,0,30);
			
									if(!empty($sinmaxhits->url)){
										$mostimage = base_url('uploads/uploads/').$sinmaxhits->url;
									}else{
										$mostimage = base_url('uploads/uploads/tourismdefault.jpg');
									}
									?>
                <div class="col-sm-4 most-view">
					<div id="feat_2" class="img_container_grid" style="background: url(<?php echo $mostimage;?>) center  no-repeat rgba(255,255,255,.8)">
                        <div class="caption_title">
                        <a href="<?php echo $maxnewsurl; ?>">
                        <h3><b><?php echo $sinmaxhits->title; ?></b></h3> 
                        
						</a> 
						</div>
                    </div>
                </div>
			<?php }} ?> 
            </div>
        </div>
        <!-- End row -->
    </section>
    <!-- End section -->
	<div style='clear:both;'></div>

   
 
	
<?php
	echo	$layout['footer'];
?> 
 
	
 <!-- Fixed sidebar + Input Range + Carousel + Switch-->
    <script src="<?php echo base_url('assets/weblayout/');?>js/theia-sticky-sidebar.min.js"></script>
    <script>
        'use strict';
        jQuery('#sidebar').theiaStickySidebar({
            additionalMarginTop: 80
        });

        $('.carousel').owlCarousel({
            items: 1,
            loop: true,
			margin: 10,
            autoplay: false,
            smartSpeed: 300,
            responsiveClass: true,
            responsive: {
                320: {
                    items: 2,
                },
                1000: {
                    items: 6,
                }
            }
        });

       /*  var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
        elems.forEach(function (html) {
            var switchery = new Switchery(html, {
                size: 'small'
            });
        }); */
    </script>