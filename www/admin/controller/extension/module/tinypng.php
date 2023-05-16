<?php
class ControllerExtensionModuleTinyPng extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/tinypng');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('tinypng', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_key'] = $this->language->get('entry_key');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['help_key'] = $this->language->get('help_key');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['key'])) {
			$data['error_key'] = $this->error['key'];
		} else {
			$data['error_key'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/tinypng', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/tinypng', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		
		if (isset($this->request->post['tinypng_key'])) {
			$data['tinypng_key'] = $this->request->post['tinypng_key'];
		} else {
			$data['tinypng_key'] = $this->config->get('tinypng_key');
		}
		
		if (isset($this->request->post['tinypng_status'])) {
			$data['tinypng_status'] = $this->request->post['tinypng_status'];
		} else {
			$data['tinypng_status'] = $this->config->get('tinypng_status');
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/tinypng.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/tinypng')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if (utf8_strlen($this->request->post['tinypng_key']) == 0) {
			$this->error['key'] = $this->language->get('error_key');
		}
		return !$this->error;
	}
}