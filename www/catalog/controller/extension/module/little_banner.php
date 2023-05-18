<?php
// *	@copyright	OPENCART.PRO 2011 - 2017.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerExtensionModuleLittleBanner extends Controller
{
	public function index($setting)
	{
		if ($setting['status']) {
			if (isset($setting['module_title'])) {
				$data['module_title'] = $setting['module_title'];
			}

			if (isset($setting['module_text'])) {
				$data['module_text'] = $setting['module_text'];
			}

			if (isset($setting['module_link'])) {
				$data['module_link'] = $setting['module_link'];
			}

			if (isset($setting['module_button_text'])) {
				$data['module_button_text'] = $setting['module_button_text'];
			}

			$this->load->model('tool/image');

			if (isset($setting['image']) && $setting['image']) {
				$data['image'] = $this->model_tool_image->onesize($setting['image'], 1920);
			} else {
				$data['image'] = '';
			}

			if (isset($setting['image_small']) && $setting['image_small']) {
				$data['image_small'] = $this->model_tool_image->onesize($setting['image_small'], 700);
			} else {
				$data['image_small'] = '';
			}

			return $this->load->view('extension/module/little_banner', $data);
		}
	}
}
