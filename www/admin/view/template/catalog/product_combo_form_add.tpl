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
                        <div class="table-responsive ">
                            <table id="product" class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <td class="text-left required">Основной товар</td>
                                    <td></td>
                                </tr>
                                </thead>
                                <tbody>
                                <? $product_row = 0; ?>
                                <? foreach ($product as $product_item) { ?>
                                    <tr id="product-row<?= $product_row; ?>">
                                        <td class="text-left">
                                            <input type="text" name="product[<?= $product_row; ?>][product_name]"
                                                   value="<?= $product_item['name']; ?>" onfocus="autoname(this)"
                                                   class="form-control"
                                                   id="input-product-name<?= $product_row; ?>"/>
                                            <input type="hidden" name="product[<?= $product_row; ?>][product_id]"
                                                   value="<?= $product_item['product_id']; ?>">
                                        </td>
                                        <td class="text-left">
                                            <button type="button"
                                                    onclick="$('#product-row<?= $product_row; ?>').remove();"
                                                    data-toggle="tooltip" title="Удалить" class="btn btn-danger"><i
                                                        class="fa fa-minus-circle"></i></button>
                                        </td>
                                    </tr>
                                    <? $product_row++; ?>
                                <? } ?>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td></td>
                                    <td class="text-left">
                                        <button type="button" onclick="addproduct();" data-toggle="tooltip"
                                                title="Добавить" class="btn btn-primary"><i
                                                    class="fa fa-plus-circle"></i></button>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>
                            <? if ($error_product) { ?>
                                <div class="text-danger"><?= $error_product; ?></div>
                            <? } ?>
                        </div>


                        <div class="table-responsive ">
                            <table id="relateds" class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <td class="text-left required">Дополнительный товар</td>
                                    <td class="text-left">Скидка %</td>
                                    <td class="text-left">Статус</td>
                                    <td></td>
                                </tr>
                                </thead>
                                <tbody>
                                <? $related_row = 0; ?>
                                <? foreach ($relateds as $related) { ?>
                                    <tr id="related-row<?= $related_row; ?>">
                                        <td class="text-left">
                                            <input type="text"
                                                   name="relateds[<?= $related_row; ?>][product_name]"
                                                   value="<?= $related['name']; ?>" onfocus="autoname(this)"
                                                   class="form-control"
                                                   id="input-related-name<?= $related_row; ?>"/>
                                            <input type="hidden"
                                                   name="relateds[<?= $related_row; ?>][related_id]"
                                                   value="<?= $related['related_id']; ?>">
                                        </td>
                                        <td class="text-left">
                                            <input type="number" name="relateds[<?= $related_row; ?>][discount]"
                                                   value="<?= $related['discount']; ?>" class="form-control"
                                                   id="input-related-discount<?= $related_row; ?>"/>
                                        </td>
                                        <td class="text-left">
                                            <select name="relateds[<?= $related_row; ?>][status]"
                                                    id="input-related-status<?= $related_row; ?>"
                                                    class="form-control">
                                                <? if ($related['status']) { ?>
                                                    <option value="1"
                                                            selected="selected"><?= $text_enabled; ?></option>
                                                    <option value="0"><?= $text_disabled; ?></option>
                                                <? } else { ?>
                                                    <option value="1"><?= $text_enabled; ?></option>
                                                    <option value="0"
                                                            selected="selected"><?= $text_disabled; ?></option>
                                                <? } ?>
                                            </select>
                                        </td>
                                        <td class="text-left">
                                            <button type="button"
                                                    onclick="$('#related-row<?= $related_row; ?>').remove();"
                                                    data-toggle="tooltip" title="Удалить" class="btn btn-danger"><i
                                                        class="fa fa-minus-circle"></i></button>
                                        </td>
                                    </tr>
                                    <? $related_row++; ?>
                                <? } ?>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td class="text-left">
                                        <button type="button" onclick="addrelated();" data-toggle="tooltip"
                                                title="Добавить" class="btn btn-primary"><i
                                                    class="fa fa-plus-circle"></i></button>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>
                            <? if ($error_relateds) { ?>
                                <div class="text-danger"><?= $error_relateds; ?></div>
                            <? } ?>
                        </div>

                    </form>
                </div>
            </div>
        </div>


        <script type="text/javascript"><!--

            var related_row = <?= $related_row; ?>;

            function addrelated() {
                html = '<tr id="related-row' + related_row + '">';
                html += '  <td class="text-left"><input type="text" name="relateds[' + related_row + '][product_name]" onfocus="autoname(this)" value="" id="input-related-name' + related_row + '" class="form-control" /><input type="hidden" name="relateds[' + related_row + '][related_id]" value=""/></td>';
                html += '  <td class="text-left"><input type="number" name="relateds[' + related_row + '][discount]" value="" id="input-related-discount' + related_row + '" class="form-control" /></td>';

                html += '  <td class="text-left"><select name="relateds[' + related_row + '][status]" class="form-control" id="input-related-status' + related_row + '">';
                html += '<option value="1"><?= $text_enabled; ?></option><option value="0" selected="selected"><?= $text_disabled; ?></option>';
                html += '</select></td>';

                html += '  <td class="text-left"><button type="button" onclick="$(\'#related-row' + related_row + '\').remove();" data-toggle="tooltip" title="Удалить" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
                html += '</tr>';

                $('#relateds tbody').append(html);

                related_row++;
            }

            var product_row = <?= $product_row; ?>;

            function addproduct() {
                html = '<tr id="product-row' + product_row + '">';
                html += '  <td class="text-left"><input type="text" name="product[' + product_row + '][product_name]" onfocus="autoname(this)" value="" id="input-product-name' + product_row + '" class="form-control" /><input type="hidden" name="product[' + product_row + '][product_id]" value=""/></td>';

                html += '  <td class="text-left"><button type="button" onclick="$(\'#product-row' + product_row + '\').remove();" data-toggle="tooltip" title="Удалить" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
                html += '</tr>';

                $('#product tbody').append(html);

                product_row++;
            }

            //--></script>

        <script type="text/javascript"><!--
            function autoname(th) {
                $(th).autocomplete({
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
                        $(th).val(item['label']);
                        $(th).parent('td').find('input[type="hidden"]').val(item['value']);
                    }
                });
            }

            //--></script>
    </div>
<?= $footer; ?>