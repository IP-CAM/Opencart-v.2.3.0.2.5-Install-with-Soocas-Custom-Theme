<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-html" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-html" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>         
          <div class="tab-pane">
            <ul class="nav nav-tabs" id="language">
              <?php foreach ($languages as $language) { ?>
              <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
              <?php } ?>
            </ul>
            <div class="tab-content">
              <?php foreach ($languages as $language) { ?>
              <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-title<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="module_description[<?php echo $language['language_id']; ?>][title]" placeholder="<?php echo $entry_title; ?>" id="input-heading<?php echo $language['language_id']; ?>" value="<?php echo isset($module_description[$language['language_id']]['title']) ? $module_description[$language['language_id']]['title'] : ''; ?>" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                  <div class="col-sm-10">
                    <textarea name="module_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($module_description[$language['language_id']]['description']) ? $module_description[$language['language_id']]['description'] : ''; ?></textarea>
                  </div>
                </div>
              </div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  
		<div class="modal fade" id="filePickerError" style="z-index: 65538;" tabindex="-1" role="dialog" aria-labelledby="filePickerErrorLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="filePickerErrorLabel">Мнеджер изображений</h4>
			  </div>
			  <div class="modal-body">
				Для работы с изображениями рекомендуем Вам обратить внимание на следующий файловый менеджер</br>
				Он заменяет стандартный менеджер изображений и имеет множество функций, которые упрощают Вашу работу с изображениями</br>
        Ознакомиться с возможностями модуля, а также посмотреть его демо и приобрести можно по ссылкам ниже: </br></br>
				<a target="_blank" href="https://opencartforum.com/files/file/3008-menedzher-izobrazheniy-opencart-2x/">Мнеджер изображений на opencartforum</a></br>
				<a target="_blank" href="https://liveopencart.ru/opencart-moduli-shablony/moduli/adminka/menedjer-izobrajeniy-opencart-2-3">Мнеджер изображений на liveopencart</a></br>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			  </div>
			</div>
		  </div>
		</div>
    <style>
    #modal-image {
      z-index:65537;
    }
    </style>
		<script src='view/javascript/tinymce/tinymce.min.js'></script>
          <script>

		  function elFinderBrowser (callback, value, meta) {
		  try {
			  var fm = $('<div/>').dialogelfinder({
				  url : 'index.php?route=elfinder/connector&token=' + getURLVar('token'),
				  lang : 'ru',
				  width : 900,
				  height: 400,
				  destroyOnClose : true,
			  getFileCallback : function(file, fm) {
					var info = file.name + ' (' + fm.formatSize(file.size) + ')';
					callback(file.url, {alt: info});
			  },
			  commandsOptions : {
				  getfile : {
					  oncomplete : 'close',
					  multiple : false,
					  folders : false
				  }
			  }
				}).dialogelfinder('instance');
		  } catch (err) {
			$('#filePickerError').modal('show');
          $.ajax({
								url: 'index.php?route=common/filemanager&token=' + getURLVar('token'),
								dataType: 'html',
								beforeSend: function() {
									$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
									$('#button-image').prop('disabled', true);
								},
								complete: function() {
									$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
									$('#button-image').prop('disabled', false);
								},
								success: function(html) {
									$('body').append('<div id="modal-image" class="modal">' + html + '</div>');
									
									$('#modal-image').modal('show');
									
									$('#modal-image').delegate('a.thumbnail', 'click', function(e) {
										e.preventDefault();
										
										//$(element).summernote('insertImage', $(this).attr('href'));
										callback($(this).attr('href'));							
										$('#modal-image').modal('hide');
									});
								}
							});
		  }
		  return false;
		}
          tinymce.init({
            selector: '.summernote',
            skin: 'bootstrap',
            language: 'ru',
            height:300,
            file_picker_callback : elFinderBrowser,
            plugins: [
              'advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker',
              'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
              'save table contextmenu directionality emoticons template paste textcolor colorpicker'
            ],
            toolbar: 'bold italic sizeselect fontselect fontsizeselect | hr alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | insertfile undo redo | forecolor backcolor emoticons | code',
            fontsize_formats: "8pt 10pt 12pt 14pt 18pt 24pt 36pt",
          });
          </script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
    
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script></div>
<?php echo $footer; ?>