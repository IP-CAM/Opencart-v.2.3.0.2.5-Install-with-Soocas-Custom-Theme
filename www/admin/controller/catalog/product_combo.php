<?php
// *	@copyright	OPENCART.PRO 2011 - 2017.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerCatalogProductCombo extends Controller
{
    private $error = array();

    public function index()
    {
        $this->load->language('catalog/product_combo');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/product_combo');

        $this->getList();
    }

    public function add()
    {
        $this->load->language('catalog/product_combo');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/product_combo');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateAdd()) {
            $this->model_catalog_product_combo->addProductCombo($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_product'])) {
                $url .= '&filter_product=' . urlencode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_product2'])) {
                $url .= '&filter_product2=' . urlencode(html_entity_decode($this->request->get['filter_product2'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status=' . $this->request->get['filter_status'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('catalog/product_combo', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getFormAdd();
    }

    public function edit()
    {
        $this->load->language('catalog/product_combo');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/product_combo');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_catalog_product_combo->editProductCombo($this->request->get['combo_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_product'])) {
                $url .= '&filter_product=' . urlencode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_product2'])) {
                $url .= '&filter_product2=' . urlencode(html_entity_decode($this->request->get['filter_product2'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status=' . $this->request->get['filter_status'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('catalog/product_combo', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getForm();
    }

    public function delete()
    {
        $this->load->language('catalog/product_combo');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/product_combo');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $combo_id) {
                $this->model_catalog_product_combo->deleteProductCombo($combo_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_product'])) {
                $url .= '&filter_product=' . urlencode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_product2'])) {
                $url .= '&filter_product2=' . urlencode(html_entity_decode($this->request->get['filter_product2'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status=' . $this->request->get['filter_status'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('catalog/product_combo', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getList();
    }

    protected function getList()
    {
        if (isset($this->request->get['filter_product'])) {
            $filter_product = $this->request->get['filter_product'];
        } else {
            $filter_product = null;
        }

        if (isset($this->request->get['filter_product2'])) {
            $filter_product2 = $this->request->get['filter_product2'];
        } else {
            $filter_product2 = null;
        }

        if (isset($this->request->get['filter_status'])) {
            $filter_status = $this->request->get['filter_status'];
        } else {
            $filter_status = null;
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'pc.combo_id';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['filter_product'])) {
            $url .= '&filter_product=' . urlencode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_product2'])) {
            $url .= '&filter_product2=' . urlencode(html_entity_decode($this->request->get['filter_product2'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/product_combo', 'token=' . $this->session->data['token'] . $url, true)
        );

        $data['add'] = $this->url->link('catalog/product_combo/add', 'token=' . $this->session->data['token'] . $url, true);
        $data['delete'] = $this->url->link('catalog/product_combo/delete', 'token=' . $this->session->data['token'] . $url, true);

        $data['products_combo'] = array();

        $filter_data = array(
            'filter_product' => $filter_product,
            'filter_product2' => $filter_product2,
            'filter_status' => $filter_status,
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );

        $product_combo_total = $this->model_catalog_product_combo->getTotalProductsCombo($filter_data);

        $results = $this->model_catalog_product_combo->getProductsCombo($filter_data);

        foreach ($results as $result) {
            $data['products_combo'][] = array(
                'combo_id' => $result['combo_id'],
                'product1' => $result['product1'],
                'product2' => $result['product2'],
                'discount' => $result['discount'],
                'status' => ($result['status']) ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
                'edit' => $this->url->link('catalog/product_combo/edit', 'token=' . $this->session->data['token'] . '&combo_id=' . $result['combo_id'] . $url, true)
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['column_product'] = $this->language->get('column_product');
        $data['column_product2'] = $this->language->get('column_product2');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_action'] = $this->language->get('column_action');
        $data['column_discount'] = $this->language->get('column_discount');


        $data['entry_product'] = $this->language->get('entry_product');
        $data['entry_product2'] = $this->language->get('entry_product2');
        $data['entry_status'] = $this->language->get('entry_status');

        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');
        $data['button_filter'] = $this->language->get('button_filter');
        $data['button_enable'] = $this->language->get('button_enable');
        $data['button_disable'] = $this->language->get('button_disable');

        $data['token'] = $this->session->data['token'];

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array)$this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $url = '';

        if (isset($this->request->get['filter_product'])) {
            $url .= '&filter_product=' . urlencode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_product2'])) {
            $url .= '&filter_product2=' . urlencode(html_entity_decode($this->request->get['filter_product2'], ENT_QUOTES, 'UTF-8'));
        }


        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_combo_id'] = $this->url->link('catalog/product_combo', 'token=' . $this->session->data['token'] . '&sort=pc.combo_id' . $url, true);
        $data['sort_product1'] = $this->url->link('catalog/product_combo', 'token=' . $this->session->data['token'] . '&sort=product1' . $url, true);
        $data['sort_product2'] = $this->url->link('catalog/product_combo', 'token=' . $this->session->data['token'] . '&sort=product2' . $url, true);
        $data['sort_status'] = $this->url->link('catalog/product_combo', 'token=' . $this->session->data['token'] . '&sort=pc.status' . $url, true);

        $url = '';

        if (isset($this->request->get['filter_product'])) {
            $url .= '&filter_product=' . urlencode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_product2'])) {
            $url .= '&filter_product2=' . urlencode(html_entity_decode($this->request->get['filter_product2'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $product_combo_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('catalog/product_combo', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($product_combo_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($product_combo_total - $this->config->get('config_limit_admin'))) ? $product_combo_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $product_combo_total, ceil($product_combo_total / $this->config->get('config_limit_admin')));

        $data['filter_product'] = $filter_product;
        $data['filter_product2'] = $filter_product2;
        $data['filter_status'] = $filter_status;

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/product_combo_list', $data));
    }

    protected function getForm()
    {
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_form'] = !isset($this->request->get['combo_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['entry_product'] = $this->language->get('entry_product');
        $data['entry_product2'] = $this->language->get('entry_product2');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_discount'] = $this->language->get('entry_discount');
        $data['help_product'] = $this->language->get('help_product');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['product1'])) {
            $data['error_product1'] = $this->error['product1'];
        } else {
            $data['error_product1'] = '';
        }

        if (isset($this->error['product2'])) {
            $data['error_product2'] = $this->error['product2'];
        } else {
            $data['error_product2'] = '';
        }

        if (isset($this->error['discount'])) {
            $data['error_discount'] = $this->error['discount'];
        } else {
            $data['error_discount'] = '';
        }

        $url = '';

        if (isset($this->request->get['filter_product'])) {
            $url .= '&filter_product=' . urlencode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_product2'])) {
            $url .= '&filter_product2=' . urlencode(html_entity_decode($this->request->get['filter_product2'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/product_combo', 'token=' . $this->session->data['token'] . $url, true)
        );

        if (!isset($this->request->get['combo_id'])) {
            $data['action'] = $this->url->link('catalog/product_combo/add', 'token=' . $this->session->data['token'] . $url, true);
        } else {
            $data['action'] = $this->url->link('catalog/product_combo/edit', 'token=' . $this->session->data['token'] . '&combo_id=' . $this->request->get['combo_id'] . $url, true);
        }

        $data['cancel'] = $this->url->link('catalog/product_combo', 'token=' . $this->session->data['token'] . $url, true);

        if (isset($this->request->get['combo_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $product_combo_info = $this->model_catalog_product_combo->getProductCombo($this->request->get['combo_id']);
        }

        $data['token'] = $this->session->data['token'];

        $this->load->model('catalog/product');

        if (isset($this->request->post['product_id1'])) {
            $data['product_id1'] = $this->request->post['product_id1'];
        } elseif (!empty($product_combo_info)) {
            $data['product_id1'] = $product_combo_info['product_id1'];
        } else {
            $data['product_id1'] = '';
        }

        if (isset($this->request->post['product1'])) {
            $data['product1'] = $this->request->post['product1'];
        } elseif (!empty($product_combo_info)) {
            $data['product1'] = $product_combo_info['product1'];
        } else {
            $data['product1'] = '';
        }

        if (isset($this->request->post['product_id2'])) {
            $data['product_id2'] = $this->request->post['product_id2'];
        } elseif (!empty($product_combo_info)) {
            $data['product_id2'] = $product_combo_info['product_id2'];
        } else {
            $data['product_id2'] = '';
        }

        if (isset($this->request->post['product2'])) {
            $data['product2'] = $this->request->post['product2'];
        } elseif (!empty($product_combo_info)) {
            $data['product2'] = $product_combo_info['product2'];
        } else {
            $data['product2'] = '';
        }

        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($product_combo_info)) {
            $data['status'] = $product_combo_info['status'];
        } else {
            $data['status'] = 0;
        }

        if (isset($this->request->post['discount'])) {
            $data['discount'] = $this->request->post['discount'];
        } elseif (!empty($product_combo_info)) {
            $data['discount'] = $product_combo_info['discount'];
        } else {
            $data['discount'] = 0;
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/product_combo_form', $data));
    }

    protected function getFormAdd()
    {
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_form'] = !isset($this->request->get['combo_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['entry_product'] = $this->language->get('entry_product');
        $data['entry_product2'] = $this->language->get('entry_product2');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_discount'] = $this->language->get('entry_discount');
        $data['help_product'] = $this->language->get('help_product');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['product'])) {
            $data['error_product'] = $this->error['product'];
        } else {
            $data['error_product'] = '';
        }

        if (isset($this->error['relateds'])) {
            $data['error_relateds'] = $this->error['relateds'];
        } else {
            $data['error_relateds'] = '';
        }

        $url = '';

        if (isset($this->request->get['filter_product'])) {
            $url .= '&filter_product=' . urlencode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_product2'])) {
            $url .= '&filter_product2=' . urlencode(html_entity_decode($this->request->get['filter_product2'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/product_combo', 'token=' . $this->session->data['token'] . $url, true)
        );

        $data['action'] = $this->url->link('catalog/product_combo/add', 'token=' . $this->session->data['token'] . $url, true);


        $data['cancel'] = $this->url->link('catalog/product_combo', 'token=' . $this->session->data['token'] . $url, true);

        $data['token'] = $this->session->data['token'];

        $this->load->model('catalog/product');

        if (isset($this->request->post['product_id'])) {
            $data['product_id'] = $this->request->post['product_id'];
        } else {
            $data['product_id'] = '';
        }

        if (isset($this->request->post['product'])) {
            $data['product'] = $this->request->post['product'];
        } else {
            $data['product'] = array();
        }

        if (isset($this->request->post['relateds'])) {
            $data['relateds'] = $this->request->post['relateds'];
        } else {
            $data['relateds'] = array();
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/product_combo_form_add', $data));
    }

    protected function validateForm()
    {
        if (!$this->user->hasPermission('modify', 'catalog/product_combo')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->request->post['product_id1']) {
            $this->error['product1'] = $this->language->get('error_product');
        }

        if (!$this->request->post['product_id2']) {
            $this->error['product2'] = $this->language->get('error_product');
        }

        if (!$this->request->post['discount'] || $this->request->post['discount'] == 0) {
            $this->error['discount'] = $this->language->get('error_discount');
        }

        return !$this->error;
    }

    protected function validateAdd()
    {
        if (!$this->user->hasPermission('modify', 'catalog/product_combo')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->request->post['product']) {
            $this->error['product'] = $this->language->get('error_product');
        }
        if (!$this->request->post['relateds']) {
            $this->error['relateds'] = $this->language->get('error_relateds');
        }

        return !$this->error;
    }

    protected function validateDelete()
    {
        if (!$this->user->hasPermission('modify', 'catalog/product_combo')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }
}