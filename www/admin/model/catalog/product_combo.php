<?php
// *	@copyright	OPENCART.PRO 2011 - 2017.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ModelCatalogProductCombo extends Model
{
    public function addProductCombo($data)
    {
        if (isset($data['product'])) {
            foreach ($data['product'] as $product) {
                if (isset($data['relateds'])) {
                    foreach ($data['relateds'] as $related) {
                        $this->db->query("INSERT INTO " . DB_PREFIX . "product_combo SET product_id = '" . (int)$product['product_id'] . "' , related_id = '" . (int)$related['related_id'] . "' , discount = '" . (float)$related['discount'] . "' , status = '" . (int)$related['status'] . "'");
                    }
                }
            }
        }
    }

    public function editProductCombo($combo_id, $data)
    {
        $this->db->query("UPDATE " . DB_PREFIX . "product_combo SET product_id = '" . (int)$data['product_id1'] . "' , related_id = '" . (int)$data['product_id2'] . "' , discount = '" . (float)$data['discount'] . "', status = '" . (int)$data['status'] . "' WHERE combo_id = '" . (int)$combo_id . "'");
        if (!$data['status']) {
            $cart = $this->db->query("SELECT * FROM " . DB_PREFIX . "cart WHERE combo_id = '" . (int)$combo_id . "'");
            if ($cart->row) {
                $this->db->query("UPDATE " . DB_PREFIX . "cart SET combo_id = 0 WHERE  combo_id = '" . (int)$combo_id . "'");
            }
        }
    }

    public function deleteProductCombo($combo_id)
    {
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_combo WHERE combo_id = '" . (int)$combo_id . "'");
        $this->db->query("UPDATE " . DB_PREFIX . "cart SET combo_id = 0 WHERE  combo_id = '" . (int)$combo_id . "'");
    }

    public function getProductCombo($combo_id)
    {
        $query = $this->db->query("SELECT product_id AS product_id1, related_id AS product_id2, status, discount, (SELECT pd.name FROM " . DB_PREFIX . "product_description pd WHERE pd.product_id = pc.product_id AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS product1, (SELECT pd.name FROM " . DB_PREFIX . "product_description pd WHERE pd.product_id = pc.related_id AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS product2 FROM " . DB_PREFIX . "product_combo pc WHERE pc.combo_id = '" . (int)$combo_id . "'");

        return $query->row;
    }

    public function getProductsCombo($data = array())
    {

        $sql = "SELECT pc.combo_id, pc.discount, pc.status, pd1.name AS product1, pd2.name  AS product2 FROM " . DB_PREFIX . "product_combo pc LEFT JOIN " . DB_PREFIX . "product_description pd1 ON(pc.product_id = pd1.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd2 ON(pc.related_id = pd2.product_id) WHERE pd1.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pd2.language_id = '" . (int)$this->config->get('config_language_id') . "' ";

        if (!empty($data['filter_product'])) {
            $sql .= " AND pd1.name LIKE '%" . $this->db->escape($data['filter_product']) . "%'";
        }
        if (!empty($data['filter_product2'])) {
            $sql .= " AND pd2.name LIKE '%" . $this->db->escape($data['filter_product2']) . "%'";
        }

        if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
            $sql .= " AND pc.status = '" . (int)$data['filter_status'] . "'";
        }

        $sort_data = array(
            'pc.combo_id',
            'product1',
            'product2',
            'pc.status'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY pc.combo_id";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getTotalProductsCombo($data = array())
    {

        $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_combo pc LEFT JOIN " . DB_PREFIX . "product_description pd1 ON(pc.product_id = pd1.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd2 ON(pc.related_id = pd2.product_id) WHERE pd1.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pd2.language_id = '" . (int)$this->config->get('config_language_id') . "' ";

        if (!empty($data['filter_product'])) {
            $sql .= " AND pd1.name LIKE '%" . $this->db->escape($data['filter_product']) . "%'";
        }
        if (!empty($data['filter_product2'])) {
            $sql .= " AND pd2.name LIKE '%" . $this->db->escape($data['filter_product2']) . "%'";
        }

        if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
            $sql .= " AND pc.status = '" . (int)$data['filter_status'] . "'";
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

}