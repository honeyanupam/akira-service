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
				
					<table class="reviewlist">
						<thead>
							<tr>
								<th>
									News Title
								</th>
								<th>
									Name
								</th>
								<th>
									Email
								</th>
								<th>
									Rating
								</th>
								<th>
									Review
								</th>
								<th>
									Status
								</th>
								<th>
									Received on
								</th>
							</tr>
						</thead>
						<tbody>
						<?php 
							
							if(!empty($reviewlist)){
							foreach ($reviewlist as $single) 
							{
							?>
							<tr>
								<td>
								<a target='_blank' class='btn btn-info' href='<?php echo base_url('news'); ?>/<?php echo $single['alias']; ?>/<?php echo $single['newsid']; ?>'><?php echo $single['title']; ?></a>
								</td>
								<td>
								<?php echo $single['name']; ?>
								</td>
								
								<td><?php echo $single['email']; ?></td>
								<td style='min-width: 110px;'>
								<?php $starNumber = $single['vote'];

											for($x=1;$x<=$starNumber;$x++) {
													echo '<img src="'.base_url('uploads/star.png').'" style="max-width: 20px;" title="'.$starNumber.'" />';
												}
												if (strpos($starNumber,'.')) {
													echo '<img src="'.base_url('uploads/halfstar.png').'" style="max-width: 20px;" title="'.$starNumber.'" />';
													$x++;
												} 
								?>
								</td>
								<td>
								<?php echo $single['review']; ?>
								</td>
								<td>
								<?php
											$status	=	$single['status']; 
											$id		=	$single['id']; 
											if(!empty($single['status']))
												{
													echo "<button is_active='$status' statusid='$id' onclick='reviewstatus(this);' class='btn btn-success'>Active</button>";
												} else {
													echo "<button is_active='$status' statusid='$id' onclick='reviewstatus(this);' class='btn btn-danger'>Inactive</button>";
												}
									?> 
								</td>
								<td>
								<?php echo showtime4db($single['added']); ?>
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
					$('.reviewlist').DataTable();
				});
	</script>