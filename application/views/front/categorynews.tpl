<?php
		echo	$layout['header'];
?> 

 <section class="parallax_window_in">
        <div id="sub_content_in">
            <h1><?php 
			if(!empty($categorynews[0]['cat_title']))
				echo $categorynews[0]['cat_title']; 
			
			?></h1>
            
        </div>
        <!-- End sub_content --> 
    </section>
    <section class="content">
       
        <div class="container">
            <div class="row wrapper pt-0 cf">
                <div class="col-sm-7 col-md-9 content">
                    <div class="content-col">
                        <div class="news-by_category">
                            <div class="row">
                                <div class="col-sm-12 col-md-12 center-news" style="border-left: 0px solid #bfbfbf; border-right: 0px solid #bfbfbf;">
	
				
	<div class="container margin_60_30">
        <div class="row">
		<div class="col-md-12">
						<form method="POST" name="srhform">
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label> Keyword </label>
											<input value="<?php echo $srhkeyword; ?>" type="text" name="srhkeyword" class="form-control srhkeyword" placeholder="Keyword to Search" />
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label> Category</label>
										<select name="srhcategory" class="form-control srhcategory">
											<option value='0'>Selected</option>
								<?php	// echo $subcategory;
								 if(!empty($allcategories)){
									foreach($allcategories as $single)
										{
											$subsingle = $single['sub'];
											$single = $single['value'];
												//print_r($subsingle);
											// if($single['subcategory']==0)
												echo "<option ".isselected($subcategory,$single['cat_id'])." value=".$single['cat_id']." >".$single['cat_title']."</option>";
													 if(!empty($subsingle))
														{
															echo '<optgroup label="'.$single['cat_title'].'">';
																foreach($subsingle as $subsingle)
																	{
																		$subsingle = $subsingle['value'];
																		echo "<option ".isselected($subcategory,$subsingle['cat_id'])." value=".$subsingle['cat_id']." >".$subsingle['cat_title']."</option>";
																	}
															echo '</optgroup>';
														}
										}
								}
								?>
								
								</select>
										
										</select>
										
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label> &nbsp; </label> <br/>
											<button class="btn-danger btn" type="submit">Search</button>
									</div>
								</div>
								
								
										<div style="clear:both;"></div>
							</div>
						
						</form>
					</div>
            <div class="col-md-3 col-md-push-9" id="sidebar">
                <div class="theiaStickySidebar ">
                   
                    <div id="filters_col">
                         
                        <div class="collapse" id="collapseFilters">
                            <div class="filter_type">
                                <h5>Latest News</h5>
								<?php if(!empty($kuchkhashnews)){
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
							   
							   
								<?php }} ?> 
								<!--script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
								<ins class="adsbygoogle"
									 style="display:block"
									 data-ad-client="ca-pub-5099448143716417"
									 data-ad-slot="7994565288"
									 data-ad-format="auto"></ins> 
								<script>
								(adsbygoogle = window.adsbygoogle || []).push({});
							</script-->
                            </div>
							
							<div class="filter_type">
                                <h5> Favourite</h5>
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
							   
							   
								<?php }} ?> 
								<!--script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
								<ins class="adsbygoogle"
									 style="display:block"
									 data-ad-client="ca-pub-5099448143716417"
									 data-ad-slot="7994565288"
									 data-ad-format="auto"></ins> 
								<script>
								(adsbygoogle = window.adsbygoogle || []).push({});
							</script-->
                            </div>
                        </div>
                        <!--End collapse -->
                    </div>
                    <!--End filters col-->
                </div>
                <!--End sticky -->
				
            </div>
            <!--End aside -->
			 
				<div class="col-md-9 col-md-pull-3">
				<?php
	
				if(!empty($categorynews))
					{
						foreach($categorynews as $sininews)
							{	
							
							$newsurl	=	base_url()."news/".$sininews['alias']."/".$sininews['Id'];
			?>
                <div class="strip_list wow fadeIn" data-wow-delay="0.1s">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="img_wrapper">
                                <!-- End tools i-->
									<?php 
									if(!empty($sininews['url'])){
										$newsimage = base_url('/uploads/uploads/').$sininews['url'];
									}else{
										$newsimage = base_url('/uploads/uploads/tourismdefault.jpg');
									}
									?>
                                <div class="img_container">
                                    <a href="<?php echo $newsurl; ?>">
									    <img class="img-responsive" src="<?php  echo $newsimage; ?>" width="800" height="533" alt="<?php echo $sininews['title']; ?>" />
                                        <div class="short_info">
                                            <h3><?php echo $sininews['title']; ?></h3> 
                                            <small><?php echo showtime4db($sininews['added']); ?></small>
                                           </div> 
                                    </a>
                                </div>
                            </div>
                            <!--End img_wrapper-->
                        </div>
                        <div class="col-sm-6">
                            <div class="desc">
							 <a href="<?php echo $newsurl; ?>">
                                <h4>"<?php echo $sininews['title']; ?>"</h4>
							</a>	
                                <p>
                                    <?php 
									$description = substr($sininews['description'],0,100);
											echo $description.'...';  
									?>
                                </p>
                                <p>
								
								<a href="<?php echo $newsurl; ?>" class="button small">Read more</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!--End row -->
                </div>
                <!--End strip -->
			   <?php	
			   
										}
								echo "<center>";		
									if($total_rows>5) echo $pagination;	
								echo "</center>";
								} else {
									echo	"
												<div class='alert alert-info'>
													<b>Oops! </b> There is no Business News in this category.  
												</div>
													<center>
														<a href='".base_url()."' class='btn btn-info'>
															Back to home
														</a>
													</center>
											";
								}
				?>  
               </div>
            <!-- End col lg 9 -->
        </div>
        <!-- End Row-->
    </div>
   
				 </div>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
        </div>
    </section>

    
<?php
		echo	$layout['footer'];
?> 