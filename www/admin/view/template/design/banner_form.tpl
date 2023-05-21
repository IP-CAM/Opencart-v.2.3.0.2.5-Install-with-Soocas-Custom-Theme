<?= $header; ?><?= $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-banner" data-toggle="tooltip" title="<?= $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?= $action; ?>" method="post" enctype="multipart/form-data" id="form-banner" class="form-horizontal">
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name"><?= $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?= $name; ?>" placeholder="<?= $entry_name; ?>" id="input-name" class="form-control" />
              <? if ($error_name) { ?>
                <div class="text-danger">
                  <?= $error_name; ?>
                </div>
              <? } ?>
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
          <br />
          <ul class="nav nav-tabs" id="language">
            <? foreach ($languages as $language) { ?>
              <li><a href="#language<?= $language['language_id']; ?>" data-toggle="tab"><img src="language/<?= $language['code']; ?>/<?= $language['code']; ?>.png" title="<?= $language['name']; ?>" /> <?= $language['name']; ?></a></li>
            <? } ?>
          </ul>
          <div class="tab-content">
            <? $image_row = 0; ?>
            <? foreach ($languages as $language) { ?>
              <div class="tab-pane" id="language<?= $language['language_id']; ?>">
                <table id="images<?= $language['language_id']; ?>" class="table table-striped table-bordered table-hover">
                  <tbody>
                    <? if (isset($banner_images[$language['language_id']])) { ?>
                      <? foreach ($banner_images[$language['language_id']] as $banner_image) { ?>


                        <tr id="image-row<?= $image_row; ?>">
                          <td colspan="2" class="text-left">Название баннера</td>
                          <td colspan="2" class="text-left">Порядок сортировки</td>
                          <td></td>
                        </tr>

                        <tr id="image-row<?= $image_row; ?>">
                          <!-- Заголовок -->
                          <td colspan="2" class="text-left">
                            <input type="text" name="banner_image[<?= $language['language_id']; ?>][<?= $image_row; ?>][title]" value="<?= $banner_image['title']; ?>" placeholder="Название баннера" class="form-control" />
                            <? if (isset($error_banner_image[$language['language_id']][$image_row])) { ?>
                              <div class="text-danger">
                                <?= $error_banner_image[$language['language_id']][$image_row]; ?>
                              </div>
                            <? } ?>
                          </td>
                          <!-- Сортировка -->
                          <td colspan="2" class="text-left" style="width: 40%;"><input type="text" name="banner_image[<?= $language['language_id']; ?>][<?= $image_row; ?>][sort_order]" value="<?= $banner_image['sort_order']; ?>" placeholder="<?= $entry_sort_order; ?>" class="form-control" /></td>
                          <!-- Удаление -->
                          <td rowspan="5" class="text-left"><button type="button" onclick="$('#image-row<?= $image_row; ?>, .tooltip').remove();" data-toggle="tooltip" title="<?= $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                        </tr>


                        <tr id="image-row<?= $image_row; ?>">
                          <td colspan="2" class="text-left">Картинка</td>
                          <td colspan="2" class="text-left">Картинка мобильные</td>
                        </tr>

                        <tr id="image-row<?= $image_row; ?>">
                          <!-- Картинка -->
                          <td colspan="2" class="text-left">
                            <a href="" id="thumb-image-<?= $image_row; ?>" data-toggle="image" class="img-thumbnail">
                              <img src="<?= $banner_image['thumb']; ?>" alt="" title="" data-placeholder="<?= $placeholder; ?>" />
                            </a>
                            <input type="hidden" name="banner_image[<?= $language['language_id']; ?>][<?= $image_row; ?>][image]" value="<?= $banner_image['image']; ?>" id="input-image<?= $image_row; ?>" />
                            <? if (!$banner_image['image']) { ?>
                              <div class="text-danger">
                                Картинка обязательна
                              </div>
                            <? } ?>
                          </td>
                          <!-- Картинка мобильные -->
                          <td colspan="2" class="text-left"><a href="" id="thumb-image-mobile-<?= $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?= $banner_image['thumb_mobile']; ?>" alt="" title="" data-placeholder="<?= $placeholder; ?>" /></a><input type="hidden" name="banner_image[<?= $language['language_id']; ?>][<?= $image_row; ?>][image_mobile]" value="<?= $banner_image['image_mobile']; ?>" id="input-image_mobile<?= $image_row; ?>" />
                            <? if (!$banner_image['image_mobile']) { ?>
                              <div class="text-danger">
                                Картинка обязательна
                              </div>
                            <? } ?>
                          </td>
                        </tr>




                        <tr id="image-row<?= $image_row; ?>">
                          <td colspan="4" class="text-left">Контент баннера</td>
                        </tr>

                        <tr id="image-row<?= $image_row; ?>">
                          <!-- Доп контент -->
                          <td colspan="4" class="text-left"><textarea class="form-control" name="banner_image[<?= $language['language_id']; ?>][<?= $image_row; ?>][textarea]" cols="30" rows="10"><?= $banner_image['textarea']; ?></textarea><? if (isset($error_banner_image[$language['language_id']][$image_row])) { ?><? } ?></td>
                        </tr>



                        <? $image_row++; ?>
                      <? } ?>
                    <? } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="4"></td>
                      <td class="text-left"><button type="button" onclick="addImage('<?= $language['language_id']; ?>');" data-toggle="tooltip" title="<?= $button_banner_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            <? } ?>
          </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript">
    <!--
    var image_row = <?= $image_row; ?>;


    function addImage(language_id) {

      html = '<tr id="image-row' + image_row + '">';
      html += '  <td colspan="2" class="text-left">Название баннера</td>';
      html += '  <td colspan="2" class="text-left">Порядок сортировки</td>';
      html += '  <td></td>';
      html += '</tr>';
      html += '<tr id="image-row' + image_row + '">';
      html += '  <td colspan="2" class="text-left"><input type="text" name="banner_image[' + language_id + '][' + image_row + '][title]" value="" placeholder="Заголовок" class="form-control" /></td>';
      html += '  <td colspan="2" class="text-left"><input type="text" name="banner_image[' + language_id + '][' + image_row + '][sort_order]" value="" placeholder="<?= $entry_sort_order; ?>" class="form-control" /></td>';
      html += '  <td rowspan="5" class="text-left"><button type="button" onclick="$(\'#image-row' + image_row + ', .tooltip\').remove();" data-toggle="tooltip" title="<?= $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
      html += '</tr>';
      html += '<tr id="image-row' + image_row + '">';
      html += '  <td colspan="2" class="text-left">Картинка</td>';
      html += '  <td colspan="2" class="text-left">Картинка мобильные</td>';
      html += '</tr>';
      html += '<tr id="image-row' + image_row + '">';
      html += '  <td colspan="2" class="text-left"><a href="" id="thumb-image-' + image_row + '" data-toggle="image" class="img-thumbnail"><img src="<?= $placeholder; ?>" alt="" title="" data-placeholder="<?= $placeholder; ?>" /></a><input type="hidden" name="banner_image[' + language_id + '][' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
      html += '  <td colspan="2" class="text-left"><a href="" id="thumb-image-mobile-' + image_row + '" data-toggle="image" class="img-thumbnail"><img src="<?= $placeholder; ?>" alt="" title="" data-placeholder="<?= $placeholder; ?>" /></a><input type="hidden" name="banner_image[' + language_id + '][' + image_row + '][image_mobile]" value="" id="input-image_mobile' + image_row + '" /></td>';
      html += '</tr>';
      html += '<tr id="image-row' + image_row + '">';
      html += '  <td colspan="4" class="text-left">Контент баннера</td>';
      html += '</tr>';
      html += '<tr id="image-row' + image_row + '">';
      html += '  <td colspan="4" class="text-left"><textarea class="form-control" name="banner_image[' + language_id + '][' + image_row + '][textarea]" cols="30" rows="10"></textarea>';
      html += '</tr>';


      $('#images' + language_id + ' tbody').append(html);

      image_row++;
    }
    //
    -->
  </script>
  <script type="text/javascript">
    <!--
    $('#language a:first').tab('show');
    //
    -->
  </script>
</div>
<?= $footer; ?>