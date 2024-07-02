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
									Service Type
								</th>
								<th>
									Full Name
								</th>
								<th>
									Mobile 
								</th>
								<th>
									Service Date
								</th>
								<th>
									Start Time
								</th>
								<th>
									End Time
								</th>
								<th>
									City
								</th>
								<th>
									Landmark
								</th>
								<th>
									Address
								</th>
								<th>
									Device ID
								</th>
							</tr>
						</thead>
						<tbody>
						<?php 
							
							if(!empty($enquiry)){
							foreach ($enquiry as $single) 
							{
							?>
							<tr>
								<td>
								<?php echo $single['id']; ?>
								</td>
								<td>
								<?php echo $single['fullname']; ?>
								</td>
								<td>
								<?php echo $single['mobile']; ?>
								</td>
								<td>
								<?php echo $single['service_date']; ?>
								</td>
								<td>
								<?php echo $single['start_time']; ?>
								</td>
								<td>
								<?php echo $single['end_time']; ?>
								</td>
								<td>
								<?php echo $single['city']; ?>
								</td>
								<td>
								<?php echo $single['landmark']; ?>
								</td>
								<td>
								<?php echo $single['address']; ?>
								</td>
								<td>
								<?php echo $single['device']; ?>
								</td>
								<td>
								<?php echo $single['create_on']; ?>
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