<?php
		echo	$layout['header'];
	
?>  
    <!-- SubHeader =============================================== -->
    <section class="parallax_window_in" data-parallax="scroll" data-natural-width="1400" data-natural-height="420">
        <div id="sub_content_in">
            <h1 style='text-transform: initial;'><?php echo $selectdata->title;?></h1>
        </div>
        <!-- End sub_content -->
    </section>
    <!-- End section -->
    <!-- End SubHeader ============================================ -->

    
	<div class="bg_white">
    <div class=" container margin_60">
        <div class="row">
            <div class="col-md-12">
                <div class="main_title_left">
                    <h2><?php echo $selectdata->title;?></h2>
                </div>
				<h3 class="nomargin_top"></h3>

				  <div class="panel-group" id="transport">
                    <?php echo $selectdata->description;?>
                   </div>
            </div>
          
        </div>
        <!-- End row -->
    </div>
    </div>
    <!-- End container -->
	



<?php
		echo	$layout['footer'];
?> 