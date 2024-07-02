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
	<section class="blog-wrapper">
		<div class="container">
			
			<div class="col-md-12 text-center">
				<?php
						echo $addupmessage;
				?>
			</div>
			
			<div class="col-md-12 row">
				
					<div class="col-md-9">
						<form method="POST" name="srhcatform">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label> Keyword </label>
											<input value="<?php echo $srhcatkeyword; ?>" type="text" name="srhcatkeyword" class="form-control srhcatkeyword" placeholder="Keyword to Search" />
									</div>
								</div>
							
								<div class="col-md-6">
									<div class="form-group">
										<label> &nbsp; </label> <br/>
											<button class="btn-danger btn" type="submit">Search</button>
									</div>
								</div>
								<div style="clear:both;"></div>
							</div>
						
						</form>
					</div>	
					<div class="pull-right">
						<label> &nbsp; </label> <br/>
				<button class="btn btn-info" onclick="$('.adfrmform').toggle();$('#adfrmform input').val('');$('#adfrmform textarea').val('');$('.catid').val(0);$('.disbtn').val('Add Category');">
					Add Category
				</button>
					</div>	
					
					
					
							<div style="clear:both;"></div>	
			</div>
			<?php
						$catid 	=	$this->input->get('catid');
							if(!empty($catid))
								{
									$disbtn = "Update Category";
									$disfrm = "display:block;";
								} else {
									$disbtn = "Add Category";
									$disfrm = "display:none;";
								}
			?>
			
			<div class="col-md-12 adfrmform" style="<?php echo $disfrm; ?>">
				<form action="<?php echo site_url("admin/category"); ?>" id="adfrmform" method="POST" name="adfrmform">
				
					<input type="hidden" name="catid" class="catid" value="<?php echo $catid; ?>" />
				
				<h3> Add Category </h3>
				
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label> Category </label>
								<input value="<?php echo $cat_title; ?>" required type="text" name="cat_title" class="form-control cat_title" placeholder="Category Title" />
							</div>
						</div>
						<div class="col-md-8 col-sm-8">
						<div id='selectbox'>
								<div class="after-add-more">
								<label class="col-md-4">Sub-Category </label>
								<?php    
								if(!empty($subcategory))
									{
										$subcategory = json_decode($subcategory);
										if(!empty($subcategory))
										{
											$i = 0;
											$numItems = count($subcategory);
											foreach($subcategory as $key=>$single)
											{	
											?>
											<div class="form-group">
												<label class="col-md-4"> </label>
							
									
										<div class="col-md-4 col-sm-4">
											<input type="text" id="subcategory" name="subcategory[]" class="form-control" placeholder="Enter the values.." value="<?php echo $single;?>" />
										</div>
											
										 <div class="col-md-4">
												<div class="form-group">
													<?php 
													if(++$i === $numItems) {
													?>
													<button class="btn btn-success btn-xs add-more"type="button" onclick="addmore()">+</button>
													<?php } ?>
													<button class="btn btn-danger btn-xs remove" type="button">-</button>
												</div>
										  </div>
										
									
								</div>
								     <?php }
										}
									}  else{ ?>
										<div class="form-group">
												<label class="col-md-4">Sub-Category </label>
								
								
										<div class="col-md-4 col-sm-4">
										<input type="text" id="subcategory" name="subcategory[]" class="form-control" placeholder="Enter the values.." />
										</div>
										 <div class="col-md-4">
												<div class="form-group">
													<button class="btn btn-success btn-xs add-more"type="button" onclick="addmore()">+</button>
													<button class="btn btn-danger btn-xs removeok" type="button">-</button>
												</div>
										  </div>
									
								</div>
								<?php } ?>
								</div>
								</div>
						</div>		
								<div style="clear:both;"></div>
						<div class="col-md-6">
							<div class="form-group">
								<label> Description </label>
					<textarea style="min-height: 45px;" name="cat_description" class="form-control cat_description htmleditor" placeholder="Category URL"><?php echo $cat_description; ?></textarea>
							</div>
						</div>
								<div style="clear:both;"></div>
					
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label> Status </label>
								<select name="cat_status" class="form-control cat_status">
									<option <?php echo isselected('1',$cat_status); ?> value="1">Active</option>
									<option <?php echo isselected('0',$cat_status); ?> value="0">Inactive</option>
								</select>
							</div>
						</div>	
						<div class="col-md-3">
							<div class="form-group">
								<label> Cover Image (Category Page)</label>
								<input type="file"  accept="image/8"  name="userfiles" class="form-control userfiles" onchange="uploadmulptipleme();" />
									
									<fileresponse></fileresponse>
									
									<?php
											$allimage = "";
													if(!empty($newsimages))
														{
															$newsimages = $newsimages;
														}else{
															$newsimages = '';
														}	
									?>
									    
									<textarea style="display:none;" name="allimage" class="allimage"><?php echo $newsimages; ?></textarea>  
							</div>
						</div>	
						<div class="col-md-6">
							<div class="form-group">
								<label style="display:block"> &nbsp; </label>
								<input type="submit" class="btn btn-lg btn-primary disbtn" value="<?php echo $disbtn; ?>" />	
							</div>
						</div>
								<div style="clear:both;"></div>
					</div>
					
				</form>
			</div>
			</div>
			
			
			<div class="col-md-12 ">
					<h3>
						<?php
								//echo $data['seo']['title'];
							
						?>
					</h3>
					<?php 
					$c=0;
							if(!empty($categories)){
					?>
					<table class="categorylist">
						<thead>
							<tr>
								<th>
									ID
								</th>
								<th>
									Title
								</th>
								<th>
									Status
								</th>
								<th>
									Edit
								</th>
							</tr>
						</thead>
						<tbody>
						<?php 
							
							foreach ($categories as $key) 
							{
								$cat_id = $key['cat_id'];
								$c++;
							?>
							<tr>
								<td>
									<?php echo $key['cat_id']; ?>
								</td>
								<td>
									<?php echo $key['cat_title']; ?>
								</td>
								<td>
									<?php
											$status	=	$key['status']; 
											if(!empty($key['status']))
												{
													echo "<button is_active='$status' catid='$cat_id' onclick='makectgisactive(this);' class='btn btn-success'>Active</button>";
												} else {
													echo "<button is_active='$status' catid='$cat_id' onclick='makectgisactive(this);' class='btn btn-danger'>Inactive</button>";
												}
									?> 
								</td>
								<td>
									<form>
										<input type="hidden" name="catid" value="<?php echo $cat_id; ?>" />
											<button class="btn-info">	
												<i class="fa fa-edit"></i>
											</button>
									</form>
									
								</td>
							</tr>
							
							<?php } ?>
						</tbody>
					</table>
							<?php } else { 
								echo "<div class='alert alert-warning text-center'><b>Oops!! </b>There is no category log yet.</div>";
							} ?>
					
					
			</div><!-- end container -->
		</div><!-- end white-wrapper -->
	</section><!-- end blog-wrapper -->
   
<?php
		echo	$layout['footer'];
?>

	<script>
	
	function addmore() {
	 var std_list_index = 0;
	 std_list_index++;
     var html = $(".copy").html();
	 $(".after-add-more").after(
		'<div class="copy"><div class="form-group"><div class="col-md-8"><input type="text" name="subcategory[]" class="form-control" placeholder="Enter the values.." required></div><div class="col-lg-4"><div class="input-group-btn"><button class="btn btn-danger remove"type="button">-</button></div> </div></div></div>'
	 );
}

 $("body").on("click", ".remove", function () {
 $(this).parents(".form-group").remove();
 });
   

			$(document).ready(function(){
					$('.categorylist').DataTable( {
        "order": [[ 0, "desc" ]]
    } );
				});
	</script>