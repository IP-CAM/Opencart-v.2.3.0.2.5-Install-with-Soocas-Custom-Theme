<?php
// *	@copyright	OPENCART.PRO 2011 - 2017.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerInformationCatalog extends Controller
{
	private $error = array();

	public function index()
	{
		$this->load->language('information/catalog');

		$this->load->model('catalog/product');
		$this->load->model('tool/image');

		$this->document->setTitle($this->language->get('heading_title'));

		// if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
		// 	$mail = new Mail();
		// 	$mail->protocol = $this->config->get('config_mail_protocol');
		// 	$mail->parameter = $this->config->get('config_mail_parameter');
		// 	$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		// 	$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		// 	$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		// 	$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		// 	$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		// 	$mail->setTo($this->config->get('config_email'));
		// 	$mail->setFrom($this->request->post['email']);
		// 	$mail->setSender(html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'));
		// 	$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
		// 	$mail->setText($this->request->post['enquiry']);
		// 	$mail->send();

		// 	// Send to additional alert emails if new account email is enabled
		// 	$emails = explode(',', $this->config->get('config_mail_alert'));

		// 	foreach ($emails as $email) {
		// 		if (utf8_strlen($email) > 0 && preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $email)) {
		// 			$mail->setTo($email);
		// 			$mail->send();
		// 		}
		// 	}

		// 	$this->response->redirect($this->url->link('information/catalog/success'));
		// }

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home'),
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/catalog'),
			'last' => true,
		);

		$data['heading_title'] = $this->language->get('heading_title');

		// $data['text_location'] = $this->language->get('text_location');
		// $data['text_store'] = $this->language->get('text_store');
		// $data['text_catalog'] = $this->language->get('text_catalog');
		// $data['text_address'] = $this->language->get('text_address');
		// $data['text_telephone'] = $this->language->get('text_telephone');
		// $data['text_fax'] = $this->language->get('text_fax');
		// $data['text_open'] = $this->language->get('text_open');
		// $data['text_comment'] = $this->language->get('text_comment');

		// $data['entry_name'] = $this->language->get('entry_name');
		// $data['entry_email'] = $this->language->get('entry_email');
		// $data['entry_enquiry'] = $this->language->get('entry_enquiry');

		// $data['button_map'] = $this->language->get('button_map');

		// if (isset($this->error['name'])) {
		// 	$data['error_name'] = $this->error['name'];
		// } else {
		// 	$data['error_name'] = '';
		// }

		// if (isset($this->error['email'])) {
		// 	$data['error_email'] = $this->error['email'];
		// } else {
		// 	$data['error_email'] = '';
		// }

		// if (isset($this->error['enquiry'])) {
		// 	$data['error_enquiry'] = $this->error['enquiry'];
		// } else {
		// 	$data['error_enquiry'] = '';
		// }

		// $data['button_submit'] = $this->language->get('button_submit');

		// $data['action'] = $this->url->link('information/catalog', '', true);

		// $this->load->model('tool/image');

		// if ($this->config->get('config_image')) {
		// 	$data['image'] = $this->model_tool_image->resize($this->config->get('config_image'), $this->config->get($this->config->get('config_theme') . '_image_location_width'), $this->config->get($this->config->get('config_theme') . '_image_location_height'));
		// } else {
		// 	$data['image'] = false;
		// }

		// $data['store'] = $this->config->get('config_name');
		// $data['address'] = nl2br($this->config->get('config_address'));
		// $data['geocode'] = $this->config->get('config_geocode');
		// $data['geocode_hl'] = $this->config->get('config_language');
		$data['telephone'] = $this->config->get('config_telephone');
		// $data['fax'] = $this->config->get('config_fax');
		$data['open'] = nl2br($this->config->get('config_open'));
		// $data['comment'] = $this->config->get('config_comment');
		$data['link_instagram'] = $this->config->get('config_instagram');
		$data['link_telegram'] = $this->config->get('config_telegram');
		$data['link_vk'] = $this->config->get('config_vk');

		$data['legal_address'] = $this->config->get('config_address_ur');
		$data['email_clients'] = $this->config->get('config_email_clients');
		$data['email_wholesale'] = $this->config->get('config_email_wholesale');
		$data['email_cooperation'] = $this->config->get('config_email_cooperation');


		$data['products'] = array();

		$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
		$url = '';

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
			$this->document->setRobots('noindex,follow');
		} else {
			$page = 1;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
			$this->document->setRobots('noindex,follow');
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		$filter_data = array(
			'sort'               => $sort,
			'order'              => $order,
			'start'              => ($page - 1) * $limit,
			'limit'              => $limit,
		);

		$products = $this->model_catalog_product->getProducts($filter_data);
		$product_total = $this->model_catalog_product->getTotalProducts($filter_data);

		foreach ($products as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
			}

			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$price = '';
			}

			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$special = '';
			}

			$data['products'][] = array(
				'product_id'  => $result['product_id'],
				'thumb'       => $image,
				'price'       => $price,
				'special'     => $special,
				'name'        => $result['name'],
				'href'        => $this->url->link('product/product', '&product_id=' . $result['product_id'] . $url)
			);
		}

		$pagination = new PaginationCatalog();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('information/catalog', $url . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

		// $data['locations'] = array();

		// $this->load->model('localisation/location');

		// foreach((array)$this->config->get('config_location') as $location_id) {
		// 	$location_info = $this->model_localisation_location->getLocation($location_id);

		// 	if ($location_info) {
		// 		if ($location_info['image']) {
		// 			$image = $this->model_tool_image->resize($location_info['image'], $this->config->get($this->config->get('config_theme') . '_image_location_width'), $this->config->get($this->config->get('config_theme') . '_image_location_height'));
		// 		} else {
		// 			$image = false;
		// 		}

		// 		$data['locations'][] = array(
		// 			'location_id' => $location_info['location_id'],
		// 			'name'        => $location_info['name'],
		// 			'address'     => nl2br($location_info['address']),
		// 			'geocode'     => $location_info['geocode'],
		// 			'telephone'   => $location_info['telephone'],
		// 			'fax'         => $location_info['fax'],
		// 			'image'       => $image,
		// 			'open'        => nl2br($location_info['open']),
		// 			'comment'     => $location_info['comment']
		// 		);
		// 	}
		// }

		// if (isset($this->request->post['name'])) {
		// 	$data['name'] = $this->request->post['name'];
		// } else {
		// 	$data['name'] = $this->customer->getFirstName();
		// }

		// if (isset($this->request->post['email'])) {
		// 	$data['email'] = $this->request->post['email'];
		// } else {
		// 	$data['email'] = $this->customer->getEmail();
		// }

		// if (isset($this->request->post['enquiry'])) {
		// 	$data['enquiry'] = $this->request->post['enquiry'];
		// } else {
		// 	$data['enquiry'] = '';
		// }

		// // Captcha
		// if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('catalog', (array)$this->config->get('config_captcha_page'))) {
		// 	$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'), $this->error);
		// } else {
		// 	$data['captcha'] = '';
		// }

		// $data['column_left'] = $this->load->controller('common/column_left');
		// $data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('information/catalog', $data));
	}

	// protected function validate() {
	// 	if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
	// 		$this->error['name'] = $this->language->get('error_name');
	// 	}

	// 	if (!filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
	// 		$this->error['email'] = $this->language->get('error_email');
	// 	}

	// 	if ((utf8_strlen($this->request->post['enquiry']) < 10) || (utf8_strlen($this->request->post['enquiry']) > 3000)) {
	// 		$this->error['enquiry'] = $this->language->get('error_enquiry');
	// 	}

	// 	// Captcha
	// 	if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('catalog', (array)$this->config->get('config_captcha_page'))) {
	// 		$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

	// 		if ($captcha) {
	// 			$this->error['captcha'] = $captcha;
	// 		}
	// 	}

	// 	return !$this->error;
	// }

	// public function success() {
	// 	$this->load->language('information/catalog');

	// 	$this->document->setTitle($this->language->get('heading_title'));

	// 	$data['breadcrumbs'] = array();

	// 	$data['breadcrumbs'][] = array(
	// 		'text' => $this->language->get('text_home'),
	// 		'href' => $this->url->link('common/home')
	// 	);

	// 	$data['breadcrumbs'][] = array(
	// 		'text' => $this->language->get('heading_title'),
	// 		'href' => $this->url->link('information/catalog')
	// 	);

	// 	$data['heading_title'] = $this->language->get('heading_title');

	// 	$data['text_message'] = $this->language->get('text_success');

	// 	$data['button_continue'] = $this->language->get('button_continue');

	// 	$data['continue'] = $this->url->link('common/home');

	// 	$data['column_left'] = $this->load->controller('common/column_left');
	// 	$data['column_right'] = $this->load->controller('common/column_right');
	// 	$data['content_top'] = $this->load->controller('common/content_top');
	// 	$data['content_bottom'] = $this->load->controller('common/content_bottom');
	// 	$data['footer'] = $this->load->controller('common/footer');
	// 	$data['header'] = $this->load->controller('common/header');

	// 	$this->response->setOutput($this->load->view('common/success', $data));
	// }
}
