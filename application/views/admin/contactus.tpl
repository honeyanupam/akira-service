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
									Name
								</th>
								<th>
									Email
								</th>
								<th>
									Mobile 
								</th>
								<th>
									Message
								</th>
								<th>
									View Post
								</th>
								<th>
									Received On
								</th>
								<th>
									Received from IP
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
								<?php echo $single['firstname']; ?> <?php echo $single['lastname']; ?>
								</td>
								
								<td><a href='mailto:<?php echo $single['email']; ?>'><?php echo $single['email']; ?></a></td>
								<td>
								<?php echo $single['contactno']; ?>
								</td>
								<td>
								<?php echo $single['message']; ?>
								</td>
								<td>
								<a target='_blank' class='btn btn-info' href='<?php echo $single['businessurl']; ?>'><?php echo $single['businesstitle']; ?></a>
								</td>
								<td>
								<?php echo $single['added']; ?>
								</td>
								<td>
								<a target='_BLANK' href='https://whatismyipaddress.com/ip/<?php echo $single['ip']; ?>'><b><?php echo $single['ip']; ?></b></a>
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