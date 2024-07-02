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

					<table class="categorylist">
						<thead>
							<tr>
								<th>
									ID
								</th>
								
								<th>
									Email
								</th>
								
								<th>
									Received On
								</th>
								
							</tr>
						</thead>
						<tbody>
						<?php 
							
							if(!empty($newsletter)){
							foreach ($newsletter as $single) 
							{
							?>
							<tr>
								<td>
								<?php echo $single['id']; ?>
								</td>
								
								
								<td><?php echo $single['sub_email']; ?></td>
								
								<td>
								<?php echo $single['added']; ?>
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