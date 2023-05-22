<?php
// *	@copyright	OPENCART.PRO 2011 - 2017.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['scripts'] = $this->document->getScripts('footer');

		$data['base'] = $server;
		$data['home'] = $this->url->link('common/home');
		// $data['text_service'] = $this->language->get('text_service');
		// $data['text_information'] = $this->language->get('text_information');
		// $data['text_extra'] = $this->language->get('text_extra');
		// $data['text_contact'] = $this->language->get('text_contact');
		// $data['text_return'] = $this->language->get('text_return');
		// $data['text_sitemap'] = $this->language->get('text_sitemap');
		// $data['text_manufacturer'] = $this->language->get('text_manufacturer');
		// $data['text_voucher'] = $this->language->get('text_voucher');
		// $data['text_affiliate'] = $this->language->get('text_affiliate');
		// $data['text_special'] = $this->language->get('text_special');
		// $data['text_bestseller'] = $this->language->get('text_bestseller');
		// $data['text_mostviewed'] = $this->language->get('text_mostviewed');
		// $data['text_latest'] = $this->language->get('text_latest');
		// $data['text_account'] = $this->language->get('text_account');
		// $data['text_order'] = $this->language->get('text_order');
		// $data['text_wishlist'] = $this->language->get('text_wishlist');
		// $data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_copyright'] = $this->config->get('config_comment');
		$data['link_facebook'] = $this->config->get('config_facebook');
		$data['link_youtube'] = $this->config->get('config_youtube');
		$data['link_instagram'] = $this->config->get('config_instagram');
		$this->load->model('catalog/information');

		// $data['informations'] = array();

		// foreach ($this->model_catalog_information->getInformations() as $result) {
		// 	if ($result['bottom']) {
		// 		$data['informations'][] = array(
		// 			'title' => $result['title'],
		// 			'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
		// 		);
		// 	}
		// }

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		// $data['contact'] = $this->url->link('information/contact');
		// $data['return'] = $this->url->link('account/return/add', '', true);
		// $data['sitemap'] = $this->url->link('information/sitemap');
		// $data['manufacturer'] = $this->url->link('product/manufacturer');
		// $data['voucher'] = $this->url->link('account/voucher', '', true);
		// $data['affiliate'] = $this->url->link('affiliate/account', '', true);
		// $data['special'] = $this->url->link('product/special');
		// $data['bestseller'] = $this->url->link('product/bestseller');
		// $data['mostviewed'] = $this->url->link('product/mostviewed');
		// $data['latest'] = $this->url->link('product/latest');
		// $data['account'] = $this->url->link('account/account', '', true);
		// $data['order'] = $this->url->link('account/order', '', true);
		// $data['wishlist'] = $this->url->link('account/wishlist', '', true);
		// $data['newsletter'] = $this->url->link('account/newsletter', '', true);
		$data['search'] = $this->load->controller('common/search');

		
		$data['address'] = nl2br($this->config->get('config_address'));
		$data['telephone'] = $this->config->get('config_telephone');

		// $data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		

		// Menu
		$this->load->model('design/custommenu');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$data['categories'] = array();
		if ($this->config->get('configcustommenu_custommenu')) {
		$custommenus = $this->model_design_custommenu->getcustommenus();
        $custommenu_child = $this->model_design_custommenu->getChildcustommenus();
        foreach($custommenus as $id => $custommenu) {
			$children_data = array();
			foreach($custommenu_child as $child_id => $child_custommenu) {
                if (($custommenu['custommenu_id'] != $child_custommenu['custommenu_id']) or !is_numeric($child_id)) {
                    continue;
                }
                $child_name = '';
                if (($custommenu['custommenu_type'] == 'category') and ($child_custommenu['custommenu_type'] == 'category')){
                    $filter_data = array(
                        'filter_category_id'  => $child_custommenu['link'],
                        'filter_sub_category' => true
                    );
                    $child_name = ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : '');
                }
                $children_data[] = array(
                    'name' => $child_custommenu['name'] . $child_name,
                    'href' => $this->getcustommenuLink($custommenu, $child_custommenu)
                );
            }
			$data['categories'][] = array(
				'name'     => $custommenu['name'] ,
				'children' => $children_data,
				'column'   => $custommenu['columns'] ? $custommenu['columns'] : 1,
				'href'     => $this->getcustommenuLink($custommenu)
			);
        }
		} else {
		$categories = $this->model_catalog_category->getCategories(0);
		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();
				$children = $this->model_catalog_category->getCategories($category['category_id']);
				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);
					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}
				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}
		}

		// Whos Online
		// if ($this->config->get('config_customer_online')) {
		// 	$this->load->model('tool/online');

		// 	if (isset($this->request->server['REMOTE_ADDR'])) {
		// 		$ip = $this->request->server['REMOTE_ADDR'];
		// 	} else {
		// 		$ip = '';
		// 	}

		// 	if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
		// 		$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
		// 	} else {
		// 		$url = '';
		// 	}

		// 	if (isset($this->request->server['HTTP_REFERER'])) {
		// 		$referer = $this->request->server['HTTP_REFERER'];
		// 	} else {
		// 		$referer = '';
		// 	}

		// 	$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		// }

		return $this->load->view('common/footer', $data);
	}
	
	public function getcustommenuLink($parent, $child = null) {
		if ($this->config->get('configcustommenu_custommenu')) {
			 $item = empty($child) ? $parent : $child;
	
			 switch ($item['custommenu_type']) {
					 case 'category':
							 $route = 'product/category';
	
							 if (!empty($child)) {
									 $args = 'path=' . $parent['link'] . '_' . $item['link'];
							 } else {
									 $args = 'path='.$item['link'];
							 }
							 break;
					 case 'product':
							 $route = 'product/product';
							 $args = 'product_id='.$item['link'];
							 break;
					 case 'manufacturer':
							 $route = 'product/manufacturer/info';
							 $args = 'manufacturer_id='.$item['link'];
							 break;
					 case 'information':
							 $route = 'information/information';
							 $args = 'information_id='.$item['link'];
							 break;
					 default:
							 $tmp = explode('&', str_replace('index.php?route=', '', $item['link']));
	
							 if (!empty($tmp)) {
									 $route = $tmp[0];
									 unset($tmp[0]);
									 $args = (!empty($tmp)) ? implode('&', $tmp) : '';
							 }
							 else {
									 $route = $item['link'];
									 $args = '';
							 }
	
							 break;
			 }
	
			 $check = stripos($item['link'], 'http');
			 $checkbase = strpos($item['link'], '/');
			 if ( $check === 0 || $checkbase === 0 ) {
		 $link = $item['link'];
			 } else {
					 $link = $this->url->link($route, $args);
			 }
			 return $link;
	 }
	}
}