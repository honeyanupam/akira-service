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
									S.NO
								</th>
								<th>
									Full Name
								</th>
								<th>
									Email 
								</th>
								<th>
									Mobile
								</th>
								<th>
									Address
								</th>
								<th>
									Status
								</th>
								<th>
									Created Date
								</th>
							</tr>
						</thead>
						<tbody>
						<?php 
							
							if(!empty($customer)){
							foreach ($customer as $single) 
							{
							?>
							<tr>
								<td>
								<?php echo $single['id']; ?>
								</td>
								<td>
								<?php echo $single['name']; ?>
								</td>
								<td>
								<?php echo $single['email']; ?>
								</td>
								<td>
								<?php echo $single['mobileno']; ?>
								</td>
								<td>
								<?php echo $single['address']; ?>
								</td>
								<td>
								<?php echo $single['status']; ?>
								</td>
								<td>
								<?php echo $single['created_on']; ?>
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