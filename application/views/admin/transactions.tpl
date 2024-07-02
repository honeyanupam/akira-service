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
									S.no
								</th>
								<th>
									Post title
								</th>
								<th>
									Payment ID
								</th>
								<th>
									Email
								</th>
								
								<th>
									Name
								</th>
								<th>
									Payment Method
								</th>
								<th>
								Amount
								</th>
								<th>
								Address	
								</th>
								<th>
								Status
								</th>
							</tr>
						</thead>
						<tbody>
						<?php 
							
							if(!empty($transaction)){
								$n=0;
								//print_r($transaction);
								//exit(0);
							foreach ($transaction as $single) 
							{
								$pid = $single['pid'];
							$n++
							?>
							<tr> 
								<td>
								<?php echo $n; ?>
								</td>
								<td>
								<?php echo $single['title']; ?>
								</td>
								
								<td><?php echo $single['payment_id']; ?></td>
							
								<td>
								<?php echo $single['email']; ?>
								</td>
								<td>
								<?php echo $single['first_name'].$single['last_name']; ?>
								</td>
								<td>
								<?php echo $single['payment_method']; ?>
								</td>
								<td>
								<?php echo $single['amount']; ?>
								</td>
								<td>
								<?php echo $single['line1'].$single['city'].$single['state'].$single['postal_code'].$single['country_code']; ?>
								</td>
								<td>
								
								<?php
											$status	=	$single['status']; 
											if(!empty($single['status']))
												{
													echo "<button is_active='$status' pid='$pid' onclick='maketranisactive(this,".$pid.");' class='btn btn-success'>Active</button>";
												} else {
													echo "<button is_active='$status' pid='$pid' onclick='maketranisactive(this,".$pid.");' class='btn btn-danger'>Inactive</button>";
												}
									?> 
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
				
				 function maketranisactive(selectoris,pid)
                {
                	var pid = $(selectoris).attr("pid");
                	var is_active = $(selectoris).attr("is_active");
                	    if(is_active=='1' || is_active==1)
                	        {
								is_active = "0";
								$(selectoris).attr("is_active",is_active);
                	            $(selectoris).html("Inactive");
                	            $(selectoris).removeClass("btn-success");
                	            $(selectoris).addClass("btn-danger");
                	        } else {
								is_active = "1";
								$(selectoris).attr("is_active",is_active);
                	            $(selectoris).html("Active");
                	            $(selectoris).removeClass("btn-danger");
                	            $(selectoris).addClass("btn-success");
                	        }
									 $.ajax({
											type: "POST",  
											url: base_url_value+"admin/maketranisactive",
											data: {
												pid:pid,
												is_active:is_active
											},
											processdata:false,
											cache: false,
											success: function (tempdata) 
												{
													console.log(tempdata);  
												}
												 
											});
                }
				
				
				
	</script>