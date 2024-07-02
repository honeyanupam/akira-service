<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['front']				 =  'Front/index';

$route['default_controller'] =  'Front';


 // front panel
		$route['category/(:any)']			=	'Front/categorynews/$1/0';
		$route['category/(:any)/(:any)']	=	'Front/categorynews/$1/$2';
		
		
		$route['news/(:any)/(:any)']		=	'Front/singlenews/$2';
 // front panel
 
 
 // admin panel
		$route['admin']						=	'information/index';
		$route['admin/category']			=	'information/catlist';
		$route['admin/sitepages']			=	'information/sitepages';
		$route['admin/news']				=	'information/newslist';
		$route['admin/video']    			=   'information/videolist';
		$route['admin/makectgisactive']    	=   'information/makectgisactive';
		$route['admin/makenewsisactive']    =   'information/makenewsisactive';
		$route['admin/makenewsisfeatured']  =   'information/makenewsisfeatured'; 
		$route['admin/maketranisactive']    =   'information/maketranisactive';

		$route['admin/customers']  			=   'information/customers';
		$route['admin/enquiry']  			=   'information/enquiry';
		$route['admin/newsletter']  			=   'information/newsletter';		
		$route['admin/sitedetails']  		=   'information/sitedetails'; 
		$route['admin/settings']  			=   'information/settings'; 

		$route['admin/reviews']  			=   'information/reviews'; 
		$route['admin/reviewstatus']		=   'information/reviewstatus'; 
		$route['admin/transaction']			=   'information/transaction'; 
		$route['admin/tickets']				=   'information/tickets';

		
		$route['m/home']					=   'mobile/home'; 
		$route['m/enquiry']					=   'mobile/enquiry'; 
		$route['m/enquirylist']				=   'mobile/enquirylist'; 
		$route['m/login']					=   'mobile/login'; 
		$route['m/register']				=   'mobile/register'; 
		$route['m/change_password']			=   'mobile/change_password'; 
		$route['m/get_profile']				=   'mobile/get_profile'; 
		$route['m/forgot']					=   'mobile/forgot'; 
		$route['m/cities']					=   'mobile/cities'; 
		$route['m/provider_login']			=   'mobile/provider_login';   
		$route['m/provider_register']		=   'mobile/provider_register'; 
		$route['m/provider_change_password']=   'mobile/provider_change_password'; 
		$route['m/provider_get_profile']	=   'mobile/provider_get_profile'; 
		$route['m/provider_edit_profile']	=   'mobile/provider_edit_profile'; 
		$route['m/provider_forgot']			=   'mobile/provider_forgot'; 
		$route['m/provider_info']			=   'mobile/provider_info'; 
		$route['m/provider_enquiry_list']	=   'mobile/provider_enquiry_list'; 
		$route['m/provider_request']		=   'mobile/provider_request'; 
		$route['m/sitepages']				=   'mobile/sitepages'; 
		$route['m/profile_image']			=   'mobile/profile_image';   
		$route['m/edit_profile']			=   'mobile/edit_profile';   
		$route['m/user_info']			=   'mobile/user_info';   


 // admin panel


$route['404_override'] = 'Front/error404';
$route['translate_uri_dashes'] = FALSE;
