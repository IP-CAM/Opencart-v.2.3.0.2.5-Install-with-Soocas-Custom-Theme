<?php
// *	@copyright	OPENCART.PRO 2011 - 2017.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerExtensionModuleLittleBanner extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/little_banner');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('little_banner', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/little_banner', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/little_banner', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/little_banner', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/little_banner', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['module_title'])) {
			$data['module_title'] = $this->request->post['module_title'];
		} elseif (!empty($module_info)) {
			$data['module_title'] = $module_info['module_title'];
		} else {
			$data['module_title'] = array();
		}

		if (isset($this->request->post['module_text'])) {
			$data['module_text'] = $this->request->post['module_text'];
		} elseif (!empty($module_info)) {
			$data['module_text'] = $module_info['module_text'];
		} else {
			$data['module_text'] = array();
		}

		if (isset($this->request->post['module_link'])) {
			$data['module_link'] = $this->request->post['module_link'];
		} elseif (!empty($module_info)) {
			$data['module_link'] = $module_info['module_link'];
		} else {
			$data['module_link'] = array();
		}

		if (isset($this->request->post['module_button_text'])) {
			$data['module_button_text'] = $this->request->post['module_button_text'];
		} elseif (!empty($module_info)) {
			$data['module_button_text'] = $module_info['module_button_text'];
		} else {
			$data['module_button_text'] = array();
		}

		$this->load->model('tool/image');

		$data['attributes'] = array();
		if (isset($this->request->post['attributes'])) {
			$attributes = $this->request->post['attributes'];
		} elseif (!empty($module_info) && isset($module_info['attributes'])) {
			$attributes = $module_info['attributes'];
		} else {
			$attributes = array();
		}

		if($attributes){
			foreach ($attributes as $attribute) {

				if(isset($attribute['image']) && $attribute['image']){
					$image = $this->model_tool_image->resize($attribute['image'], 100, 100);
				}else{
					$image = $this->model_tool_image->resize('no_image.png', 100, 100);
				}

				$data['attributes'][] = array(
					'attribute_description' => $attribute['attribute_description'],
					'thumb' => $image,
					'image' => $attribute['image']
				);
			}
		}

		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($module_info)) {
			$data['image'] = $module_info['image'];
		} else {
			$data['image'] = '';
		}

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($module_info) && is_file(DIR_IMAGE . $module_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($module_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		if($attributes){
			foreach ($attributes as $attribute) {

				if(isset($attribute['image_small']) && $attribute['image_small']){
					$image_small = $this->model_tool_image->resize($attribute['image_small'], 100, 100);
				}else{
					$image_small = $this->model_tool_image->resize('no_image.png', 100, 100);
				}

				$data['attributes'][] = array(
					'attribute_description' => $attribute['attribute_description'],
					'thumb' => $image_small,
					'image_small' => $attribute['image_small']
				);
			}
		}

		if (isset($this->request->post['image_small'])) {
			$data['image_small'] = $this->request->post['image_small'];
		} elseif (!empty($module_info)) {
			$data['image_small'] = $module_info['image_small'];
		} else {
			$data['image_small'] = '';
		}

		if (isset($this->request->post['image_small']) && is_file(DIR_IMAGE . $this->request->post['image_small'])) {
			$data['thumb_small'] = $this->model_tool_image->resize($this->request->post['image_small'], 100, 100);
		} elseif (!empty($module_info) && is_file(DIR_IMAGE . $module_info['image_small'])) {
			$data['thumb_small'] = $this->model_tool_image->resize($module_info['image_small'], 100, 100);
		} else {
			$data['thumb_small'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}


		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/little_banner', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/little_banner')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		return !$this->error;
	}
}