<!DOCTYPE html>
<!--[if IE 9]><html class="ie ie9"> <![endif]-->
<html lang="en"> 
<head> 
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" /> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title><?php echo $data['seo']['title']; ?></title>
	<link rel="icon" href="<?php echo WEBSITESEOIMAGE; ?>" type="image/png" sizes="16x16">
	<meta name="description" content="<?php echo $data['seo']['metadescription']; ?>" />
	<meta name="summary" content="<?php echo $data['seo']['metadescription']; ?>" />
	<meta name="keywords" content="<?php echo $data['seo']['metakeyword']; ?>" />
	<meta property="og:site_name" content="<?php echo WEBSITENAME; ?>" />
	<meta property="og:type" content="website" />
	<meta property="og:url" content="<?php echo $data['seo']['url']; ?>" />
	<meta property="og:title" content="<?php echo $data['seo']['metatitle']; ?>" />
	<meta property="og:description" content="<?php echo $data['seo']['metadescription']; ?>" />
	<meta property="og:image" content="<?php echo WEBSITEIMAGE; ?>" />
 
    <!-- Favicons-->
    <link rel="shortcut icon" href="<?php echo base_url('assets/weblayout/');?>img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="<?php echo base_url('assets/weblayout/');?>img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="<?php echo base_url('assets/weblayout/');?>img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="<?php echo base_url('assets/weblayout/');?>img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="<?php echo base_url('assets/weblayout/');?>img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE FONT -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700,300" rel="stylesheet" type="text/css">
<script src="<?php echo base_url('assets/weblayout/');?>js/jquery-2.2.4.min.js"></script>
    <!-- BASE CSS --> 
	<script src="<?php echo base_url();?>assets/commonargalon.js"></script>
    <link href="<?php echo base_url('assets/weblayout/');?>css/animate.min.css" rel="stylesheet">
    <link href="<?php echo base_url('assets/weblayout/');?>css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo base_url('assets/weblayout/');?>css/style.css?v=<?php echo md5(time()); ?>" rel="stylesheet">
    <link href="<?php echo base_url('assets/weblayout/');?>css/menu.css" rel="stylesheet">
    <link href="<?php echo base_url('assets/weblayout/');?>css/icon_fonts/css/all_icons.min.css" rel="stylesheet">
	 <link href="<?php echo base_url('assets/weblayout/');?>css/pop_up.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
    <!-- YOUR CUSTOM CSS -->
    <link href="<?php echo base_url('assets/weblayout/');?>css/custom.css" rel="stylesheet">

    <!-- Modernizr -->
    <script src="<?php echo base_url('assets/weblayout/');?>js/modernizr.js"></script>

    <!--[if lt IE 9]>
      <script src="js/html5shiv.min.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<style>
.goog-te-banner-frame{
	display:none;
}
header{
	background:#3a485140;
}
.skiptranslate span{
    display:none;
}
#google_translate_element select{
    height: 26px;
    border-radius: 4px;
    background: #3a4851;
    color: #fff;
    position: relative;
    bottom: -16px;
}
.main-menu ul li.megamenu .menu-wrapper
	{
		max-height: 550px;
		overflow-y: scroll;
		overflow-x: hidden;
		top: 30px;
		right: 30px;
		left: 0px;
		min-width: 300px;
		max-width: 100%;
	}
	

@media only screen and (max-width: 1400px)
	{	
		.main-menu ul li.megamenu .menu-wrapper
			{
				max-height: 450px;
				overflow-y: scroll;
				overflow-x: hidden;
			}
	}	
	
@media only screen and (max-width: 991px)
	{
		.cmn-toggle-switch span
			{
				top:25px;
			}	
	}
	
</style>
<body style='top:3px !important;'>

    <!--[if lte IE 8]>
        <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a>.</p>
    <![endif]-->

    <div class="layer">
	
	
	</div>
    <!-- Menu mask -->

    <!-- Header ================================================== -->
	
	
	<div style="text-align: right; background: #4b555b; margin: -11px 0 0; padding: 0 10px 6px; z-index: 999; border-bottom: 1px solid #989898;">
		<div id="google_translate_element"></div>	
	</div>	
    <header style="background-color:<?php echo $sitedetails[0]['header_color'];?>">
		
		
		
		
		
	<div style="clear:both;"></div>

        <div class="container-fluid" >
            <div class="row">
				<div class="col-md-4 col-sm-3 col-xs-4" style="text-align: center;">
                    <a class="header_logo" href="<?php echo base_url(); ?>" id="logo"><img src="<?php echo base_url($sitedetails[0]['logo']);?>" alt="" data-retina="true">
                    </a>
                </div>
                
                 <nav class="col-md-8 col-sm-9 col-xs-8" style="    padding-top: 20px;">
                    <ul id="primary_nav">
						
                        <li id="search" style='display:none;'>
                            <div class="dropdown dropdown-search">
                                <a href="<?php echo base_url();?>" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-search"></i></a>
                                <div class="dropdown-menu">
                                    <form>
                                        <div id="custom-search-input-header">
                                            <input type="text" class="form-control" placeholder="Search...">
                                            <input type="submit" class="btn_search_2" value="submit">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <a class="cmn-toggle-switch cmn-toggle-switch__htx open_close" href="javascript:void(0);"><span>Menu mobile</span></a>
                    <div class="main-menu" style="float:none;">
                        <div id="header_menu">
                            <img src="<?php echo base_url('assets/weblayout/');?>img/logo_2.png" alt="img" data-retina="true" width="170" height="30">
                        </div>
						<?php 
						
						?>
                        <a href="<?php echo base_url();?>" class="open_close" id="close_in"><i class="icon_close"></i></a>
                        <ul>
					
							
					
						<li class="submenu">
                                <a href="<?php echo base_url();?>" class="show-submenu">Home</a>
						</li>			
						<?php 
						
						
								if(!empty($getheadcategories))
									{
										foreach($getheadcategories as $single)
											{
												$subsingle	=	$single['sub'];
												$single 	=	$single['value'];
													if(!empty($subsingle))
														{
															$ismainclass 	=	"show-submenu-mega";
															$ismainhref 	=	"javascript:void(0);";
															$ismainicon 	=	'<i class="icon-down-open-mini"></i>';
															$issub		 	=	1;
														} else {
															$ismainclass 	=	"";
															$ismainhref 	=	"".base_url('category/').$single['alias']."";
															$ismainicon 	=	"";
															$issub 			=	0;
														}
								?> 
											<li class="megamenu submenu">
												<a href="<?php echo $ismainhref;?>" class="<?php echo $ismainclass; ?>">
													<?php echo $single['cat_title']; ?>
													<?php echo $ismainicon; ?>
												</a>
														<?php 
																if($issub)
																		{
																			$run = 0;
																			echo '<div class="menu-wrapper">';
																			foreach($subsingle as $sinsub)
																					{
																						$subsubsingle	=	$sinsub['sub'];
																						$sinsub 		=	$sinsub['value'];
														?>
																				<div class="col-md-4">
																					<h4 style='line-height: 0.2;'><a href="<?php echo base_url('category/').$sinsub['alias'];?>"><?php echo $sinsub['cat_title']; ?></a></h4>
																					
																						<?php
																								if(!empty($subsubsingle))
																									{
																										echo '<ul>';
																										foreach($subsubsingle as $sinsubsub)
																											{
																												$sinsubsub	=	$sinsubsub['value'];
																												echo '<li><a href="'.base_url("category/").$sinsubsub['alias'].'">'.$sinsubsub['cat_title'].'</a></li>';
																											}
																										echo '</ul>';
																									}
																						?>
																				</div> 

														<?php	
																$run++;
																if($run%3==0)
																	{
																		echo '<div style="clear:both;"></div>';
																	}
														
																					}
																			?>
																					<div style="clear:both;"></div>
																			</div>
																			<?php	
																		}
														?>
											<!-- End menu-wrapper -->
											</li>
								<?php								
												
											}
									} 
									
									
									
									
						
						?>	
							</ul>
                    </div>
                    <!-- End main-menu -->
                </nav>
					
				<div style="clear:both;"></div>
            </div>
            <!-- End row -->
        </div>
        <!-- End container -->
		
    </header>