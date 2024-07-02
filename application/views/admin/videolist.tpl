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
			<div class="col-md-12 ">
					<h3>
						<?php
								echo $data['seo']['title'];
								//print_r($video); exit;
						?>
					</h3>
					
					<table class="categorylist">
						<thead>
							<tr>
								<th>
									Index
								</th>
								<th>
									Video Category
								</th>
								<th>
									Alias <small>URL</small>
								</th>
								<th>
									Status
								</th>
								<th>
									Action
								</th>
							</tr>
						</thead>
						<tbody>
						<?php 
							$c=0;
							if(!empty($video)){
							foreach ($video as $key) 
							{
								$c++;
							?>
							<tr>
								<td>
								<?php echo $key['id']; ?>
								</td>
								<td>
								<?php echo $key['cat_title']; ?>
								</td>
								
								<td>
								<iframe width="300" height="215"
								src="<?php echo $key['alias']; ?>">
								</iframe>
								</td>
								<td>
								<?php echo $key['status']; ?>
								</td>
								<td>
								<a href="<?php echo $key['id']; ?>" ><span class="glyphicon glyphicon-edit "></span></a>&nbsp;
													
								<a href="<?php echo $key['id'];; ?>" ><span class="glyphicon glyphicon-trash"></span></a>
								</td>
							</tr>
							
							<?php } } ?>
						</tbody>
					</table>
					
					
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