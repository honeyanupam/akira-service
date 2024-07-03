<!DOCTYPE html>
<html lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  
   
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title><?php echo $data['seo']['title']; ?></title>
  <link rel="icon" href="<?php echo site_url(); ?>icon.png" type="image/png" sizes="16x16">
	<meta name="description" content="<?php echo $data['seo']['metadescription']; ?>" />
	<meta name="keyword" content="<?php echo $data['seo']['metatitle']; ?>" />
	<meta property="og:site_name" content="<?php echo WEBSITENAME; ?>" />
	<meta property="og:type" content="website" />
	<meta property="og:url" content="<?php echo $data['seo']['url']; ?>" />
	<meta property="og:title" content="<?php echo $data['seo']['metatitle']; ?>" />
	<meta property="og:description" content="<?php echo $data['seo']['metadescription']; ?>" />
	<meta property="og:image" content="<?php echo WEBSITEIMAGE; ?>" />

  <!-- Bootstrap Styles -->
  
  <link href="<?php echo base_url()."assets/front/" ?>css/bootstrap.css" rel="stylesheet">
  <!-- Styles -->
  <link href="<?php echo base_url()."assets/front/" ?>style.css" rel="stylesheet">
  
  <!-- Carousel Slider -->
  <link href="<?php echo base_url()."assets/front/" ?>css/owl-carousel.css" rel="stylesheet">
  
  <!-- CSS Animations -->
  <link href="<?php echo base_url()."assets/front/" ?>css/animate.min.css" rel="stylesheet">
  
  <!-- Google Fonts -->
  <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Lato:400,300,400italic,300italic,700,700italic,900' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Exo:400,300,600,500,400italic,700italic,800,900' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" id="switcher-css" type="text/css" href="<?php echo base_url()."assets/front/" ?>switcher/css/switcher.css" media="all" />
 <link rel="alternate stylesheet" type="text/css" href="<?php echo base_url()."assets/front/" ?>switcher/css/yellow.css" title="yellow" media="all" />
  <!-- SLIDER ROYAL CSS SETTINGS -->
  <link href="<?php echo base_url()."assets/front/" ?>royalslider/royalslider.css" rel="stylesheet">
  <link href="<?php echo base_url()."assets/front/" ?>royalslider/skins/default-inverted/rs-default-inverted.css" rel="stylesheet" />
  
  <!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
  <link rel="stylesheet" type="text/css" href="<?php echo base_url()."assets/front/"; ?>rs-plugin/css/settings.css" media="screen" />
  <!-- Support for HTML5 -->
  <!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

  <!-- Enable media queries on older bgeneral_rowsers -->
  <!--[if lt IE 9]>
    <script src="js/respond.min.js"></script>  <![endif]-->
	<style> 
		.hactive{ 
			background-color: #f7c221;
			color: #fff !important;
			-webkit-border-radius: 03px;
			-moz-border-radius: 03px;
			border-radius: 03px !important;
			} 
			
		.mce-notification-warning
		    {
		        display:none !important;
		    }
	</style>
	
	
	<script src="<?php echo base_url()."assets/front/" ?>js/jquery.js"></script>
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
	
	<script src="<?php echo base_url()."assets/front/" ?>js/bootstrap.min.js"></script>
	<script src="<?php echo base_url();?>/assets/commonargalon.js"></script>
	<link href="<?php echo base_url()."assets/front/" ?>custom.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css"/>


	<link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/cupertino/jquery-ui.css" rel="stylesheet" />
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css" />
	<link rel="stylesheet" href="<?php echo base_url()."assets/front/" ?>multi-select.css" />
	<!--script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=efdukeb6xumlgzimkw9nygoqr7rbma1npwvn5vlc0cutjv74"></script-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/5.1.2/tinymce.min.js"></script>
	
</head>
<body>     


    
    <header id="header-style-1">
		<div class="container">
			<nav class="navbar yamm navbar-default">
				<!--div class="navbar-header">
                    <button type="button" data-toggle="collapse" data-target="#navbar-collapse-1" class="navbar-toggle">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="<?php echo base_url('admin'); ?>" class="navbar-brand1">
						<img src="<?php echo WEBSITEIMAGE; ?>" style="margin-top: -10px; margin-bottom: -10px; max-height: 70px;" />
					</a>
				</div--><!-- end navbar-header -->
               
				<div id="navbar-collapse-1" class="navbar-collapse collapse navbar-right">
					<ul class="nav navbar-nav">
						<li class="yamm-fw">
							<a href="<?php echo base_url("information/dashboard"); ?>">Dashboard</a>
						</li>
						<li>
							<a href="<?php echo base_url('admin/category'); ?>">Categories</a>
						</li>
						<li> 
							<a href="<?php echo base_url('admin/customers/'); ?>">Customers</a>
						</li>
						<li> 
							<a href="<?php echo base_url('admin/enquiry/'); ?>">Enquiry Request</a>
						</li>
						
						
						<li class="dropdown">
							<a href="#" data-toggle="dropdown" class="dropdown-toggle">Quick Links <div class="arrow-up"></div></a>					
							<ul class="dropdown-menu" role="menu">
									<li>
										<a href="<?php echo base_url('admin/sitepages/'); ?>"> Site Pages</a>  
									</li>
									<li>
										<a href="<?php echo base_url('admin/settings/'); ?>"> Settings</a>  
									</li>
							</ul>
						</li>
						
				<?php
					if($checklogin)
							{
				?>
                        <li>
							<a href="<?php echo base_url('information/logout'); ?>">Logout</a>
						</li>
				<?php
							} else {
				?>
                        <li>
							<a href="<?php echo base_url('information'); ?>">Login</a>
						</li>
				<?php
							}
				?>
					</ul><!-- end navbar-nav -->
				</div><!-- #navbar-collapse-1 -->			</nav><!-- end navbar yamm navbar-default -->
		</div><!-- end container -->
	</header><!-- end header-style-1 --> 