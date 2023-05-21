<?= $header; ?><?= $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-information" data-toggle="tooltip" title="<?= $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?= $action; ?>" method="post" enctype="multipart/form-data" id="form-information" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?= $tab_general; ?></a></li>
            <li><a href="#tab-data" data-toggle="tab"><?= $tab_data; ?></a></li>
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
                      <label class="col-sm-2 control-label" for="input-title<?= $language['language_id']; ?>"><?= $entry_title; ?></label>
                      <div class="col-sm-10">
                        <input type="text" name="information_description[<?= $language['language_id']; ?>][title]" value="<?= isset($information_description[$language['language_id']]) ? $information_description[$language['language_id']]['title'] : ''; ?>" placeholder="<?= $entry_title; ?>" id="input-title<?= $language['language_id']; ?>" class="form-control" />
                        <? if (isset($error_title[$language['language_id']])) { ?>
                          <div class="text-danger"><?= $error_title[$language['language_id']]; ?></div>
                        <? } ?>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-meta-h1<?= $language['language_id']; ?>"><?= $entry_meta_h1; ?></label>
                      <div class="col-sm-10">
                        <input type="text" name="information_description[<?= $language['language_id']; ?>][meta_h1]" value="<?= isset($information_description[$language['language_id']]) ? $information_description[$language['language_id']]['meta_h1'] : ''; ?>" placeholder="<?= $entry_meta_h1; ?>" id="input-meta-title<?= $language['language_id']; ?>" class="form-control" />
                        <? if (isset($error_meta_h1[$language['language_id']])) { ?>
                          <div class="text-danger"><?= $error_meta_h1[$language['language_id']]; ?></div>
                        <? } ?>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-meta-title<?= $language['language_id']; ?>"><?= $entry_meta_title; ?></label>
                      <div class="col-sm-10">
                        <input type="text" name="information_description[<?= $language['language_id']; ?>][meta_title]" value="<?= isset($information_description[$language['language_id']]) ? $information_description[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?= $entry_meta_title; ?>" id="input-meta-title<?= $language['language_id']; ?>" class="form-control" />
                        <? if (isset($error_meta_title[$language['language_id']])) { ?>
                          <div class="text-danger"><?= $error_meta_title[$language['language_id']]; ?></div>
                        <? } ?>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-meta-description<?= $language['language_id']; ?>"><?= $entry_meta_description; ?></label>
                      <div class="col-sm-10">
                        <textarea name="information_description[<?= $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?= $entry_meta_description; ?>" id="input-meta-description<?= $language['language_id']; ?>" class="form-control"><?= isset($information_description[$language['language_id']]) ? $information_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-meta-keyword<?= $language['language_id']; ?>"><?= $entry_meta_keyword; ?></label>
                      <div class="col-sm-10">
                        <textarea name="information_description[<?= $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?= $entry_meta_keyword; ?>" id="input-meta-keyword<?= $language['language_id']; ?>" class="form-control"><?= isset($information_description[$language['language_id']]) ? $information_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                      </div>
                    </div>
                    <!-- <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-image">Картинка</label>
                      <div class="col-sm-10">
                        <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail">
                          <img src="<?= isset($thumb) ? $thumb : ''; ?>" alt="" title="" data-placeholder="<?= $placeholder; ?>" />
                        </a>
                        <input type="hidden" name="image" value="<?= isset($image) ? $image : ''; ?>" id="input-image" />
                      </div>
                    </div> -->
                    <div class="form-group required">
                      <label class="col-sm-2 control-label" for="input-description<?= $language['language_id']; ?>"><?= $entry_description; ?></label>
                      <div class="col-sm-10">
                        <textarea rows="10" name="information_description[<?= $language['language_id']; ?>][description]" placeholder="<?= $entry_description; ?>" id="input-description<?= $language['language_id']; ?>" class="form-control"><?= isset($information_description[$language['language_id']]) ? $information_description[$language['language_id']]['description'] : ''; ?></textarea>
                        <? if (isset($error_description[$language['language_id']])) { ?>
                          <div class="text-danger"><?= $error_description[$language['language_id']]; ?></div>
                        <? } ?>
                      </div>
                    </div>
                  </div>
                <? } ?>
              </div>
            </div>
            <div class="tab-pane" id="tab-data">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?= $entry_store; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <div class="checkbox">
                      <label>
                        <? if (in_array(0, $information_store)) { ?>
                          <input type="checkbox" name="information_store[]" value="0" checked="checked" />
                          <?= $text_default; ?>
                        <? } else { ?>
                          <input type="checkbox" name="information_store[]" value="0" />
                          <?= $text_default; ?>
                        <? } ?>
                      </label>
                    </div>
                    <? foreach ($stores as $store) { ?>
                      <div class="checkbox">
                        <label>
                          <? if (in_array($store['store_id'], $information_store)) { ?>
                            <input type="checkbox" name="information_store[]" value="<?= $store['store_id']; ?>" checked="checked" />
                            <?= $store['name']; ?>
                          <? } else { ?>
                            <input type="checkbox" name="information_store[]" value="<?= $store['store_id']; ?>" />
                            <?= $store['name']; ?>
                          <? } ?>
                        </label>
                      </div>
                    <? } ?>
                  </div>
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
                <label class="col-sm-2 control-label" for="input-bottom"><span data-toggle="tooltip" title="<?= $help_bottom; ?>"><?= $entry_bottom; ?></span></label>
                <div class="col-sm-10">
                  <div class="checkbox">
                    <label>
                      <? if ($bottom) { ?>
                        <input type="checkbox" name="bottom" value="1" checked="checked" id="input-bottom" />
                      <? } else { ?>
                        <input type="checkbox" name="bottom" value="1" id="input-bottom" />
                      <? } ?>
                      &nbsp; </label>
                  </div>
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
                      <td class="text-left"><select name="information_layout[0]" class="form-control">
                          <option value=""></option>
                          <? foreach ($layouts as $layout) { ?>
                            <? if (isset($information_layout[0]) && $information_layout[0] == $layout['layout_id']) { ?>
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
                        <td class="text-left"><select name="information_layout[<?= $store['store_id']; ?>]" class="form-control">
                            <option value=""></option>
                            <? foreach ($layouts as $layout) { ?>
                              <? if (isset($information_layout[$store['store_id']]) && $information_layout[$store['store_id']] == $layout['layout_id']) { ?>
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
    $('#language a:first').tab('show');
    //
    -->
  </script>
</div>
<?= $footer; ?>