<?= $header; ?><?= $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-product" data-toggle="tooltip" title="<?= $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?= $cancel; ?>" data-toggle="tooltip" title="<?= $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?= $heading_title; ?></h1>
      <ul class="breadcrumb">
        <? foreach ($breadcrumbs as $breadcrumb) { ?>
          <li><a href="<?= $breadcrumb['href']; ?>"><?= $breadcrumb['text']; ?></a></li>
        <? } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <? if ($error_warning) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?= $error_warning; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
    <? } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?= $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?= $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?= $tab_general; ?></a></li>
            <li><a href="#tab-data" data-toggle="tab"><?= $tab_data; ?></a></li>
            <li><a href="#tab-links" data-toggle="tab"><?= $tab_links; ?></a></li>
            <li><a href="#tab-attribute" data-toggle="tab"><?= $tab_attribute; ?></a></li>
            <li><a href="#tab-option" data-toggle="tab"><?= $tab_option; ?></a></li>
            <li><a href="#tab-recurring" data-toggle="tab"><?= $tab_recurring; ?></a></li>
            <li><a href="#tab-discount" data-toggle="tab"><?= $tab_discount; ?></a></li>
            <li><a href="#tab-special" data-toggle="tab"><?= $tab_special; ?></a></li>
            <li><a href="#tab-image" data-toggle="tab"><?= $tab_image; ?></a></li>
            <li><a href="#tab-extra" data-toggle="tab"><?= $tab_extra_tab; ?></a></li>
            <li><a href="#tab-reward" data-toggle="tab"><?= $tab_reward; ?></a></li>
            <li><a href="#tab-design" data-toggle="tab"><?= $tab_design; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <ul class="nav nav-tabs" id="language">
                <? foreach ($languages as $language) { ?>
                  <li><a href="#language<?= $language['language_id']; ?>" data-toggle="tab"><img src="language/<?= $language['code']; ?>/<?= $language['code']; ?>.png" title="<?= $language['name']; ?>" /> <?= $language['name']; ?></a></li>
                <? } ?>
              </ul>
              <div class="tab-content">
                <? foreach ($languages as $language) { ?>
                  <div class="tab-pane" id="language<?= $language['language_id']; ?>">
                    <div class="form-group required">
                      <label class="col-sm-2 control-label" for="input-name<?= $language['language_id']; ?>"><?= $entry_name; ?></label>
                      <div class="col-sm-10">
                        <input type="text" name="product_description[<?= $language['language_id']; ?>][name]" value="<?= isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?= $entry_name; ?>" id="input-name<?= $language['language_id']; ?>" class="form-control" />
                        <? if (isset($error_name[$language['language_id']])) { ?>
                          <div class="text-danger"><?= $error_name[$language['language_id']]; ?></div>
                        <? } ?>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-meta-h1<?= $language['language_id']; ?>"><?= $entry_meta_h1; ?></label>
                      <div class="col-sm-10">
                        <input type="text" name="product_description[<?= $language['language_id']; ?>][meta_h1]" value="<?= isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_h1'] : ''; ?>" placeholder="<?= $entry_meta_h1; ?>" id="input-meta-title<?= $language['language_id']; ?>" class="form-control" />
                        <? if (isset($error_meta_h1[$language['language_id']])) { ?>
                          <div class="text-danger"><?= $error_meta_h1[$language['language_id']]; ?></div>
                        <? } ?>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-meta-title<?= $language['language_id']; ?>"><?= $entry_meta_title; ?></label>
                      <div class="col-sm-10">
                        <input type="text" name="product_description[<?= $language['language_id']; ?>][meta_title]" value="<?= isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?= $entry_meta_title; ?>" id="input-meta-title<?= $language['language_id']; ?>" class="form-control" />
                        <? if (isset($error_meta_title[$language['language_id']])) { ?>
                          <div class="text-danger"><?= $error_meta_title[$language['language_id']]; ?></div>
                        <? } ?>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-meta-keyword<?= $language['language_id']; ?>"><?= $entry_meta_keyword; ?></label>
                      <div class="col-sm-10">
                        <textarea name="product_description[<?= $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?= $entry_meta_keyword; ?>" id="input-meta-keyword<?= $language['language_id']; ?>" class="form-control"><?= isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-meta-description<?= $language['language_id']; ?>"><?= $entry_meta_description; ?></label>
                      <div class="col-sm-10">
                        <textarea name="product_description[<?= $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?= $entry_meta_description; ?>" id="input-meta-description<?= $language['language_id']; ?>" class="form-control"><?= isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-description<?= $language['language_id']; ?>"><?= $entry_description; ?></label>
                      <div class="col-sm-10">
                        <textarea name="product_description[<?= $language['language_id']; ?>][description]" placeholder="<?= $entry_description; ?>" id="input-description<?= $language['language_id']; ?>" class="form-control summernote"><?= isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['description'] : ''; ?></textarea>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-description_mini<?= $language['language_id']; ?>"><?= $entry_description_mini; ?></label>
                      <div class="col-sm-10">
                        <textarea name="product_description[<?= $language['language_id']; ?>][description_mini]" placeholder="<?= $entry_description_mini; ?>" id="input-description_mini<?= $language['language_id']; ?>" class="form-control summernote"><?= isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['description_mini'] : ''; ?></textarea>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-tag<?= $language['language_id']; ?>"><span data-toggle="tooltip" title="<?= $help_tag; ?>"><?= $entry_tag; ?></span></label>
                      <div class="col-sm-10">
                        <input type="text" name="product_description[<?= $language['language_id']; ?>][tag]" value="<?= isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['tag'] : ''; ?>" placeholder="<?= $entry_tag; ?>" id="input-tag<?= $language['language_id']; ?>" class="form-control" />
                      </div>
                    </div>
                  </div>
                <? } ?>
              </div>
            </div>
            <div class="tab-pane" id="tab-data">

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sticker"><?= $entry_sticker; ?></label>
                <div class="col-sm-10">
                  <? for ($i = 0; $i <= 3; $i++) { ?>
                    <div class="sticker_block">
                      <div class="corner_name">
                        <?= ${'text_corner' . $i}; ?> <span class="square  <?= 'corner_' . $i; ?>"></span>
                      </div>
                      <div class="sticker-select">
                        <select name="product_stickers[<?= $i; ?>]" id="input-stickers" class="form-control">
                          <option value="0" selected="selected"><?= $text_none; ?></option>
                          <? foreach ($stickers as $sticker) { ?>
                            <? if (!empty($product_stickers[$i]) && $product_stickers[$i] == $sticker['sticker_id']) { ?>
                              <option value="<?= $sticker['sticker_id']; ?>" selected="selected"><?= $sticker['name']; ?></option>
                            <? } else { ?>
                              <option value="<?= $sticker['sticker_id']; ?>"><?= $sticker['name']; ?></option>
                            <? } ?>
                          <? } ?>
                        </select>
                      </div>
                    </div>
                  <? } ?>
                </div>
              </div>

              <? if ($benefits) { ?>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-benefits"><?= $text_benefits; ?></label>
                  <div class="col-sm-10">
                    <ul class="benefit">
                      <? foreach ($benefits as $benefit) { ?>
                        <? if (in_array($benefit['benefit_id'], $product_benefits)) { ?>
                          <li class="checked">
                            <span class="thumb"><img src="<?= $benefit['thumb']; ?>" alt="" /></span>
                            <span><?= $benefit['name']; ?></span>
                            <span style="display:none;"><input type="checkbox" name="product_benefits[]" value="<?= $benefit['benefit_id']; ?>" checked="checked"></span>
                          </li>
                        <? } else { ?>
                          <li>
                            <span class="thumb"><img src="<?= $benefit['thumb']; ?>" alt="" /></span>
                            <span><?= $benefit['name']; ?></span>
                            <span style="display:none;"><input type="checkbox" name="product_benefits[]" value="<?= $benefit['benefit_id']; ?>"></span>
                          </li>
                        <? } ?>
                      <? } ?>
                    </ul>
                  </div>
                </div>
              <? } ?>
              <style>
                .benefit {
                  list-style: none;
                  padding: 0;
                  margin: 0
                }

                .benefit li {
                  display: inline-block;
                  border: 1px solid #aaa;
                  padding: 4px 6px;
                  margin: 2px;
                  cursor: pointer;
                  line-height: 8px;
                }

                .benefit li.checked {
                  border: 1px solid #0381CB;
                  background: rgba(85, 190, 253, 0.2);
                }

                .benefit li:hover {
                  background: rgba(85, 190, 253, 0.1);
                }

                .benefit li span {
                  display: table-cell;
                  vertical-align: middle;
                }

                .thumb {
                  padding-right: 5px;
                }
              </style>
              <script>
                $('.benefit').on('click', 'li', function() {
                  if (!$(this).hasClass('checked')) {
                    $(this).find('input').first().attr('checked', true);
                  } else {
                    $(this).find('input').first().attr('checked', false);
                  }
                  $(this).toggleClass('checked');
                })
              </script>

              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-model"><?= $entry_model; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="model" value="<?= $model; ?>" placeholder="<?= $entry_model; ?>" id="input-model" class="form-control" />
                  <? if ($error_model) { ?>
                    <div class="text-danger"><?= $error_model; ?></div>
                  <? } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sku"><span data-toggle="tooltip" title="<?= $help_sku; ?>"><?= $entry_sku; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="sku" value="<?= $sku; ?>" placeholder="<?= $entry_sku; ?>" id="input-sku" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-upc"><span data-toggle="tooltip" title="<?= $help_upc; ?>"><?= $entry_upc; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="upc" value="<?= $upc; ?>" placeholder="<?= $entry_upc; ?>" id="input-upc" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-ean"><span data-toggle="tooltip" title="<?= $help_ean; ?>"><?= $entry_ean; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="ean" value="<?= $ean; ?>" placeholder="<?= $entry_ean; ?>" id="input-ean" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-jan"><span data-toggle="tooltip" title="<?= $help_jan; ?>"><?= $entry_jan; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="jan" value="<?= $jan; ?>" placeholder="<?= $entry_jan; ?>" id="input-jan" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-isbn"><span data-toggle="tooltip" title="<?= $help_isbn; ?>"><?= $entry_isbn; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="isbn" value="<?= $isbn; ?>" placeholder="<?= $entry_isbn; ?>" id="input-isbn" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mpn"><span data-toggle="tooltip" title="<?= $help_mpn; ?>"><?= $entry_mpn; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="mpn" value="<?= $mpn; ?>" placeholder="<?= $entry_mpn; ?>" id="input-mpn" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-location"><?= $entry_location; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="location" value="<?= $location; ?>" placeholder="<?= $entry_location; ?>" id="input-location" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-price"><?= $entry_price; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="price" value="<?= $price; ?>" placeholder="<?= $entry_price; ?>" id="input-price" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-tax-class"><?= $entry_tax_class; ?></label>
                <div class="col-sm-10">
                  <select name="tax_class_id" id="input-tax-class" class="form-control">
                    <option value="0"><?= $text_none; ?></option>
                    <? foreach ($tax_classes as $tax_class) { ?>
                      <? if ($tax_class['tax_class_id'] == $tax_class_id) { ?>
                        <option value="<?= $tax_class['tax_class_id']; ?>" selected="selected"><?= $tax_class['title']; ?></option>
                      <? } else { ?>
                        <option value="<?= $tax_class['tax_class_id']; ?>"><?= $tax_class['title']; ?></option>
                      <? } ?>
                    <? } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-quantity"><?= $entry_quantity; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="quantity" value="<?= $quantity; ?>" placeholder="<?= $entry_quantity; ?>" id="input-quantity" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-minimum"><span data-toggle="tooltip" title="<?= $help_minimum; ?>"><?= $entry_minimum; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="minimum" value="<?= $minimum; ?>" placeholder="<?= $entry_minimum; ?>" id="input-minimum" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-subtract"><?= $entry_subtract; ?></label>
                <div class="col-sm-10">
                  <select name="subtract" id="input-subtract" class="form-control">
                    <? if ($subtract) { ?>
                      <option value="1" selected="selected"><?= $text_yes; ?></option>
                      <option value="0"><?= $text_no; ?></option>
                    <? } else { ?>
                      <option value="1"><?= $text_yes; ?></option>
                      <option value="0" selected="selected"><?= $text_no; ?></option>
                    <? } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-stock-status"><span data-toggle="tooltip" title="<?= $help_stock_status; ?>"><?= $entry_stock_status; ?></span></label>
                <div class="col-sm-10">
                  <select name="stock_status_id" id="input-stock-status" class="form-control">
                    <? foreach ($stock_statuses as $stock_status) { ?>
                      <? if ($stock_status['stock_status_id'] == $stock_status_id) { ?>
                        <option value="<?= $stock_status['stock_status_id']; ?>" selected="selected"><?= $stock_status['name']; ?></option>
                      <? } else { ?>
                        <option value="<?= $stock_status['stock_status_id']; ?>"><?= $stock_status['name']; ?></option>
                      <? } ?>
                    <? } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?= $entry_shipping; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <? if ($shipping) { ?>
                      <input type="radio" name="shipping" value="1" checked="checked" />
                      <?= $text_yes; ?>
                    <? } else { ?>
                      <input type="radio" name="shipping" value="1" />
                      <?= $text_yes; ?>
                    <? } ?>
                  </label>
                  <label class="radio-inline">
                    <? if (!$shipping) { ?>
                      <input type="radio" name="shipping" value="0" checked="checked" />
                      <?= $text_no; ?>
                    <? } else { ?>
                      <input type="radio" name="shipping" value="0" />
                      <?= $text_no; ?>
                    <? } ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?= $help_keyword; ?>"><?= $entry_keyword; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="keyword" value="<?= $keyword; ?>" placeholder="<?= $entry_keyword; ?>" id="input-keyword" class="form-control" />
                  <? if ($error_keyword) { ?>
                    <div class="text-danger"><?= $error_keyword; ?></div>
                  <? } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-date-available"><?= $entry_date_available; ?></label>
                <div class="col-sm-3">
                  <div class="input-group date">
                    <input type="text" name="date_available" value="<?= $date_available; ?>" placeholder="<?= $entry_date_available; ?>" data-date-format="YYYY-MM-DD" id="input-date-available" class="form-control" />
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                    </span>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-length"><?= $entry_dimension; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-4">
                      <input type="text" name="length" value="<?= $length; ?>" placeholder="<?= $entry_length; ?>" id="input-length" class="form-control" />
                    </div>
                    <div class="col-sm-4">
                      <input type="text" name="width" value="<?= $width; ?>" placeholder="<?= $entry_width; ?>" id="input-width" class="form-control" />
                    </div>
                    <div class="col-sm-4">
                      <input type="text" name="height" value="<?= $height; ?>" placeholder="<?= $entry_height; ?>" id="input-height" class="form-control" />
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-length-class"><?= $entry_length_class; ?></label>
                <div class="col-sm-10">
                  <select name="length_class_id" id="input-length-class" class="form-control">
                    <? foreach ($length_classes as $length_class) { ?>
                      <? if ($length_class['length_class_id'] == $length_class_id) { ?>
                        <option value="<?= $length_class['length_class_id']; ?>" selected="selected"><?= $length_class['title']; ?></option>
                      <? } else { ?>
                        <option value="<?= $length_class['length_class_id']; ?>"><?= $length_class['title']; ?></option>
                      <? } ?>
                    <? } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-weight"><?= $entry_weight; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="weight" value="<?= $weight; ?>" placeholder="<?= $entry_weight; ?>" id="input-weight" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-weight-class"><?= $entry_weight_class; ?></label>
                <div class="col-sm-10">
                  <select name="weight_class_id" id="input-weight-class" class="form-control">
                    <? foreach ($weight_classes as $weight_class) { ?>
                      <? if ($weight_class['weight_class_id'] == $weight_class_id) { ?>
                        <option value="<?= $weight_class['weight_class_id']; ?>" selected="selected"><?= $weight_class['title']; ?></option>
                      <? } else { ?>
                        <option value="<?= $weight_class['weight_class_id']; ?>"><?= $weight_class['title']; ?></option>
                      <? } ?>
                    <? } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?= $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="status" id="input-status" class="form-control">
                    <? if ($status) { ?>
                      <option value="1" selected="selected"><?= $text_enabled; ?></option>
                      <option value="0"><?= $text_disabled; ?></option>
                    <? } else { ?>
                      <option value="1"><?= $text_enabled; ?></option>
                      <option value="0" selected="selected"><?= $text_disabled; ?></option>
                    <? } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-noindex"><span data-toggle="tooltip" title="<?= $help_noindex; ?>"><?= $entry_noindex; ?></span></label>
                <div class="col-sm-10">
                  <select name="noindex" id="input-noindex" class="form-control">
                    <? if ($noindex) { ?>
                      <option value="1" selected="selected"><?= $text_enabled; ?></option>
                      <option value="0"><?= $text_disabled; ?></option>
                    <? } else { ?>
                      <option value="1"><?= $text_enabled; ?></option>
                      <option value="0" selected="selected"><?= $text_disabled; ?></option>
                    <? } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sort-order"><?= $entry_sort_order; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="sort_order" value="<?= $sort_order; ?>" placeholder="<?= $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-links">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-manufacturer"><span data-toggle="tooltip" title="<?= $help_manufacturer; ?>"><?= $entry_manufacturer; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="manufacturer" value="<?= $manufacturer; ?>" placeholder="<?= $entry_manufacturer; ?>" id="input-manufacturer" class="form-control" />
                  <input type="hidden" name="manufacturer_id" value="<?= $manufacturer_id; ?>" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-category"><?= $entry_main_category; ?></label>
                <div class="col-sm-10">
                  <select class="form-control" name="main_category_id">
                    <option value="0" selected="selected"><?= $text_none; ?></option>
                    <? foreach ($categories as $category) { ?>
                      <? if ($category['category_id'] == $main_category_id) { ?>
                        <option value="<?= $category['category_id']; ?>" selected="selected"><?= $category['name']; ?></option>
                      <? } else { ?>
                        <option value="<?= $category['category_id']; ?>"><?= $category['name']; ?></option>
                      <? } ?>
                    <? } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-category"><span data-toggle="tooltip" title="<?= $help_category; ?>"><?= $entry_category; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="category" value="" placeholder="<?= $entry_category; ?>" id="input-category" class="form-control" />
                  <div id="product-category" class="well well-sm" style="height: 150px; overflow: auto;">
                    <? foreach ($product_categories as $product_category) { ?>
                      <div id="product-category<?= $product_category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?= $product_category['name']; ?>
                        <input type="hidden" name="product_category[]" value="<?= $product_category['category_id']; ?>" />
                      </div>
                    <? } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-filter"><span data-toggle="tooltip" title="<?= $help_filter; ?>"><?= $entry_filter; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="filter" value="" placeholder="<?= $entry_filter; ?>" id="input-filter" class="form-control" />
                  <div id="product-filter" class="well well-sm" style="height: 150px; overflow: auto;">
                    <? foreach ($product_filters as $product_filter) { ?>
                      <div id="product-filter<?= $product_filter['filter_id']; ?>"><i class="fa fa-minus-circle"></i> <?= $product_filter['name']; ?>
                        <input type="hidden" name="product_filter[]" value="<?= $product_filter['filter_id']; ?>" />
                      </div>
                    <? } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?= $entry_store; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <div class="checkbox">
                      <label>
                        <? if (in_array(0, $product_store)) { ?>
                          <input type="checkbox" name="product_store[]" value="0" checked="checked" />
                          <?= $text_default; ?>
                        <? } else { ?>
                          <input type="checkbox" name="product_store[]" value="0" />
                          <?= $text_default; ?>
                        <? } ?>
                      </label>
                    </div>
                    <? foreach ($stores as $store) { ?>
                      <div class="checkbox">
                        <label>
                          <? if (in_array($store['store_id'], $product_store)) { ?>
                            <input type="checkbox" name="product_store[]" value="<?= $store['store_id']; ?>" checked="checked" />
                            <?= $store['name']; ?>
                          <? } else { ?>
                            <input type="checkbox" name="product_store[]" value="<?= $store['store_id']; ?>" />
                            <?= $store['name']; ?>
                          <? } ?>
                        </label>
                      </div>
                    <? } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-download"><span data-toggle="tooltip" title="<?= $help_download; ?>"><?= $entry_download; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="download" value="" placeholder="<?= $entry_download; ?>" id="input-download" class="form-control" />
                  <div id="product-download" class="well well-sm" style="height: 150px; overflow: auto;">
                    <? foreach ($product_downloads as $product_download) { ?>
                      <div id="product-download<?= $product_download['download_id']; ?>"><i class="fa fa-minus-circle"></i> <?= $product_download['name']; ?>
                        <input type="hidden" name="product_download[]" value="<?= $product_download['download_id']; ?>" />
                      </div>
                    <? } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-related"><span data-toggle="tooltip" title="<?= $help_related; ?>"><?= $entry_related; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="related" value="" placeholder="<?= $entry_related; ?>" id="input-related" class="form-control" />
                  <div id="product-related" class="well well-sm" style="height: 150px; overflow: auto;">
                    <? foreach ($product_relateds as $product_related) { ?>
                      <div id="product-related<?= $product_related['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?= $product_related['name']; ?>
                        <input type="hidden" name="product_related[]" value="<?= $product_related['product_id']; ?>" />
                      </div>
                    <? } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-related-article"><span data-toggle="tooltip" title="<?= $help_related; ?>"><?= $entry_related_article; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="product_related_article_input" value="" placeholder="<?= $entry_related_article; ?>" id="input-related-article" class="form-control" />
                  <div id="article-related" class="well well-sm" style="height: 150px; overflow: auto;">
                    <? foreach ($product_related_article as $product_related_article) { ?>
                      <div id="article-related<?= $product_related_article['article_id']; ?>"><i class="fa fa-minus-circle"></i> <?= $product_related_article['name']; ?>
                        <input type="hidden" name="product_related_article[]" value="<?= $product_related_article['article_id']; ?>" />
                      </div>
                    <? } ?>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-attribute">
              <div class="table-responsive">
                <table id="attribute" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?= $entry_attribute; ?></td>
                      <td class="text-left"><?= $entry_text; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <? $attribute_row = 0; ?>
                    <? foreach ($product_attributes as $product_attribute) { ?>
                      <tr id="attribute-row<?= $attribute_row; ?>">
                        <td class="text-left" style="width: 40%;"><input type="text" name="product_attribute[<?= $attribute_row; ?>][name]" value="<?= $product_attribute['name']; ?>" placeholder="<?= $entry_attribute; ?>" class="form-control" />
                          <input type="hidden" name="product_attribute[<?= $attribute_row; ?>][attribute_id]" value="<?= $product_attribute['attribute_id']; ?>" />
                        </td>
                        <td class="text-left"><? foreach ($languages as $language) { ?>
                            <div class="input-group"><span class="input-group-addon"><img src="language/<?= $language['code']; ?>/<?= $language['code']; ?>.png" title="<?= $language['name']; ?>" /></span>
                              <textarea name="product_attribute[<?= $attribute_row; ?>][product_attribute_description][<?= $language['language_id']; ?>][text]" rows="5" placeholder="<?= $entry_text; ?>" class="form-control"><?= isset($product_attribute['product_attribute_description'][$language['language_id']]) ? $product_attribute['product_attribute_description'][$language['language_id']]['text'] : ''; ?></textarea>
                            </div>
                          <? } ?>
                        </td>
                        <td class="text-left"><button type="button" onclick="$('#attribute-row<?= $attribute_row; ?>').remove();" data-toggle="tooltip" title="<?= $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                      </tr>
                      <? $attribute_row++; ?>
                    <? } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"></td>
                      <td class="text-left"><button type="button" onclick="addAttribute();" data-toggle="tooltip" title="<?= $button_attribute_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-option">
              <div class="row">
                <div class="col-sm-2">
                  <ul class="nav nav-pills nav-stacked" id="option">
                    <? $option_row = 0; ?>
                    <? foreach ($product_options as $product_option) { ?>
                      <li><a href="#tab-option<?= $option_row; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-option<?= $option_row; ?>\']').parent().remove(); $('#tab-option<?= $option_row; ?>').remove(); $('#option a:first').tab('show');"></i> <?= $product_option['name']; ?></a></li>
                      <? $option_row++; ?>
                    <? } ?>
                    <li>
                      <input type="text" name="option" value="" placeholder="<?= $entry_option; ?>" id="input-option" class="form-control" />
                    </li>
                  </ul>
                </div>
                <div class="col-sm-10">
                  <div class="tab-content">
                    <? $option_row = 0; ?>
                    <? $option_value_row = 0; ?>
                    <? foreach ($product_options as $product_option) { ?>
                      <div class="tab-pane" id="tab-option<?= $option_row; ?>">
                        <input type="hidden" name="product_option[<?= $option_row; ?>][product_option_id]" value="<?= $product_option['product_option_id']; ?>" />
                        <input type="hidden" name="product_option[<?= $option_row; ?>][name]" value="<?= $product_option['name']; ?>" />
                        <input type="hidden" name="product_option[<?= $option_row; ?>][option_id]" value="<?= $product_option['option_id']; ?>" />
                        <input type="hidden" name="product_option[<?= $option_row; ?>][type]" value="<?= $product_option['type']; ?>" />
                        <div class="form-group">
                          <label class="col-sm-2 control-label" for="input-required<?= $option_row; ?>"><?= $entry_required; ?></label>
                          <div class="col-sm-10">
                            <select name="product_option[<?= $option_row; ?>][required]" id="input-required<?= $option_row; ?>" class="form-control">
                              <? if ($product_option['required']) { ?>
                                <option value="1" selected="selected"><?= $text_yes; ?></option>
                                <option value="0"><?= $text_no; ?></option>
                              <? } else { ?>
                                <option value="1"><?= $text_yes; ?></option>
                                <option value="0" selected="selected"><?= $text_no; ?></option>
                              <? } ?>
                            </select>
                          </div>
                        </div>
                        <? if ($product_option['type'] == 'text') { ?>
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-value<?= $option_row; ?>"><?= $entry_option_value; ?></label>
                            <div class="col-sm-10">
                              <input type="text" name="product_option[<?= $option_row; ?>][value]" value="<?= $product_option['value']; ?>" placeholder="<?= $entry_option_value; ?>" id="input-value<?= $option_row; ?>" class="form-control" />
                            </div>
                          </div>
                        <? } ?>
                        <? if ($product_option['type'] == 'textarea') { ?>
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-value<?= $option_row; ?>"><?= $entry_option_value; ?></label>
                            <div class="col-sm-10">
                              <textarea name="product_option[<?= $option_row; ?>][value]" rows="5" placeholder="<?= $entry_option_value; ?>" id="input-value<?= $option_row; ?>" class="form-control"><?= $product_option['value']; ?></textarea>
                            </div>
                          </div>
                        <? } ?>
                        <? if ($product_option['type'] == 'file') { ?>
                          <div class="form-group" style="display: none;">
                            <label class="col-sm-2 control-label" for="input-value<?= $option_row; ?>"><?= $entry_option_value; ?></label>
                            <div class="col-sm-10">
                              <input type="text" name="product_option[<?= $option_row; ?>][value]" value="<?= $product_option['value']; ?>" placeholder="<?= $entry_option_value; ?>" id="input-value<?= $option_row; ?>" class="form-control" />
                            </div>
                          </div>
                        <? } ?>
                        <? if ($product_option['type'] == 'date') { ?>
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-value<?= $option_row; ?>"><?= $entry_option_value; ?></label>
                            <div class="col-sm-3">
                              <div class="input-group date">
                                <input type="text" name="product_option[<?= $option_row; ?>][value]" value="<?= $product_option['value']; ?>" placeholder="<?= $entry_option_value; ?>" data-date-format="YYYY-MM-DD" id="input-value<?= $option_row; ?>" class="form-control" />
                                <span class="input-group-btn">
                                  <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                </span>
                              </div>
                            </div>
                          </div>
                        <? } ?>
                        <? if ($product_option['type'] == 'time') { ?>
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-value<?= $option_row; ?>"><?= $entry_option_value; ?></label>
                            <div class="col-sm-10">
                              <div class="input-group time">
                                <input type="text" name="product_option[<?= $option_row; ?>][value]" value="<?= $product_option['value']; ?>" placeholder="<?= $entry_option_value; ?>" data-date-format="HH:mm" id="input-value<?= $option_row; ?>" class="form-control" />
                                <span class="input-group-btn">
                                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                </span>
                              </div>
                            </div>
                          </div>
                        <? } ?>
                        <? if ($product_option['type'] == 'datetime') { ?>
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-value<?= $option_row; ?>"><?= $entry_option_value; ?></label>
                            <div class="col-sm-10">
                              <div class="input-group datetime">
                                <input type="text" name="product_option[<?= $option_row; ?>][value]" value="<?= $product_option['value']; ?>" placeholder="<?= $entry_option_value; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-value<?= $option_row; ?>" class="form-control" />
                                <span class="input-group-btn">
                                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                </span>
                              </div>
                            </div>
                          </div>
                        <? } ?>
                        <? if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') { ?>
                          <div class="table-responsive">
                            <table id="option-value<?= $option_row; ?>" class="table table-striped table-bordered table-hover">
                              <thead>
                                <tr>
                                  <td class="text-left"><?= $entry_option_value; ?></td>
                                  <td class="text-right"><?= $entry_quantity; ?></td>
                                  <td class="text-left"><?= $entry_subtract; ?></td>
                                  <td class="text-right"><?= $entry_price; ?></td>
                                  <td class="text-right"><?= $entry_option_points; ?></td>
                                  <td class="text-right"><?= $entry_weight; ?></td>
                                  <td></td>
                                </tr>
                              </thead>
                              <tbody>
                                <? foreach ($product_option['product_option_value'] as $product_option_value) { ?>
                                  <tr id="option-value-row<?= $option_value_row; ?>">
                                    <td class="text-left"><select name="product_option[<?= $option_row; ?>][product_option_value][<?= $option_value_row; ?>][option_value_id]" class="form-control">
                                        <? if (isset($option_values[$product_option['option_id']])) { ?>
                                          <? foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                                            <? if ($option_value['option_value_id'] == $product_option_value['option_value_id']) { ?>
                                              <option value="<?= $option_value['option_value_id']; ?>" selected="selected"><?= $option_value['name']; ?></option>
                                            <? } else { ?>
                                              <option value="<?= $option_value['option_value_id']; ?>"><?= $option_value['name']; ?></option>
                                            <? } ?>
                                          <? } ?>
                                        <? } ?>
                                      </select>
                                      <input type="hidden" name="product_option[<?= $option_row; ?>][product_option_value][<?= $option_value_row; ?>][product_option_value_id]" value="<?= $product_option_value['product_option_value_id']; ?>" />
                                    </td>
                                    <td class="text-right"><input type="text" name="product_option[<?= $option_row; ?>][product_option_value][<?= $option_value_row; ?>][quantity]" value="<?= $product_option_value['quantity']; ?>" placeholder="<?= $entry_quantity; ?>" class="form-control" /></td>
                                    <td class="text-left"><select name="product_option[<?= $option_row; ?>][product_option_value][<?= $option_value_row; ?>][subtract]" class="form-control">
                                        <? if ($product_option_value['subtract']) { ?>
                                          <option value="1" selected="selected"><?= $text_yes; ?></option>
                                          <option value="0"><?= $text_no; ?></option>
                                        <? } else { ?>
                                          <option value="1"><?= $text_yes; ?></option>
                                          <option value="0" selected="selected"><?= $text_no; ?></option>
                                        <? } ?>
                                      </select></td>
                                    <td class="text-right"><select name="product_option[<?= $option_row; ?>][product_option_value][<?= $option_value_row; ?>][price_prefix]" class="form-control">
                                        <? if ($product_option_value['price_prefix'] == '+') { ?>
                                          <option value="+" selected="selected">+</option>
                                        <? } else { ?>
                                          <option value="+">+</option>
                                        <? } ?>
                                        <? if ($product_option_value['price_prefix'] == '-') { ?>
                                          <option value="-" selected="selected">-</option>
                                        <? } else { ?>
                                          <option value="-">-</option>
                                        <? } ?>
                                      </select>
                                      <input type="text" name="product_option[<?= $option_row; ?>][product_option_value][<?= $option_value_row; ?>][price]" value="<?= $product_option_value['price']; ?>" placeholder="<?= $entry_price; ?>" class="form-control" />
                                    </td>
                                    <td class="text-right"><select name="product_option[<?= $option_row; ?>][product_option_value][<?= $option_value_row; ?>][points_prefix]" class="form-control">
                                        <? if ($product_option_value['points_prefix'] == '+') { ?>
                                          <option value="+" selected="selected">+</option>
                                        <? } else { ?>
                                          <option value="+">+</option>
                                        <? } ?>
                                        <? if ($product_option_value['points_prefix'] == '-') { ?>
                                          <option value="-" selected="selected">-</option>
                                        <? } else { ?>
                                          <option value="-">-</option>
                                        <? } ?>
                                      </select>
                                      <input type="text" name="product_option[<?= $option_row; ?>][product_option_value][<?= $option_value_row; ?>][points]" value="<?= $product_option_value['points']; ?>" placeholder="<?= $entry_points; ?>" class="form-control" />
                                    </td>
                                    <td class="text-right"><select name="product_option[<?= $option_row; ?>][product_option_value][<?= $option_value_row; ?>][weight_prefix]" class="form-control">
                                        <? if ($product_option_value['weight_prefix'] == '+') { ?>
                                          <option value="+" selected="selected">+</option>
                                        <? } else { ?>
                                          <option value="+">+</option>
                                        <? } ?>
                                        <? if ($product_option_value['weight_prefix'] == '-') { ?>
                                          <option value="-" selected="selected">-</option>
                                        <? } else { ?>
                                          <option value="-">-</option>
                                        <? } ?>
                                      </select>
                                      <input type="text" name="product_option[<?= $option_row; ?>][product_option_value][<?= $option_value_row; ?>][weight]" value="<?= $product_option_value['weight']; ?>" placeholder="<?= $entry_weight; ?>" class="form-control" />
                                    </td>
                                    <td class="text-left"><button type="button" onclick="$(this).tooltip('destroy');$('#option-value-row<?= $option_value_row; ?>').remove();" data-toggle="tooltip" title="<?= $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                                  </tr>
                                  <? $option_value_row++; ?>
                                <? } ?>
                              </tbody>
                              <tfoot>
                                <tr>
                                  <td colspan="6"></td>
                                  <td class="text-left"><button type="button" onclick="addOptionValue('<?= $option_row; ?>');" data-toggle="tooltip" title="<?= $button_option_value_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                                </tr>
                              </tfoot>
                            </table>
                          </div>
                          <select id="option-values<?= $option_row; ?>" style="display: none;">
                            <? if (isset($option_values[$product_option['option_id']])) { ?>
                              <? foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                                <option value="<?= $option_value['option_value_id']; ?>"><?= $option_value['name']; ?></option>
                              <? } ?>
                            <? } ?>
                          </select>
                        <? } ?>
                      </div>
                      <? $option_row++; ?>
                    <? } ?>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-recurring">
              <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?= $entry_recurring; ?></td>
                      <td class="text-left"><?= $entry_customer_group; ?></td>
                      <td class="text-left"></td>
                    </tr>
                  </thead>
                  <tbody>
                    <? $recurring_row = 0; ?>
                    <? foreach ($product_recurrings as $product_recurring) { ?>

                      <tr id="recurring-row<?= $recurring_row; ?>">
                        <td class="text-left"><select name="product_recurring[<?= $recurring_row; ?>][recurring_id]" class="form-control">
                            <? foreach ($recurrings as $recurring) { ?>
                              <? if ($recurring['recurring_id'] == $product_recurring['recurring_id']) { ?>
                                <option value="<?= $recurring['recurring_id']; ?>" selected="selected"><?= $recurring['name']; ?></option>
                              <? } else { ?>
                                <option value="<?= $recurring['recurring_id']; ?>"><?= $recurring['name']; ?></option>
                              <? } ?>
                            <? } ?>
                          </select></td>
                        <td class="text-left"><select name="product_recurring[<?= $recurring_row; ?>][customer_group_id]" class="form-control">
                            <? foreach ($customer_groups as $customer_group) { ?>
                              <? if ($customer_group['customer_group_id'] == $product_recurring['customer_group_id']) { ?>
                                <option value="<?= $customer_group['customer_group_id']; ?>" selected="selected"><?= $customer_group['name']; ?></option>
                              <? } else { ?>
                                <option value="<?= $customer_group['customer_group_id']; ?>"><?= $customer_group['name']; ?></option>
                              <? } ?>
                            <? } ?>
                          </select></td>
                        <td class="text-left"><button type="button" onclick="$('#recurring-row<?= $recurring_row; ?>').remove()" data-toggle="tooltip" title="<?= $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                      </tr>
                      <? $recurring_row++; ?>
                    <? } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"></td>
                      <td class="text-left"><button type="button" onclick="addRecurring()" data-toggle="tooltip" title="<?= $button_recurring_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-discount">
              <div class="table-responsive">
                <table id="discount" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?= $entry_customer_group; ?></td>
                      <td class="text-right"><?= $entry_quantity; ?></td>
                      <td class="text-right"><?= $entry_priority; ?></td>
                      <td class="text-right"><?= $entry_price; ?></td>
                      <td class="text-left"><?= $entry_date_start; ?></td>
                      <td class="text-left"><?= $entry_date_end; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <? $discount_row = 0; ?>
                    <? foreach ($product_discounts as $product_discount) { ?>
                      <tr id="discount-row<?= $discount_row; ?>">
                        <td class="text-left"><select name="product_discount[<?= $discount_row; ?>][customer_group_id]" class="form-control">
                            <? foreach ($customer_groups as $customer_group) { ?>
                              <? if ($customer_group['customer_group_id'] == $product_discount['customer_group_id']) { ?>
                                <option value="<?= $customer_group['customer_group_id']; ?>" selected="selected"><?= $customer_group['name']; ?></option>
                              <? } else { ?>
                                <option value="<?= $customer_group['customer_group_id']; ?>"><?= $customer_group['name']; ?></option>
                              <? } ?>
                            <? } ?>
                          </select></td>
                        <td class="text-right"><input type="text" name="product_discount[<?= $discount_row; ?>][quantity]" value="<?= $product_discount['quantity']; ?>" placeholder="<?= $entry_quantity; ?>" class="form-control" /></td>
                        <td class="text-right"><input type="text" name="product_discount[<?= $discount_row; ?>][priority]" value="<?= $product_discount['priority']; ?>" placeholder="<?= $entry_priority; ?>" class="form-control" /></td>
                        <td class="text-right"><input type="text" name="product_discount[<?= $discount_row; ?>][price]" value="<?= $product_discount['price']; ?>" placeholder="<?= $entry_price; ?>" class="form-control" /></td>
                        <td class="text-left" style="width: 20%;">
                          <div class="input-group date">
                            <input type="text" name="product_discount[<?= $discount_row; ?>][date_start]" value="<?= $product_discount['date_start']; ?>" placeholder="<?= $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                            <span class="input-group-btn">
                              <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                            </span>
                          </div>
                        </td>
                        <td class="text-left" style="width: 20%;">
                          <div class="input-group date">
                            <input type="text" name="product_discount[<?= $discount_row; ?>][date_end]" value="<?= $product_discount['date_end']; ?>" placeholder="<?= $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                            <span class="input-group-btn">
                              <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                            </span>
                          </div>
                        </td>
                        <td class="text-left"><button type="button" onclick="$('#discount-row<?= $discount_row; ?>').remove();" data-toggle="tooltip" title="<?= $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                      </tr>
                      <? $discount_row++; ?>
                    <? } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="6"></td>
                      <td class="text-left"><button type="button" onclick="addDiscount();" data-toggle="tooltip" title="<?= $button_discount_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-special">
              <div class="table-responsive">
                <table id="special" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?= $entry_customer_group; ?></td>
                      <td class="text-right"><?= $entry_priority; ?></td>
                      <td class="text-right"><?= $entry_price; ?></td>
                      <td class="text-left"><?= $entry_date_start; ?></td>
                      <td class="text-left"><?= $entry_date_end; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <? $special_row = 0; ?>
                    <? foreach ($product_specials as $product_special) { ?>
                      <tr id="special-row<?= $special_row; ?>">
                        <td class="text-left"><select name="product_special[<?= $special_row; ?>][customer_group_id]" class="form-control">
                            <? foreach ($customer_groups as $customer_group) { ?>
                              <? if ($customer_group['customer_group_id'] == $product_special['customer_group_id']) { ?>
                                <option value="<?= $customer_group['customer_group_id']; ?>" selected="selected"><?= $customer_group['name']; ?></option>
                              <? } else { ?>
                                <option value="<?= $customer_group['customer_group_id']; ?>"><?= $customer_group['name']; ?></option>
                              <? } ?>
                            <? } ?>
                          </select></td>
                        <td class="text-right"><input type="text" name="product_special[<?= $special_row; ?>][priority]" value="<?= $product_special['priority']; ?>" placeholder="<?= $entry_priority; ?>" class="form-control" /></td>
                        <td class="text-right"><input type="text" name="product_special[<?= $special_row; ?>][price]" value="<?= $product_special['price']; ?>" placeholder="<?= $entry_price; ?>" class="form-control" /></td>
                        <td class="text-left" style="width: 20%;">
                          <div class="input-group date">
                            <input type="text" name="product_special[<?= $special_row; ?>][date_start]" value="<?= $product_special['date_start']; ?>" placeholder="<?= $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                            <span class="input-group-btn">
                              <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                            </span>
                          </div>
                        </td>
                        <td class="text-left" style="width: 20%;">
                          <div class="input-group date">
                            <input type="text" name="product_special[<?= $special_row; ?>][date_end]" value="<?= $product_special['date_end']; ?>" placeholder="<?= $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                            <span class="input-group-btn">
                              <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                            </span>
                          </div>
                        </td>
                        <td class="text-left"><button type="button" onclick="$('#special-row<?= $special_row; ?>').remove();" data-toggle="tooltip" title="<?= $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                      </tr>
                      <? $special_row++; ?>
                    <? } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="5"></td>
                      <td class="text-left"><button type="button" onclick="addSpecial();" data-toggle="tooltip" title="<?= $button_special_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-image">
              <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?= $entry_image; ?></td>
                    </tr>
                  </thead>

                  <tbody>
                    <tr>
                      <td class="text-left"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?= $thumb; ?>" alt="" title="" data-placeholder="<?= $placeholder; ?>" /></a><input type="hidden" name="image" value="<?= $image; ?>" id="input-image" /></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div class="table-responsive">
                <table id="images" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?= $entry_additional_image; ?></td>
                      <td class="text-right"><?= $entry_sort_order; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <? $image_row = 0; ?>
                    <? foreach ($product_images as $product_image) { ?>
                      <tr id="image-row<?= $image_row; ?>">
                        <td class="text-left"><a href="" id="thumb-image<?= $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?= $product_image['thumb']; ?>" alt="" title="" data-placeholder="<?= $placeholder; ?>" /></a><input type="hidden" name="product_image[<?= $image_row; ?>][image]" value="<?= $product_image['image']; ?>" id="input-image<?= $image_row; ?>" /></td>
                        <td class="text-right"><input type="text" name="product_image[<?= $image_row; ?>][sort_order]" value="<?= $product_image['sort_order']; ?>" placeholder="<?= $entry_sort_order; ?>" class="form-control" /></td>
                        <td class="text-left"><button type="button" onclick="$('#image-row<?= $image_row; ?>').remove();" data-toggle="tooltip" title="<?= $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                      </tr>
                      <? $image_row++; ?>
                    <? } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"></td>
                      <td class="text-left"><button type="button" onclick="addImage();" data-toggle="tooltip" title="<?= $button_image_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-extra">
              <div class="row">
                <div class="col-sm-2">
                  <ul class="nav nav-pills nav-stacked" id="extra">
                    <? $tab_row = 0; ?>
                    <? foreach ($product_tabs as $tab) {  ?>
                      <li><a href="#tab-extra<?= $tab_row; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-extra<?= $tab_row; ?>\']').parent().remove(); $('#tab-extra<?= $tab_row; ?>').remove(); $('#extra a:first').tab('show');"></i> Tab-<?= $tab_row ?></a></li>
                      <? $tab_row++; ?>
                    <? } ?>
                    <li id="extratab-add"><a style="cursor:pointer" onclick="addproducttab();"><i class="fa fa-plus-circle"></i> <?= $text_add; ?></a></li>
                  </ul>
                </div>
                <? $tab_row = 0; ?>
                <div class="col-sm-10">
                  <div class="tab-content">
                    <? foreach ($product_tabs as $tab) {  ?>
                      <div class="tab-pane" id="tab-extra<?= $tab_row; ?>">
                        <ul class="nav nav-tabs" id="language<?= $tab_row; ?>">
                          <? foreach ($languages as $language) { ?>
                            <li><a href="#tab-extra-<?= $tab_row; ?>-language<?= $language['language_id']; ?>" data-toggle="tab"><img src="language/<?= $language['code']; ?>/<?= $language['code']; ?>.png" title="<?= $language['name']; ?>" /> <?= $language['name']; ?></a></li>
                          <? } ?>
                        </ul>
                        <div class="tab-content">
                          <? foreach ($languages as $language) { ?>
                            <div class="tab-pane" id="tab-extra-<?= $tab_row; ?>-language<?= $language['language_id']; ?>">

                              <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-heading<?= $tab_row; ?>-language<?= $language['language_id']; ?>"><?= $entry_heading; ?></label>
                                <div class="col-sm-10">
                                  <input name="product_tab[<?= $tab_row; ?>][description][<?= $language['language_id']; ?>][heading]" type="text" placeholder="<?= $entry_heading; ?>" id="input-heading<?= $tab_row; ?>-language<?= $language['language_id']; ?>" value="<?= (isset($tab['description'][$language['language_id']]) ? $tab['description'][$language['language_id']]['heading'] : null) ?>" class="form-control" />
                                  <? if (isset($error_tab[$tab_row][$language['language_id']])) { ?>
                                    <div class="text-danger"><?= $error_tab[$tab_row][$language['language_id']]; ?></div>
                                  <? } ?>
                                </div>
                              </div>

                              <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-description<?= $tab_row; ?>-language<?= $language['language_id']; ?>"><?= $entry_description; ?></label>
                                <div class="col-sm-10">
                                  <textarea name="product_tab[<?= $tab_row; ?>][description][<?= $language['language_id']; ?>][description]" placeholder="<?= $entry_description; ?>" id="input-description<?= $tab_row; ?>-language<?= $language['language_id']; ?>" class="form-control"><?= (isset($tab['description'][$language['language_id']]) ? $tab['description'][$language['language_id']]['description'] : null) ?></textarea>
                                </div>
                              </div>

                              <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-subtitle<?= $tab_row; ?>-language<?= $language['language_id']; ?>">Пояснение</label>
                                <div class="col-sm-10">
                                  <input name="product_tab[<?= $tab_row; ?>][description][<?= $language['language_id']; ?>][subtitle]" type="text" placeholder="Пояснение под описанием" id="input-subtitle<?= $tab_row; ?>-language<?= $language['language_id']; ?>" value="<?= (isset($tab['description'][$language['language_id']]) ? $tab['description'][$language['language_id']]['subtitle'] : null) ?>" class="form-control" />
                                </div>
                              </div>

                              <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-image<?= $tab_row; ?>-language<?= $language['language_id']; ?>">Картинка</label>
                                <div class="col-sm-10">
                                  <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail">
                                    <img src="<?= isset($tab['description'][$language['language_id']]) ? $tab['description'][$language['language_id']]['thumb'] : ''; ?>" alt="" title="" data-placeholder="<?= $placeholder; ?>" />
                                  </a>
                                  <input type="hidden" name="product_tab[<?= $tab_row; ?>][description][<?= $language['language_id']; ?>][image]" value="<?= isset($tab['description'][$language['language_id']]) ? $tab['description'][$language['language_id']]['image'] : ''; ?>" id="input-image<?= $tab_row; ?>-language<?= $language['language_id']; ?>" />
                                </div>
                              </div>


                              <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-color<?= $tab_row; ?>">Цвет фона</label>
                                <div class="col-sm-10">
                                  <input name="product_tab[<?= $tab_row; ?>][color]" type="color" id="input-color<?= $tab_row; ?>" value="<?= (isset($tab['color']) ? $tab['color'] : '') ?>" class="form-control" style="height: 50px !important; width: 60px;" />
                                </div>
                              </div>

                            </div>
                          <? } ?>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label" for="input-status<?= $tab_row; ?>"><?= $entry_status; ?></label>
                          <div class="col-sm-10">
                            <select name="product_tab[<?= $tab_row; ?>][status]" id="input-status<?= $tab_row; ?>" class="form-control">
                              <? if (isset($tab['status']) && $tab['status']) { ?>
                                <option value="1" selected="selected"><?= $text_enabled; ?></option>
                                <option value="0"><?= $text_disabled; ?></option>
                              <? } else { ?>
                                <option value="1"><?= $text_enabled; ?></option>
                                <option value="0" selected="selected"><?= $text_disabled; ?></option>
                              <? } ?>
                            </select>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label" for="input-sort-order<?= $tab_row; ?>"><?= $entry_sort_order; ?></label>
                          <div class="col-sm-10">
                            <input type="text" name="product_tab[<?= $tab_row; ?>][sort_order]" value="<?= isset($tab['sort_order']) ? $tab['sort_order'] : '';  ?>" placeholder="<?= $entry_sort_order; ?>" id="input-sort-order<?= $tab_row; ?>" class="form-control" />
                          </div>
                        </div>
                        <? $tab_row++; ?>
                      </div>
                    <? } ?>
                  </div>

                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-reward">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-points"><span data-toggle="tooltip" title="<?= $help_points; ?>"><?= $entry_points; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="points" value="<?= $points; ?>" placeholder="<?= $entry_points; ?>" id="input-points" class="form-control" />
                </div>
              </div>
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?= $entry_customer_group; ?></td>
                      <td class="text-right"><?= $entry_reward; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <? foreach ($customer_groups as $customer_group) { ?>
                      <tr>
                        <td class="text-left"><?= $customer_group['name']; ?></td>
                        <td class="text-right"><input type="text" name="product_reward[<?= $customer_group['customer_group_id']; ?>][points]" value="<?= isset($product_reward[$customer_group['customer_group_id']]) ? $product_reward[$customer_group['customer_group_id']]['points'] : ''; ?>" class="form-control" /></td>
                      </tr>
                    <? } ?>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-design">
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?= $entry_store; ?></td>
                      <td class="text-left"><?= $entry_layout; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="text-left"><?= $text_default; ?></td>
                      <td class="text-left"><select name="product_layout[0]" class="form-control">
                          <option value=""></option>
                          <? foreach ($layouts as $layout) { ?>
                            <? if (isset($product_layout[0]) && $product_layout[0] == $layout['layout_id']) { ?>
                              <option value="<?= $layout['layout_id']; ?>" selected="selected"><?= $layout['name']; ?></option>
                            <? } else { ?>
                              <option value="<?= $layout['layout_id']; ?>"><?= $layout['name']; ?></option>
                            <? } ?>
                          <? } ?>
                        </select></td>
                    </tr>
                    <? foreach ($stores as $store) { ?>
                      <tr>
                        <td class="text-left"><?= $store['name']; ?></td>
                        <td class="text-left"><select name="product_layout[<?= $store['store_id']; ?>]" class="form-control">
                            <option value=""></option>
                            <? foreach ($layouts as $layout) { ?>
                              <? if (isset($product_layout[$store['store_id']]) && $product_layout[$store['store_id']] == $layout['layout_id']) { ?>
                                <option value="<?= $layout['layout_id']; ?>" selected="selected"><?= $layout['name']; ?></option>
                              <? } else { ?>
                                <option value="<?= $layout['layout_id']; ?>"><?= $layout['name']; ?></option>
                              <? } ?>
                            <? } ?>
                          </select></td>
                      </tr>
                    <? } ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
  <script type="text/javascript">
    <!--
    // Manufacturer
    $('input[name=\'manufacturer\']').autocomplete({
      'source': function(request, response) {
        $.ajax({
          url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?= $token; ?>&filter_name=' + encodeURIComponent(request),
          dataType: 'json',
          success: function(json) {
            json.unshift({
              manufacturer_id: 0,
              name: '<?= $text_none; ?>'
            });

            response($.map(json, function(item) {
              return {
                label: item['name'],
                value: item['manufacturer_id']
              }
            }));
          }
        });
      },
      'select': function(item) {
        $('input[name=\'manufacturer\']').val(item['label']);
        $('input[name=\'manufacturer_id\']').val(item['value']);
      }
    });

    // Category
    $('input[name=\'category\']').autocomplete({
      'source': function(request, response) {
        $.ajax({
          url: 'index.php?route=catalog/category/autocomplete&token=<?= $token; ?>&filter_name=' + encodeURIComponent(request),
          dataType: 'json',
          success: function(json) {
            response($.map(json, function(item) {
              return {
                label: item['name'],
                value: item['category_id']
              }
            }));
          }
        });
      },
      'select': function(item) {
        $('input[name=\'category\']').val('');

        $('#product-category' + item['value']).remove();

        $('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');
      }
    });

    $('#product-category').delegate('.fa-minus-circle', 'click', function() {
      $(this).parent().remove();
    });

    // Filter
    $('input[name=\'filter\']').autocomplete({
      'source': function(request, response) {
        $.ajax({
          url: 'index.php?route=catalog/filter/autocomplete&token=<?= $token; ?>&filter_name=' + encodeURIComponent(request),
          dataType: 'json',
          success: function(json) {
            response($.map(json, function(item) {
              return {
                label: item['name'],
                value: item['filter_id']
              }
            }));
          }
        });
      },
      'select': function(item) {
        $('input[name=\'filter\']').val('');

        $('#product-filter' + item['value']).remove();

        $('#product-filter').append('<div id="product-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_filter[]" value="' + item['value'] + '" /></div>');
      }
    });

    $('#product-filter').delegate('.fa-minus-circle', 'click', function() {
      $(this).parent().remove();
    });

    // Downloads
    $('input[name=\'download\']').autocomplete({
      'source': function(request, response) {
        $.ajax({
          url: 'index.php?route=catalog/download/autocomplete&token=<?= $token; ?>&filter_name=' + encodeURIComponent(request),
          dataType: 'json',
          success: function(json) {
            response($.map(json, function(item) {
              return {
                label: item['name'],
                value: item['download_id']
              }
            }));
          }
        });
      },
      'select': function(item) {
        $('input[name=\'download\']').val('');

        $('#product-download' + item['value']).remove();

        $('#product-download').append('<div id="product-download' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_download[]" value="' + item['value'] + '" /></div>');
      }
    });

    $('#product-download').delegate('.fa-minus-circle', 'click', function() {
      $(this).parent().remove();
    });

    // Related
    $('input[name=\'related\']').autocomplete({
      'source': function(request, response) {
        $.ajax({
          url: 'index.php?route=catalog/product/autocomplete&token=<?= $token; ?>&filter_name=' + encodeURIComponent(request),
          dataType: 'json',
          success: function(json) {
            response($.map(json, function(item) {
              return {
                label: item['name'],
                value: item['product_id']
              }
            }));
          }
        });
      },
      'select': function(item) {
        $('input[name=\'related\']').val('');

        $('#product-related' + item['value']).remove();

        $('#product-related').append('<div id="product-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_related[]" value="' + item['value'] + '" /></div>');
      }
    });

    $('#product-related').delegate('.fa-minus-circle', 'click', function() {
      $(this).parent().remove();
    });

    // Related Article
    $('input[name=\'product_related_article_input\']').autocomplete({
      'source': function(request, response) {
        $.ajax({
          url: 'index.php?route=blog/article/autocomplete&token=<?= $token; ?>&filter_name=' + encodeURIComponent(request),
          dataType: 'json',
          success: function(json) {
            response($.map(json, function(item) {
              return {
                label: item['name'],
                value: item['article_id']
              }
            }));
          }
        });
      },
      'select': function(item) {
        $('input[name=\'product_related_article\']').val('');

        $('#article-related' + item['value']).remove();

        $('#article-related').append('<div id="article-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_related_article[]" value="' + item['value'] + '" /></div>');
      }
    });

    $('#article-related').delegate('.fa-minus-circle', 'click', function() {
      $(this).parent().remove();
    });
    //
    -->
  </script>
  <script type="text/javascript">
    <!--
    var attribute_row = <?= $attribute_row; ?>;

    function addAttribute() {
      html = '<tr id="attribute-row' + attribute_row + '">';
      html += '  <td class="text-left" style="width: 20%;"><input type="text" name="product_attribute[' + attribute_row + '][name]" value="" placeholder="<?= $entry_attribute; ?>" class="form-control" /><input type="hidden" name="product_attribute[' + attribute_row + '][attribute_id]" value="" /></td>';
      html += '  <td class="text-left">';
      <? foreach ($languages as $language) { ?>
        html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?= $language['code']; ?>/<?= $language['code']; ?>.png" title="<?= $language['name']; ?>" /></span><textarea name="product_attribute[' + attribute_row + '][product_attribute_description][<?= $language['language_id']; ?>][text]" rows="5" placeholder="<?= $entry_text; ?>" class="form-control"></textarea></div>';
      <? } ?>
      html += '  </td>';
      html += '  <td class="text-left"><button type="button" onclick="$(\'#attribute-row' + attribute_row + '\').remove();" data-toggle="tooltip" title="<?= $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
      html += '</tr>';

      $('#attribute tbody').append(html);

      attributeautocomplete(attribute_row);

      attribute_row++;
    }

    function attributeautocomplete(attribute_row) {
      $('input[name=\'product_attribute[' + attribute_row + '][name]\']').autocomplete({
        'source': function(request, response) {
          $.ajax({
            url: 'index.php?route=catalog/attribute/autocomplete&token=<?= $token; ?>&filter_name=' + encodeURIComponent(request),
            dataType: 'json',
            success: function(json) {
              response($.map(json, function(item) {
                return {
                  category: item.attribute_group,
                  label: item.name,
                  value: item.attribute_id
                }
              }));
            }
          });
        },
        'select': function(item) {
          $('input[name=\'product_attribute[' + attribute_row + '][name]\']').val(item['label']);
          $('input[name=\'product_attribute[' + attribute_row + '][attribute_id]\']').val(item['value']);
        }
      });
    }

    $('#attribute tbody tr').each(function(index, element) {
      attributeautocomplete(index);
    });
    //
    -->
  </script>
  <script type="text/javascript">
    <!--
    var option_row = <?= $option_row; ?>;

    $('input[name=\'option\']').autocomplete({
      'source': function(request, response) {
        $.ajax({
          url: 'index.php?route=catalog/option/autocomplete&token=<?= $token; ?>&filter_name=' + encodeURIComponent(request),
          dataType: 'json',
          success: function(json) {
            response($.map(json, function(item) {
              return {
                category: item['category'],
                label: item['name'],
                value: item['option_id'],
                type: item['type'],
                option_value: item['option_value']
              }
            }));
          }
        });
      },
      'select': function(item) {
        html = '<div class="tab-pane" id="tab-option' + option_row + '">';
        html += '	<input type="hidden" name="product_option[' + option_row + '][product_option_id]" value="" />';
        html += '	<input type="hidden" name="product_option[' + option_row + '][name]" value="' + item['label'] + '" />';
        html += '	<input type="hidden" name="product_option[' + option_row + '][option_id]" value="' + item['value'] + '" />';
        html += '	<input type="hidden" name="product_option[' + option_row + '][type]" value="' + item['type'] + '" />';

        html += '	<div class="form-group">';
        html += '	  <label class="col-sm-2 control-label" for="input-required' + option_row + '"><?= $entry_required; ?></label>';
        html += '	  <div class="col-sm-10"><select name="product_option[' + option_row + '][required]" id="input-required' + option_row + '" class="form-control">';
        html += '	      <option value="1"><?= $text_yes; ?></option>';
        html += '	      <option value="0"><?= $text_no; ?></option>';
        html += '	  </select></div>';
        html += '	</div>';

        if (item['type'] == 'text') {
          html += '	<div class="form-group">';
          html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?= $entry_option_value; ?></label>';
          html += '	  <div class="col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?= $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control" /></div>';
          html += '	</div>';
        }

        if (item['type'] == 'textarea') {
          html += '	<div class="form-group">';
          html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?= $entry_option_value; ?></label>';
          html += '	  <div class="col-sm-10"><textarea name="product_option[' + option_row + '][value]" rows="5" placeholder="<?= $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control"></textarea></div>';
          html += '	</div>';
        }

        if (item['type'] == 'file') {
          html += '	<div class="form-group" style="display: none;">';
          html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?= $entry_option_value; ?></label>';
          html += '	  <div class="col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?= $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control" /></div>';
          html += '	</div>';
        }

        if (item['type'] == 'date') {
          html += '	<div class="form-group">';
          html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?= $entry_option_value; ?></label>';
          html += '	  <div class="col-sm-3"><div class="input-group date"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?= $entry_option_value; ?>" data-date-format="YYYY-MM-DD" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
          html += '	</div>';
        }

        if (item['type'] == 'time') {
          html += '	<div class="form-group">';
          html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?= $entry_option_value; ?></label>';
          html += '	  <div class="col-sm-10"><div class="input-group time"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?= $entry_option_value; ?>" data-date-format="HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
          html += '	</div>';
        }

        if (item['type'] == 'datetime') {
          html += '	<div class="form-group">';
          html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?= $entry_option_value; ?></label>';
          html += '	  <div class="col-sm-10"><div class="input-group datetime"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?= $entry_option_value; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
          html += '	</div>';
        }

        if (item['type'] == 'select' || item['type'] == 'radio' || item['type'] == 'checkbox' || item['type'] == 'image') {
          html += '<div class="table-responsive">';
          html += '  <table id="option-value' + option_row + '" class="table table-striped table-bordered table-hover">';
          html += '  	 <thead>';
          html += '      <tr>';
          html += '        <td class="text-left"><?= $entry_option_value; ?></td>';
          html += '        <td class="text-right"><?= $entry_quantity; ?></td>';
          html += '        <td class="text-left"><?= $entry_subtract; ?></td>';
          html += '        <td class="text-right"><?= $entry_price; ?></td>';
          html += '        <td class="text-right"><?= $entry_option_points; ?></td>';
          html += '        <td class="text-right"><?= $entry_weight; ?></td>';
          html += '        <td></td>';
          html += '      </tr>';
          html += '  	 </thead>';
          html += '  	 <tbody>';
          html += '    </tbody>';
          html += '    <tfoot>';
          html += '      <tr>';
          html += '        <td colspan="6"></td>';
          html += '        <td class="text-left"><button type="button" onclick="addOptionValue(' + option_row + ');" data-toggle="tooltip" title="<?= $button_option_value_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>';
          html += '      </tr>';
          html += '    </tfoot>';
          html += '  </table>';
          html += '</div>';

          html += '  <select id="option-values' + option_row + '" style="display: none;">';

          for (i = 0; i < item['option_value'].length; i++) {
            html += '  <option value="' + item['option_value'][i]['option_value_id'] + '">' + item['option_value'][i]['name'] + '</option>';
          }

          html += '  </select>';
          html += '</div>';
        }

        $('#tab-option .tab-content').append(html);

        $('#option > li:last-child').before('<li><a href="#tab-option' + option_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick=" $(\'#option a:first\').tab(\'show\');$(\'a[href=\\\'#tab-option' + option_row + '\\\']\').parent().remove(); $(\'#tab-option' + option_row + '\').remove();"></i>' + item['label'] + '</li>');

        $('#option a[href=\'#tab-option' + option_row + '\']').tab('show');

        $('[data-toggle=\'tooltip\']').tooltip({
          container: 'body',
          html: true
        });

        $('.date').datetimepicker({
          pickTime: false
        });

        $('.time').datetimepicker({
          pickDate: false
        });

        $('.datetime').datetimepicker({
          pickDate: true,
          pickTime: true
        });

        option_row++;
      }
    });
    //
    -->
  </script>
  <script type="text/javascript">
    <!--
    var option_value_row = <?= $option_value_row; ?>;

    function addOptionValue(option_row) {
      html = '<tr id="option-value-row' + option_value_row + '">';
      html += '  <td class="text-left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][option_value_id]" class="form-control">';
      html += $('#option-values' + option_row).html();
      html += '  </select><input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_value_id]" value="" /></td>';
      html += '  <td class="text-right"><input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][quantity]" value="" placeholder="<?= $entry_quantity; ?>" class="form-control" /></td>';
      html += '  <td class="text-left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][subtract]" class="form-control">';
      html += '    <option value="1"><?= $text_yes; ?></option>';
      html += '    <option value="0"><?= $text_no; ?></option>';
      html += '  </select></td>';
      html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price_prefix]" class="form-control">';
      html += '    <option value="+">+</option>';
      html += '    <option value="-">-</option>';
      html += '  </select>';
      html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price]" value="" placeholder="<?= $entry_price; ?>" class="form-control" /></td>';
      html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points_prefix]" class="form-control">';
      html += '    <option value="+">+</option>';
      html += '    <option value="-">-</option>';
      html += '  </select>';
      html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points]" value="" placeholder="<?= $entry_points; ?>" class="form-control" /></td>';
      html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight_prefix]" class="form-control">';
      html += '    <option value="+">+</option>';
      html += '    <option value="-">-</option>';
      html += '  </select>';
      html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight]" value="" placeholder="<?= $entry_weight; ?>" class="form-control" /></td>';
      html += '  <td class="text-left"><button type="button" onclick="$(this).tooltip(\'destroy\');$(\'#option-value-row' + option_value_row + '\').remove();" data-toggle="tooltip" rel="tooltip" title="<?= $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
      html += '</tr>';

      $('#option-value' + option_row + ' tbody').append(html);
      $('[rel=tooltip]').tooltip();

      option_value_row++;
    }
    //
    -->
  </script>
  <script type="text/javascript">
    <!--
    var discount_row = <?= $discount_row; ?>;

    function addDiscount() {
      html = '<tr id="discount-row' + discount_row + '">';
      html += '  <td class="text-left"><select name="product_discount[' + discount_row + '][customer_group_id]" class="form-control">';
      <? foreach ($customer_groups as $customer_group) { ?>
        html += '    <option value="<?= $customer_group['customer_group_id']; ?>"><?= addslashes($customer_group['name']); ?></option>';
      <? } ?>
      html += '  </select></td>';
      html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][quantity]" value="" placeholder="<?= $entry_quantity; ?>" class="form-control" /></td>';
      html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][priority]" value="" placeholder="<?= $entry_priority; ?>" class="form-control" /></td>';
      html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][price]" value="" placeholder="<?= $entry_price; ?>" class="form-control" /></td>';
      html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_start]" value="" placeholder="<?= $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
      html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_end]" value="" placeholder="<?= $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
      html += '  <td class="text-left"><button type="button" onclick="$(\'#discount-row' + discount_row + '\').remove();" data-toggle="tooltip" title="<?= $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
      html += '</tr>';

      $('#discount tbody').append(html);

      $('.date').datetimepicker({
        pickTime: false
      });

      discount_row++;
    }
    //
    -->
  </script>
  <script type="text/javascript">
    <!--
    var special_row = <?= $special_row; ?>;

    function addSpecial() {
      html = '<tr id="special-row' + special_row + '">';
      html += '  <td class="text-left"><select name="product_special[' + special_row + '][customer_group_id]" class="form-control">';
      <? foreach ($customer_groups as $customer_group) { ?>
        html += '      <option value="<?= $customer_group['customer_group_id']; ?>"><?= addslashes($customer_group['name']); ?></option>';
      <? } ?>
      html += '  </select></td>';
      html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][priority]" value="" placeholder="<?= $entry_priority; ?>" class="form-control" /></td>';
      html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][price]" value="" placeholder="<?= $entry_price; ?>" class="form-control" /></td>';
      html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_start]" value="" placeholder="<?= $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
      html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_end]" value="" placeholder="<?= $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
      html += '  <td class="text-left"><button type="button" onclick="$(\'#special-row' + special_row + '\').remove();" data-toggle="tooltip" title="<?= $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
      html += '</tr>';

      $('#special tbody').append(html);

      $('.date').datetimepicker({
        pickTime: false
      });

      special_row++;
    }
    //
    -->
  </script>
  <script type="text/javascript">
    <!--
    var image_row = <?= $image_row; ?>;

    function addImage() {
      html = '<tr id="image-row' + image_row + '">';
      html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?= $placeholder; ?>" alt="" title="" data-placeholder="<?= $placeholder; ?>" /></a><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
      html += '  <td class="text-right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" placeholder="<?= $entry_sort_order; ?>" class="form-control" /></td>';
      html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row + '\').remove();" data-toggle="tooltip" title="<?= $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
      html += '</tr>';

      $('#images tbody').append(html);

      image_row++;
    }
    //
    -->
  </script>
  <script type="text/javascript">
    <!--
    var recurring_row = <?= $recurring_row; ?>;

    function addRecurring() {
      html = '<tr id="recurring-row' + recurring_row + '">';
      html += '  <td class="left">';
      html += '    <select name="product_recurring[' + recurring_row + '][recurring_id]" class="form-control">>';
      <? foreach ($recurrings as $recurring) { ?>
        html += '      <option value="<?= $recurring['recurring_id']; ?>"><?= $recurring['name']; ?></option>';
      <? } ?>
      html += '    </select>';
      html += '  </td>';
      html += '  <td class="left">';
      html += '    <select name="product_recurring[' + recurring_row + '][customer_group_id]" class="form-control">>';
      <? foreach ($customer_groups as $customer_group) { ?>
        html += '      <option value="<?= $customer_group['customer_group_id']; ?>"><?= $customer_group['name']; ?></option>';
      <? } ?>
      html += '    <select>';
      html += '  </td>';
      html += '  <td class="left">';
      html += '    <a onclick="$(\'#recurring-row' + recurring_row + '\').remove()" data-toggle="tooltip" title="<?= $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></a>';
      html += '  </td>';
      html += '</tr>';

      $('#tab-recurring table tbody').append(html);

      recurring_row++;
    }
    //
    -->
  </script>
  <script type="text/javascript">
    <!--
    $('.date').datetimepicker({
      pickTime: false
    });

    $('.time').datetimepicker({
      pickDate: false
    });

    $('.datetime').datetimepicker({
      pickDate: true,
      pickTime: true
    });
    //
    -->
  </script>
  <script type="text/javascript">
    <!--
    $('#language a:first').tab('show');
    $('#option a:first').tab('show');
    //
    -->
  </script>
  <script type="text/javascript">
    <!--
    <? foreach ($product_tabs as $key => $tab) {  ?>
      <? foreach ($languages as $language) { ?>
        // $('#input-description<?= $key; ?>-language<?= $language['language_id']; ?>').summernote({
        //   height: 300
        // });
      <? } ?>
    <? } ?>
    //
    -->
  </script>
  <script type="text/javascript">
    <!--
    var tab_row = <?= $tab_row; ?>;

    function addproducttab() {
      html = '<div class="tab-pane" id="tab-extra' + tab_row + '">';
      html += '  <ul class="nav nav-tabs" id="language' + tab_row + '">';
      <? foreach ($languages as $language) { ?>
        html += '    <li><a href="#tab-extra-' + tab_row + '-language<?= $language['language_id']; ?>" data-toggle="tab"><img src="language/<?= $language['code']; ?>/<?= $language['code']; ?>.png" title="<?= $language['name']; ?>" /> <?= $language['name']; ?></a></li>';
      <? } ?>
      html += '  </ul>';

      html += '  <div class="tab-content">';

      <? foreach ($languages as $language) { ?>
        html += '    <div class="tab-pane" id="tab-extra-' + tab_row + '-language<?= $language['language_id']; ?>">';
        html += '      <div class="form-group">';
        html += '        <label class="col-sm-2 control-label" for="input-heading' + tab_row + '-language<?= $language['language_id']; ?>"><?= $entry_heading; ?></label>';
        html += '        <div class="col-sm-10"><input type="text" name="product_tab[' + tab_row + '][description][<?= $language['language_id']; ?>][heading]" placeholder="<?= $entry_heading; ?>" id="input-heading' + tab_row + '-language<?= $language['language_id']; ?>" value="" class="form-control"/></div>';
        html += '      </div>';
        html += '      <div class="form-group">';
        html += '        <label class="col-sm-2 control-label" for="input-description' + tab_row + '-language<?= $language['language_id']; ?>"><?= $entry_description; ?></label>';
        html += '        <div class="col-sm-10"><textarea name="product_tab[' + tab_row + '][description][<?= $language['language_id']; ?>][description]" id="input-description' + tab_row + '-language<?= $language['language_id']; ?>"></textarea></div>';
        html += '      </div>';
        html += '      <div class="form-group">';
        html += '        <label class="col-sm-2 control-label" for="input-subtitle' + tab_row + '-language<?= $language['language_id']; ?>">Пояснение</label>';
        html += '        <div class="col-sm-10"><input type="text" name="product_tab[' + tab_row + '][description][<?= $language['language_id']; ?>][subtitle]" placeholder="Пояснение" id="input-subtitle' + tab_row + '-language<?= $language['language_id']; ?>" value="" class="form-control"/></div>';
        html += '      </div>';
        html += '     <div class="form-group">';
        html += '       <label class="col-sm-2 control-label" for="input-image' + tab_row + '-language<?= $language['language_id']; ?>">Картинка</label>';
        html += '       <div class="col-sm-10">';
        html += '         <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail">';
        html += '           <img src="" alt="" title="" data-placeholder="<?= $placeholder; ?>" />';
        html += '         </a>';
        html += '         <input type="hidden" name="product_tab[' + tab_row + '][description][<?= $language['language_id']; ?>][image]" value="" id="input-image' + tab_row + '-language<?= $language['language_id']; ?>" />';
        html += '       </div>';
        html += '     </div>';
        html += '    </div>';
      <? } ?>

      html += '  </div>';
      html += ' <div class="form-group">';
      html += '<label class="col-sm-2 control-label" for="input-status<?= $tab_row; ?>"><?= $entry_status; ?></label>';
      html += '<div class="col-sm-10">';
      html += '<select name="product_tab[' + tab_row + '][status]" id="input-status<?= $tab_row; ?>" class="form-control">';
      html += '<option value="1" selected="selected"><?= $text_enabled; ?></option>';
      html += '<option value="0"><?= $text_disabled; ?></option>';
      html += ' </select>';
      html += ' </div>';
      html += ' </div>';
      html += ' <div class="form-group">';
      html += ' <label class="col-sm-2 control-label" for="input-sort-order"><?= $entry_sort_order; ?></label>';
      html += '<div class="col-sm-10">';
      html += '<input type="text" name="product_tab[' + tab_row + '][sort_order]" value="" placeholder="<?= $entry_sort_order; ?>" id="input-sort-order" class="form-control" />';
      html += '</div>';
      html += '</div>';
      html += ' <div class="form-group">';
      html += ' <label class="col-sm-2 control-label" for="input-color">Цвет фона</label>';
      html += '<div class="col-sm-10">';
      html += '<input style="height: 50px !important; width: 60px;" type="color" name="product_tab[' + tab_row + '][color]" value="#ffffff" id="input-color" class="form-control" />';
      html += '</div>';
      html += '</div>';
      html += '</div>';

      $('#tab-extra .tab-content:first-child').prepend(html);

      <? foreach ($languages as $language) { ?>
        // $('#input-description' + tab_row + '-language<?= $language['language_id']; ?>').summernote({
        //   height: 300
        // });
      <? } ?>

      $('#extratab-add').before('<li><a href="#tab-extra' + tab_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-extra' + tab_row + '\\\']\').parent().remove(); $(\'#tab-extra' + tab_row + '\').remove(); $(\'#tab-extra a:first\').tab(\'show\');"></i> <?= $tab_module; ?> ' + tab_row + '</a></li>');

      $('#tab-extra a[href=\'#tab-extra' + tab_row + '\']').tab('show');

      $('#tab-extra #language' + tab_row + ' li:first-child a').tab('show');

      tab_row++;
    }
    //
    -->
  </script>
  <script type="text/javascript">
    <!--
    $('#tab-extra li:first-child a').tab('show');
    <? foreach ($product_tabs as $key => $tab) {  ?>
      $('#tab-extra #language<?= $key; ?> li:first-child a').tab('show');
    <? } ?>
    //
    -->
  </script>
</div>
<?= $footer; ?>