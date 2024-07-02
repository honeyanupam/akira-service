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
	
				<div class="addvideoform" style="<?php if(empty($pageid)) { echo " display:none; "; } ?>">
                    <div class="row">
                        <form method="POST">
							<input value="<?php echo $pageid; ?>" required type="hidden" name="pageid" />
                            <div class="col-md-12">
							<label>Title of Page : </label>
                                <div class="form-group">
                                    <input value="<?php echo $title; ?>" required type="text" name="title" class="form-control" Placeholder="Title for Page" />
                                </div>
                            </div>
							
                           <div class="col-md-12">
								<label>Meta Title of Page : </label>
                                <div class="form-group">
                                    <input value="<?php echo $metatitle; ?>" required type="text" name="metatitle" class="form-control" Placeholder="Meta Title of Page" />
                                </div>
                            </div>
                           <div class="col-md-12">
						   	<label>Meta Description of Page : </label>
                                <div class="form-group">
                                    <input value="<?php echo $metadescription; ?>" required type="text" name="metadescription" class="form-control" Placeholder="Meta Description of Page" />
                                </div>
                            </div>
                            <div class="col-md-12">
                           	<label>Content of Page : </label>
                                <div class="form-group">
                                    <textarea style="min-height: 75px;" name="description" class="form-control htmleditor" Placeholder="Content for Page">
                                        <?php echo $description; ?>
                                    </textarea>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group text-center">
                                    <input type="submit" name="submit" class="btn btn-success" value="Save Changes" />
                                </div>
                            </div>
							
                        </form>
                        <div style="clear:both;"></div>
                    </div>
                 </div>
			    <div class="container">	
			<div class="col-md-12">
					
					<table class="categorylist">
						<thead>
							<tr>
								<th> ID</th>
								<th> Title </th>
								<th> Meta Title </th>
								<th> Meta Description </th>
								<th> Action </th>
							</tr>
						</thead>
						<tbody>
						<?php 
							
							if(!empty($sitepages)){
							foreach ($sitepages as $single) 
							{
							?>
							<tr>
								<td>
								<?php echo $single['id']; ?>
								</td>
								<td>
								<?php echo $single['title']; ?>
								</td>
								
								<td><?php echo $single['metatitle']; ?></td>
								<td>
								<?php echo $single['metadescription']; ?>
								</td>
								<td>
								<form>
										<input type="hidden" name="pageid" value="<?php echo $single['id']; ?>" />
											<button class="btn-info">	
												<i class="fa fa-edit"></i>
											</button>
									</form>
								</td>
							</tr>
							
							<?php } } ?>
						</tbody>
					</table>
					
					
			</div><!-- end container -->
			</div><!-- end container -->
		</div><!-- end white-wrapper -->
	</section><!-- end blog-wrapper -->
   
<?php
		echo	$layout['footer'];
?>

	<script>	
			$(document).ready(function(){
					$('.categorylist').DataTable();
				});
	</script>