<?php
/**
 * Hidden Products
 * @author: Opencart-Templates.co.uk
 */

$this->db->query("ALTER TABLE `" . DB_PREFIX . "modification` CHANGE `xml` `xml` MEDIUMTEXT NOT NULL");
 
$chk = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "modification` WHERE `Field` = 'date_modified'");

if (!$chk->num_rows) {
	$this->db->query("ALTER TABLE `" . DB_PREFIX . "modification` ADD COLUMN  `date_modified` datetime NOT NULL");
	
	$this->db->query("UPDATE `" . DB_PREFIX . "modification` SET `date_modified` = `date_added` WHERE `date_modified` = '0000-00-00 00:00:00'");
}
