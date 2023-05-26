<?= $header; ?><?= $column_left; ?>
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right"><a href="<?= $add; ?>" data-toggle="tooltip"
                                           title="<?= $button_add; ?>" class="btn btn-primary"><i
                                class="fa fa-plus"></i></a>
                    <button type="button" data-toggle="tooltip" title="<?= $button_delete; ?>"
                            class="btn btn-danger"
                            onclick="confirm('<?= $text_confirm; ?>') ? $('#form-product_combo').submit() : false;">
                        <i class="fa fa-trash-o"></i></button>
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
            <? if ($success) { ?>
                <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?= $success; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            <? } ?>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-list"></i> <?= $text_list; ?></h3>
                </div>
                <div class="panel-body">
                    <div class="well">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="control-label"
                                           for="input-product"><?= $entry_product; ?></label>
                                    <input type="text" name="filter_product" value="<?= $filter_product; ?>"
                                           placeholder="<?= $entry_product; ?>" id="input-product"
                                           class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label class="control-label"
                                           for="input-product2"><?= $entry_product2; ?></label>
                                    <input type="text" name="filter_product2" value="<?= $filter_product2; ?>"
                                           placeholder="<?= $entry_product2; ?>" id="input-product2"
                                           class="form-control"/>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="control-label" for="input-status"><?= $entry_status; ?></label>
                                    <select name="filter_status" id="input-status" class="form-control">
                                        <option value="*"></option>
                                        <? if ($filter_status) { ?>
                                            <option value="1" selected="selected"><?= $text_enabled; ?></option>
                                        <? } else { ?>
                                            <option value="1"><?= $text_enabled; ?></option>
                                        <? } ?>
                                        <? if (!$filter_status && !is_null($filter_status)) { ?>
                                            <option value="0" selected="selected"><?= $text_disabled; ?></option>
                                        <? } else { ?>
                                            <option value="0"><?= $text_disabled; ?></option>
                                        <? } ?>
                                    </select>
                                </div>
                                <button type="button" id="button-filter" class="btn btn-primary pull-right"><i
                                            class="fa fa-filter"></i> <?= $button_filter; ?></button>
                            </div>
                        </div>
                    </div>
                    <form action="<?= $delete; ?>" method="post" enctype="multipart/form-data"
                          id="form-product_combo">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <td style="width: 1px;" class="text-center"><input type="checkbox"
                                                                                       onclick="$('input[name*=\'selected\']').prop('checked', this.checked);"/>
                                    </td>
                                    <td>№</td>
                                    <td class="text-left"><? if ($sort == 'product1') { ?>
                                            <a href="<?= $sort_product1; ?>"
                                               class="<?= strtolower($order); ?>"><?= $column_product; ?></a>
                                        <? } else { ?>
                                            <a href="<?= $sort_product1; ?>"><?= $column_product; ?></a>
                                        <? } ?></td>
                                    <td class="text-left"><? if ($sort == 'product2') { ?>
                                            <a href="<?= $sort_product2; ?>"
                                               class="<?= strtolower($order); ?>"><?= $column_product2; ?></a>
                                        <? } else { ?>
                                            <a href="<?= $sort_product2; ?>"><?= $column_product2; ?></a>
                                        <? } ?></td>
                                    <td class="text-left"><?= $column_discount; ?></td>
                                    <td class="text-left"><? if ($sort == 'pc.status') { ?>
                                            <a href="<?= $sort_status; ?>"
                                               class="<?= strtolower($order); ?>"><?= $column_status; ?></a>
                                        <? } else { ?>
                                            <a href="<?= $sort_status; ?>"><?= $column_status; ?></a>
                                        <? } ?></td>
                                    <td class="text-right"><?= $column_action; ?></td>
                                </tr>
                                </thead>
                                <tbody>
                                <? if ($products_combo) { ?>

                                    <? foreach ($products_combo as $product_combo) { ?>
                                        <tr>
                                            <td class="text-center"><? if (in_array($product_combo['combo_id'], $selected)) { ?>
                                                    <input type="checkbox" name="selected[]"
                                                           value="<?= $product_combo['combo_id']; ?>"
                                                           checked="checked"/>
                                                <? } else { ?>
                                                    <input type="checkbox" name="selected[]"
                                                           value="<?= $product_combo['combo_id']; ?>"/>
                                                <? } ?></td>
                                            <td><?= $product_combo['combo_id']; ?></td>
                                            <td class="text-left"><?= $product_combo['product1']; ?></td>
                                            <td class="text-left"><?= $product_combo['product2']; ?></td>
                                            <td class="text-left"><?= $product_combo['discount']; ?></td>
                                            <td class="text-left"><?= $product_combo['status']; ?></td>
                                            <td class="text-right"><a href="<?= $product_combo['edit']; ?>"
                                                                      data-toggle="tooltip"
                                                                      title="<?= $button_edit; ?>"
                                                                      class="btn btn-primary"><i
                                                            class="fa fa-pencil"></i></a></td>
                                        </tr>
                                    <? } ?>
                                <? } else { ?>
                                    <tr>
                                        <td class="text-center" colspan="8"><?= $text_no_results; ?></td>
                                    </tr>
                                <? } ?>
                                </tbody>
                            </table>
                        </div>
                    </form>
                    <div class="row">
                        <div class="col-sm-6 text-left"><?= $pagination; ?></div>
                        <div class="col-sm-6 text-right"><?= $results; ?></div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript"><!--
            $('#button-filter').on('click', function () {
                url = 'index.php?route=catalog/product_combo&token=<?= $token; ?>';

                var filter_product = $('input[name=\'filter_product\']').val();

                if (filter_product) {
                    url += '&filter_product=' + encodeURIComponent(filter_product);
                }

                var filter_product2 = $('input[name=\'filter_product2\']').val();

                if (filter_product2) {
                    url += '&filter_product2=' + encodeURIComponent(filter_product2);
                }

                var filter_status = $('select[name=\'filter_status\']').val();

                if (filter_status != '*') {
                    url += '&filter_status=' + encodeURIComponent(filter_status);
                }

                location = url;
            });
            //--></script>
    </div>
<?= $footer; ?>
