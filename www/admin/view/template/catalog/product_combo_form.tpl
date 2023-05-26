<?= $header; ?><?= $column_left; ?>
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="submit" form="form-product_combo" data-toggle="tooltip"
                            title="<?= $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i>
                    </button>
                    <a href="<?= $cancel; ?>" data-toggle="tooltip" title="<?= $button_cancel; ?>"
                       class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
                    <form action="<?= $action; ?>" method="post" enctype="multipart/form-data"
                          id="form-product_combo" class="form-horizontal">

                        <div class="form-group required">
                            <label class="col-sm-2 control-label"
                                   for="input-product"><?= $entry_product; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="product1" value="<?= $product1; ?>"
                                       placeholder="<?= $entry_product; ?>" id="input-product"
                                       class="form-control"/>
                                <input type="hidden" name="product_id1" value="<?= $product_id1; ?>"/>
                                <? if ($error_product1) { ?>
                                    <div class="text-danger"><?= $error_product1; ?></div>
                                <? } ?>
                            </div>
                        </div>

                        <div class="form-group required">
                            <label class="col-sm-2 control-label"
                                   for="input-product2"><?= $entry_product2; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="product2" value="<?= $product2; ?>"
                                       placeholder="<?= $entry_product2; ?>" id="input-product2"
                                       class="form-control"/>
                                <input type="hidden" name="product_id2" value="<?= $product_id2; ?>"/>
                                <? if ($error_product2) { ?>
                                    <div class="text-danger"><?= $error_product2; ?></div>
                                <? } ?>
                            </div>
                        </div>

                        <div class="form-group required">
                            <label class="col-sm-2 control-label"
                                   for="input-discount"><?= $entry_discount; ?></label>
                            <div class="col-sm-10">
                                <input type="number" name="discount" value="<?= $discount; ?>"
                                       placeholder="<?= $entry_discount; ?>" id="input-discount"
                                       class="form-control"/>
                                <? if ($error_discount) { ?>
                                    <div class="text-danger"><?= $error_discount; ?></div>
                                <? } ?>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="input-status"><?= $entry_status; ?></label>
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
                    </form>
                </div>
            </div>
        </div>


        <script type="text/javascript"><!--

            $('input[name=\'product1\']').autocomplete({
                'source': function (request, response) {
                    $.ajax({
                        url: 'index.php?route=catalog/product/autocomplete&token=<?= $token; ?>&filter_name=' + encodeURIComponent(request),
                        dataType: 'json',
                        success: function (json) {
                            response($.map(json, function (item) {
                                return {
                                    label: item['name'],
                                    value: item['product_id']
                                }
                            }));
                        }
                    });
                },
                'select': function (item) {
                    $('input[name=\'product1\']').val(item['label']);
                    $('input[name=\'product_id1\']').val(item['value']);
                }
            });


            $('input[name=\'product2\']').autocomplete({
                'source': function (request, response) {
                    $.ajax({
                        url: 'index.php?route=catalog/product/autocomplete&token=<?= $token; ?>&filter_name=' + encodeURIComponent(request),
                        dataType: 'json',
                        success: function (json) {
                            response($.map(json, function (item) {
                                return {
                                    label: item['name'],
                                    value: item['product_id']
                                }
                            }));
                        }
                    });
                },
                'select': function (item) {
                    $('input[name=\'product2\']').val(item['label']);
                    $('input[name=\'product_id2\']').val(item['value']);
                }
            });
            //--></script>
    </div>
<?= $footer; ?>