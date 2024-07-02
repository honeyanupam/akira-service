<?php
/* echo "<pre>";
print_r($categories);
echo "</pre>"; */


?>

<?php
		echo	$layout['header'];
?> 
	<style>
	.buttons-csv {
    background: #c62727;
    color: #fff;
    transition: 0.35s;
}
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
  -webkit-appearance: none; 
  margin: 0; 
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
	</section><!-- end post-wrapper-top -->
	<section class="blog-wrapper">
		<div class="container">
				<div class="col-md-12 text-center">
					<?php
							echo $addupmessage;
					?>
				</div>
				
				<div class="col-md-12 text-right1">
				
					<div class="col-md-9">
						<form method="POST" name="srhform">
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label> Keyword </label>
											<input value="<?php echo $srhkeyword; ?>" type="text" name="srhkeyword" class="form-control srhkeyword" placeholder="Keyword to Search" />
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label> Category</label>
										
								<select name='subcategory' class="form-control subcategory srhcategory" name="srhcategory" >
								<option value='0'>Selected</option>
								<?php	// echo $subcategory;
								
								 if(!empty($allcategories)){
									foreach($allcategories as $single)
										{
											$subsingle 	 = $single['sub'];
											$childsingle = $single['sub'];
											
											$single 	 = $single['value'];
												
													 if(!empty($subsingle))
														{
															echo '<optgroup label="'.$single['cat_title'].'">';
																foreach($subsingle as $subsingle1)
																	{
																		//print_r($subsingle1);
																		$subsingle2 = $subsingle1['value'];
																		echo "<option ".isselected($srhcategory,$subsingle2['cat_id'])." value=".$subsingle2['cat_id']." >".$subsingle2['cat_title']."</option>";
																		$subsinglesub = $subsingle1['sub'];
																		foreach($subsinglesub as $childcate){
																			$childcate2 = $childcate['value'];
																			echo "<option ".isselected($srhcategory,$childcate2['cat_id'])." value=".$childcate2['cat_id']." >"."&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='color:#333;' class='fa fa-arrow-circle-right' ></i> ".$childcate2['cat_title']."</option>";
																		}
																	}
															echo '</optgroup>';
														}
										}
								}
								?>
								
								</select>
									</div>
								</div>
								<div class="col-md-4">
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
						<button class="btn btn-info" onclick="$('.adfrmnewsform').toggle();$('#adfrmnewsform input').val('');$('#adfrmnewsform textarea').val('');$('.newsid').val(0);$('.disbtn').val('Add Business');">
							 Add Business 
						</button>
						<a onclick="$('.addnewscsv').toggle();" class="btn btn-warning">Upload CSV Files</a>
					</div>	
							<div style="clear:both;"></div>	
				
				</div>
				<?php
						$newsid 					=	$this->input->get('newsid');
							if(!empty($newsid))
								{ 
									$disbtn = "Update Business";
									$disfrm = "display:block;";
								} else {
									$disbtn = "Add Business";
									$disfrm = "display:none;";
								} 
				?>
			<div class="addnewscsv" style="display:none;">
					<div class="row">
						<div class="col-sm-12">
						
						
											<div class="block-content-inner admin-blade-dropdown" style="text-align:center">
												<div style="padding:10px;" class="col-md-4">
													<h3> Step 1: </h3> 
														Please download the sample file. Don't modilfy the first row.
														<br/><br/> <!-- studentCsvFile/student.csv -->
													<a href='<?php echo base_url('assets/sample.csv');?>' class='btn btn-info btn-sm'>Download File</a> 
														<br/>
												</div>
												
												<div style="padding:10px;" class="col-md-4">
													<h3> Step 2: </h3>
														Fill all the relevant Business information and save the file as CSV file.
														<br/>
												</div> 
												
												<div style="padding:10px;" class="col-md-4">

													<h3> Step 3: </h3>
														Upload the CSV file with Business information and press the Import Data button to complete. <br/><br/>
													<form method="post" enctype="multipart/form-data">
															<input type="file" name="csv" class='form-control' value="" /> 
															<br/>
															<p style="color:red"></p>
															<button type="submit" class='btn btn-primary' name="submitcsv" ><i class='fa fa-upload'> Import Data</i></button>
													</form><br>
													
												</div>
																	
									
					</div>
					</div>
					</div>
						<hr/>		
					</div>
							
			
			<div class="col-md-12 adfrmnewsform" style="<?php echo $disfrm; ?>">
				<form action="<?php echo site_url("admin/news"); ?>" id="adfrmnewsform" method="POST" name="adfrmnewsform">
				
					<input type="hidden" name="newsid" class="newsid" value="<?php echo $newsid; ?>"/>
				
				<h3> Add Business </h3>
				
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label> Title </label>
								<input value="<?php echo $news_title; ?>" required type="text" name="news_title" class="form-control news_title" placeholder="Business Title" />
							</div>
							<div class="form-group">
								<label> URL </label>
								<input value="<?php echo $news_alias; ?>" required type="text" name="news_alias" class="form-control news_alias usernamecheck" placeholder="Business URL" />
							</div> 
						</div> 
						<div class="col-md-6">
							<div class="form-group">
								<label> Meta Title </label>
								<input value="<?php echo $news_meta_title; ?>" type="text" required type="text" name="news_meta_title" class="form-control news_meta_title" placeholder="Meta Title" />
							</div>

							<div class="form-group">
								<label> Meta Description / Short NEWS Description </label>
								<textarea  name="news_meta_description" class="form-control news_meta_description" required placeholder="Meta Description / Short Business Description"><?php echo $news_meta_description; ?></textarea>
							</div>
							
							<div class="form-group">
								<label> Meta Keyword </label>
								<textarea  name="news_keyword" class="form-control keyword" required placeholder="Meta Keyword / Short Business keyword"><?php echo $news_keyword; ?></textarea>
							</div>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
							
							<?php
									$catagoriesarr = array();
										if(!empty($categories))
											{
												foreach($categories as $singlecate)
													{
														$catagoriesarr[] = $singlecate['cat_id'];
													}
											}
							?>
							
								<label> Select Category </label>
								<select required multiple="multiple" id="my-select" name="my-select[]">
								  
									<?php	// echo $subcategory;
								
								 if(!empty($allcategories)){
									foreach($allcategories as $single)
										{
											$subsingle 	 = $single['sub'];
											$childsingle = $single['sub'];
											
											$single 	 = $single['value'];
												
													 if(!empty($subsingle))
														{
															echo '<optgroup label="'.$single['cat_title'].'">';
																foreach($subsingle as $subsingle1)
																	{
																		$subsingle2 = $subsingle1['value'];
																		$forselcat = '';
																		echo "<option ".$forselcat." value=".$subsingle2['cat_id']." >".$subsingle2['cat_title']."</option>";
																		$subsinglesub = $subsingle1['sub'];
																		foreach($subsinglesub as $childcate){
																			if (in_array($childcate['cat_id'], $catagoriesarr))
																		{
																			$forselcat = "selected='selected'";
																		} else {
																			$forselcat = "";
																		} 
																			$childcate2 = $childcate['value'];
																			echo "<option ".$forselcat." value=".$childcate2['cat_id']." >"."&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='color:#333;' class='fa fa-arrow-circle-right' ></i> ".$childcate2['cat_title']."</option>";
																		}
																	} 
															echo '</optgroup>';
														}
										}
								}
								?>		
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="col-md-6">	
								<div class="form-group">
									<label> Select Date For Business</label>
									<div class="form-control-wrapper">
										<input readonly value="<?php echo date("Y-m-d"); ?>" required name="newsdate" type="text" class="form-control newsdate" placeholder="Date for Business">
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group"> 
									<label> Select Time For Business</label>
									<div class="form-control-wrapper">
										<input readonly value="<?php echo date("H:i:s"); ?>" required name="newstime" type="text" class="form-control newstime" placeholder="Time for Business" />
									</div>
								</div>
							</div>
				
							<div class="col-md-6">
								<div class="form-group">
									<label> Status </label>
									<select name="news_status" class="form-control news_status">
										<option <?php echo isselected('1',$news_status); ?> value="1">Active</option>
										<option <?php echo isselected('0',$news_status); ?> value="0">Inactive</option>
									</select>
								</div>
							</div>	
							<div class="col-md-6">
								<div class="form-group">
									<label> Featured </label>
									<select name="key_feature" class="form-control key_feature">
										<option <?php echo isselected('1',$news_featured); ?> value="1">Yes</option>
										<option <?php echo isselected('0',$news_featured); ?> value="0">No</option>
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label> Image </label>
								<input type="file"  accept="image/8"  name="userfiles" class="form-control userfiles" onchange="uploadmulptipleme();" />
									
									<fileresponse></fileresponse>
									
									<?php
											$allimage = "";
													if(!empty($newsimages))
														{
															foreach($newsimages as $singleimg)
																{
																	$allimage .= $singleimg['url'].",";
																}
														}	
									?>
									
									<textarea style="display:none;" name="allimage" class="allimage"><?php echo $allimage; ?></textarea>
							</div>
						
										
						</div>
						<div style="clear:both";></div>
					</div>
				
					<div class="row">
						
						<div class="col-md-12">
						<div class="form-group">
								<label> Description </label>
								<textarea style="min-height: 140px;"  name="news_description" class="form-control news_description htmleditor" placeholder="Business Description"><?php echo $news_description; ?></textarea>
							</div>
						</div>
						
					
						
					<div style="clear:both;"></div>
					 
					</div>
					
						<div class="col-md-12">
						
							<div class="form-group">
								<label>Show Address </label>
								<input value="<?php echo $address; ?>"  type="text" name="address" class="form-control " placeholder="Your Want To Show Address" />
							</div>

					
						</div>	
					
						<div onclick="$('.ticket_div').toggle();" style="cursor:pointer;"><b> Do you want to add tickets?</b></div>
						<div class="ticket_div" style="display:block;">
						<div class="row">
						<center> <h4><b>Enter Ticket</b></h4></center>
						<div class="col-md-5">
							<div class="form-group">
								<label> Ticket Title	</label> 	
								<input value="" required type="text" name="ticket_title[]" class="form-control news_title" placeholder="Ticket Title" />
							</div>
							<div class="form-group">
								<label> Quantity </label>
								<input value="" required type="number" name="ticket_quantity[]" class="form-control" placeholder="Quantity" />
							</div> 
						
						</div> 
						
						<div class="col-md-5">
							

							<div class="form-group">
								<label>  Description </label>
								<textarea  name="ticket_description[]" class="form-control news_meta_description" required placeholder="Ticket Description"></textarea>
							</div>
							
							<div class="form-group">
								<label>Price </label>
								<input value="" required type="number" name="ticket_price[]" class="form-control " placeholder="Price" />
							</div>
						</div>
						<i class="fa fa-plus-circle div2 col-md-2 col-sm-6 col-xs-12"  id="div2"></i>
						</div>
						
						
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label style="display:block"> &nbsp; </label>
								<input type="submit" class="btn btn-lg btn-primary disbtn" value="<?php echo $disbtn; ?>" />	
							</div>
						</div>
						<div style="clear:both;"></div>
			 
					
				</form>
				
			</div>
			
			<div class="col-md-12 ">
			<?php 
					if(isset($uploadflatdata['message'])){
									if($uploadflatdata['status']==0){
										echo '<b><div class="alert alert-danger">
										 '.$uploadflatdata['message'].'
										</div></b>';
									}else{
										echo '<b><div class="alert alert-success">
										 '.$uploadflatdata['message'].'
										</div></b>';
									} 
								}	
			?>
					<h3>
						<?php
							echo $data['seo']['title'];
						?>
					</h3>
					
					<table id="example" class="newslist">
						<thead>
							<tr>
								<th>
									ID
								</th>
								
								<th>
									Category
								</th>
								<th>
									Business Title
								</th>
								<th>
									Status
								</th>
								<th>
									Featured
								</th>
								
								<th>
									Action
								</th>
							</tr>
						</thead>
						<tbody>
						<?php 
							$c=0;
							if(!empty($news)){
							foreach ($news as $key) 
							{
								$news_id = $key['Id'];
								$c++;
							?>
							<tr>
								<td>
								<?php echo $c; ?>
								</td>
								
								<td>
								<?php // echo "<pre>"; print_r($key); echo "<pre>"; 
									echo $key['cat_title']; ?>
								</td>
								<td>
								<?php echo $key['title']; ?>
								</td>
								<td>
								<?php
											$status	=	$key['status']; 
											if(!empty($key['status']))
												{
													echo "<button is_active='$status' newsid='$news_id' onclick='makenewsisactive(this);' class='btn btn-success'>Active</button>";
												} else {
													echo "<button is_active='$status' newsid='$news_id' onclick='makenewsisactive(this);' class='btn btn-danger'>Inactive</button>";
												}
									?>
								</td>
								
								<td>
								<?php
											$key_feature	=	$key['key_feature']; 
											if(!empty($key['key_feature']))
												{
													echo "<button is_active='$key_feature' newsid='$news_id' onclick='makenewsisfeatured(this);' class='btn btn-success'>Featured</button>";
												} else {
													echo "<button is_active='$key_feature' newsid='$news_id' onclick='makenewsisfeatured(this);' class='btn btn-danger'>Not Featured</button>";
												}
									?>
								</td>
								
								<td>
									<form>
										<input type="hidden" name="newsid" value="<?php echo $news_id; ?>" />
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
		</div><!-- end white-wrapper -->
	</section><!-- end blog-wrapper -->
   
<?php
		echo	$layout['footer'];
?>

<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script> 
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script> 
<script>
$(document).ready(function() {
    $('#example').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            'csv'
        ]
    } );
} );


</script>

<script>	
$(document).ready(function() {
					$( ".newstime" ).timepicker({
											timeFormat: 'HH:mm:ss',
											interval: 15,
											minTime: '07',
											maxTime: '21',
											dynamic: true,
											dropdown: true,
											scrollbar: true
										});
					$( ".newsdate" ).datepicker(
								{
									changeMonth: true,
									changeYear: true,
									showButtonPanel: true,
									dateFormat: 'yy-mm-dd'
								}
						);
				$('#my-select').multiSelect()
				});
				
									 	
$(function() {

    var max_fields      = 5; //maximum input boxes allowed
    var wrapper         = $(".ticket_div"); //Fields wrapper
    var add_button      = $(".div2"); //Add button ID
    
    var x = 1; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
        if(x < max_fields)
		{ //max input box allowed
            x++; //text box increment
            $(wrapper).append('	<div class="row"><div class="col-md-5"><div class="form-group"><label> Ticket Title	</label> 	<input value="" required type="text" name="ticket_title[]" class="form-control news_title" placeholder="Ticket Title" /></div><div class="form-group"><label> Quantity </label><input value="" required type="number" name="ticket_quantity[]" class="form-control" placeholder="Quantity" /></div> </div> <div class="col-md-5"><div class="form-group"><label>  Description </label><textarea  name="ticket_description[]" class="form-control news_meta_description" required placeholder="Ticket Description"></textarea></div><div class="form-group"><label>Price </label><input value="" required type="number" name="ticket_price[]" class="form-control " placeholder="Price" /></div></div><a href="#" class="remove_field "><i class="fa fa-times-circle"></i></a></div>'); //add input box
        }
    });
   
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
    })
		
});
		
	</script>
	