<?php
		echo	$layout['header'];
?> 
<style>

.table-responsive {
    overflow-y: auto;
}
</style>
	
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
	</section>
	<section class="blog-wrapper">
		<div class="container">
			<?php 
			if(!empty($_GET['siteid'])){
				$siteid = $_GET['siteid'];
			}else{
				$siteid = 0;
			}
			?>
				<div class="row">
					<div class="col-md-12">
						<div class="addvideoform" style="<?php if(empty($siteid)) { echo " display:none; "; } ?>">
							<form method="POST">
								<input value="<?php echo $siteid; ?>" required type="hidden" name="siteid" />
								<div class="col-md-12">
								<label>Website Logo : </label>
								<div class="form-group">
										<div class="input-group">
										<!--input type="file" name="category_img" id="category_img"  accept="image/*" --> 
										<a class="btn alert-info" onclick="jQuery('.userfiles').trigger('click');" style="display:block;"><i class="fa fa-upload" aria-hidden="true"></i> Upload Logo </a>
										<fileresponse style="display:block;"></fileresponse>
										<input type="hidden" class="sweetimageval" name="logo" id="regionimg">
										<input style="display:none;" onchange="uploadme();" type="file" id='regionimg' name="userfile" size="20" class="form-control userfiles" />  
										</div>
										<br/>
										<image src='<?php echo base_url($sitedetails[0]['logo']);?>' style='width:300px;' />
								 </div>
								</div>
								<div class="col-md-12">
								<label>Title of Page : </label>
									<div class="form-group">
										<input value="<?php echo $sitedetails[0]['title']; ?>" required type="text" name="title" class="form-control" Placeholder="Title for Page" />
									</div>
								</div>
								 <div class="col-md-12">
								<label>Address : </label>
									<div class="form-group">
										<input value="<?php echo $sitedetails[0]['address']; ?>" required type="text" name="address" class="form-control" Placeholder="" />
									</div>
								</div>
								<div class="col-md-12">
								<label>Contact: </label>
									<div class="form-group">
										<input value="<?php echo $sitedetails[0]['contact']; ?>" required type="number" name="contact" class="form-control" Placeholder="Website Name" />
									</div>
								</div>
								 <div class="col-md-12">
								<label>Email: </label>
									<div class="form-group">
										<input value="<?php echo $sitedetails[0]['email']; ?>" required type="email" name="email" class="form-control" Placeholder="Website Name" />
									</div>
								</div>
								<div class="col-md-12">
								   <label>Header color</label><input style="width:100px;margin-left:120px;"type="color" name="header_color" value="<?php echo $sitedetails[0]['header_color']; ?>">
												 <br><br>
								
								  </div>
								  <div class="col-md-12">
								   <label>Footer color</label><input style="width:100px;margin-left:125px;"type="color" name="footer_color" value="<?php echo $sitedetails[0]['footer_color']; ?>">
												 <br><br>
								
								  </div>
								  <div class="col-md-12">
								<label>google url</label>
									<div class="form-group">
										<input value="<?php echo $sitedetails[0]['google_url']; ?>" required type="text" name="google_url" class="form-control" Placeholder="google_url " />
									</div>
								</div>
								<div class="col-md-12">
								<label>facebook url</label>
									<div class="form-group">
										<input value="<?php echo $sitedetails[0]['fb_url']; ?>" required type="text" name="fb_url" class="form-control" Placeholder="fb_url " />
									</div>
								</div>
								<div class="col-md-12">
								<label>twitter url</label>
									<div class="form-group">
										<input value="<?php echo $sitedetails[0]['twit_url']; ?>" required type="url" name="twit_url" class="form-control" Placeholder="twit_url " />
									</div>
								</div>
								<div class="col-md-12">
								<label>youtube url</label>
									<div class="form-group">
										<input value="<?php echo $sitedetails[0]['youtube_url']; ?>" required type="text" name="youtube_url" class="form-control" Placeholder="youtube_url" />
									</div>
								</div>
								<div class="col-md-12">
								<label>Description of Page : </label>
									<div class="form-group">
										<textarea style="min-height: 75px;" name="description" class="form-control htmleditor" Placeholder="Description for Page">
											<?php echo $sitedetails[0]['description']; ?>
										</textarea>
									</div>
								</div>
								<div class="col-md-12">
								<label>Keywords of Page : </label>
									<div class="form-group">
										<textarea style="min-height: 75px;" name="keyword" class="form-control htmleditor" Placeholder="Keywords for Page">
											 <?php echo $sitedetails[0]['keyword']; ?>
										</textarea>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group text-center">
										<input type="submit" name="submit" class="btn btn-success" value="Save Changes" />
									</div>
								</div>
								
							</form>
						</div>
                        <div style="clear:both;"></div>
                    </div>
                 </div>
			    <div class="row">	
					<div class="col-md-12">
							
						<div class="table-responsive">
						  <table class="table">
							<thead>
							  <tr>
								        <th> Logo</th>
										<th> Title </th>
										<th> Description </th>
										<th> Keywords  </th>
										<th> Address  </th>
										<th> Contact </th>
										<th> Email</th>
										<th> Header Color </th>
										<th> Footer Color </th>
										<th> facebook url  </th>
										<th> google url </th>
										<th> twitter url  </th>
										<th> youtube url  </th>
										<th> Added  </th>
										<th> Action </th>
							  </tr>
							</thead>
							<tbody>
							  <?php 
									
									if(!empty($sitedetails)){
									foreach ($sitedetails as $single) 
									{
									?>
									<tr>
										<td>
										<img src="<?php echo base_url($single['logo']);?>" alt="" data-retina="true" />
										</td>
										<td>
										<?php echo $single['title']; ?>
										</td>
										
										<td><?php echo $single['description']; ?></td>
										<td>
										<?php echo $single['keyword']; ?>
										</td>
										<td>
										<?php echo $single['address']; ?>
										</td>
										<td>
										<?php echo $single['contact']; ?>
										</td>
										<td>
										<?php echo $single['email']; ?>
										</td>
										<td>
										<?php echo $single['header_color']; ?>
										</td>
										<td>
										<?php echo $single['footer_color']; ?>
										</td>
										<td>
										<?php echo $single['google_url']; ?>
										</td>
										<td>
										<?php echo $single['fb_url']; ?>
										</td>
										<td>
										<?php echo $single['twit_url']; ?>
										</td>
										<td>
										<?php echo $single['youtube_url']; ?>
										</td>
										<td>
										<?php echo showtime4db($single['added']); ?>
										</td>
										
										<td>
											<form>
												<input type="hidden" name="siteid" value="<?php echo $single['id']; ?>" />
													<button class="btn-info">	
														<i class="fa fa-edit"></i>
													</button>
											</form>
										</td>
									</tr>
									
									<?php } } ?>
							</tbody>
						  </table>
						</div>
							
					</div>
			</div>
		</div>
	</section>
   
<?php
		echo	$layout['footer'];
?>

	<script>	
			$(document).ready(function(){
					$('.categorylist').DataTable();
				});
	</script>