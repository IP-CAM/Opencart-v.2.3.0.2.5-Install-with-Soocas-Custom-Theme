<?php
class ModelToolImage extends Model {
  public function resize($filename, $width, $height) {
    if (!is_file(DIR_IMAGE . $filename) || substr(str_replace('\\', '/', realpath(DIR_IMAGE . $filename)), 0, strlen(DIR_IMAGE)) != DIR_IMAGE) {
      return;
    }

    $extension = pathinfo($filename, PATHINFO_EXTENSION);
if (strtolower($extension) == 'svg') {
				$image_new = $filename;
			} else {

    $image_old = $filename;
    $image_new = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . (int)$width . 'x' . (int)$height . '.' . $extension;

    if (!is_file(DIR_IMAGE . $image_new) || (filectime(DIR_IMAGE . $image_old) > filectime(DIR_IMAGE . $image_new))) {
      list($width_orig, $height_orig, $image_type) = getimagesize(DIR_IMAGE . $image_old);

      if (!in_array($image_type, array(IMAGETYPE_PNG, IMAGETYPE_JPEG, IMAGETYPE_GIF))) {
        return DIR_IMAGE . $image_old;
      }

      $path = '';

      $directories = explode('/', dirname($image_new));

      foreach ($directories as $directory) {
        $path = $path . '/' . $directory;

        if (!is_dir(DIR_IMAGE . $path)) {
          @mkdir(DIR_IMAGE . $path, 0777);
        }
      }

      if ($width_orig != $width || $height_orig != $height) {
        $image = new Image(DIR_IMAGE . $image_old);
        $image->resize($width, $height);
        $image->save(DIR_IMAGE . $image_new);
      } else {
        copy(DIR_IMAGE . $image_old, DIR_IMAGE . $image_new);
      }
    }

    $image_new = str_replace(' ', '%20', $image_new);  // fix bug when attach image on email (gmail.com). it is automatic changing space " " to +

}
    if ($this->request->server['HTTPS']) {
      return $this->config->get('config_ssl') . 'image/' . $image_new;
    } else {
      return $this->config->get('config_url') . 'image/' . $image_new;
    }
  }

  public function onesize($filename, $maxsize, $type = "") {

    if (!file_exists(DIR_IMAGE . $filename) || !is_file(DIR_IMAGE . $filename)) {
      return;
    }

    $info = pathinfo($filename);
    $extension = $info['extension'];
if (strtolower($extension) == 'svg') {
				$image_new = $filename;
			} else {

    $old_image = $filename;
    $image_new = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-max-' . $maxsize . '.' . $extension;

    if (!file_exists(DIR_IMAGE . $image_new) || (filemtime(DIR_IMAGE . $old_image) > filemtime(DIR_IMAGE . $image_new))) {
      $path = '';

      $directories = explode('/', dirname(str_replace('../', '', $image_new)));

      foreach ($directories as $directory) {
        $path = $path . '/' . $directory;

        if (!file_exists(DIR_IMAGE . $path)) {
          @mkdir(DIR_IMAGE . $path, 0777);
        }
      }
      list($width_orig, $height_orig) = getimagesize(DIR_IMAGE . $old_image);

      if ($width_orig != $maxsize || $height_orig != $maxsize) {
        $image = new Image(DIR_IMAGE . $old_image);
        $image->onesize($maxsize);
        // if ($maxsize >= 500) {
        //   $image->watermark(new Image(DIR_IMAGE . 'watermark.png'), 'middlecenter');
        // }
        $image->save(DIR_IMAGE . $image_new);
      } else {
        copy(DIR_IMAGE . $old_image, DIR_IMAGE . $image_new);
      }
    };

}
    if ($this->request->server['HTTPS']) {
      return $this->config->get('config_ssl') . 'image/' . $image_new;
    } else {
      return $this->config->get('config_url') . 'image/' . $image_new;
    }
  }

  public function cropsize($filename, $width, $height, $type = "") {
    if (!file_exists(DIR_IMAGE . $filename) || !is_file(DIR_IMAGE . $filename)) {
      return;
    }

    $info = pathinfo($filename);
    $extension = $info['extension'];
if (strtolower($extension) == 'svg') {
				$image_new = $filename;
			} else {

    $old_image = $filename;
    $image_new = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-cr-' . $width . 'x' . $height . $type .'.' . $extension;

    if (!file_exists(DIR_IMAGE . $image_new) || (filemtime(DIR_IMAGE . $old_image) > filemtime(DIR_IMAGE . $image_new))) {
      $path = '';

      $directories = explode('/', dirname(str_replace('../', '', $image_new)));

      foreach ($directories as $directory) {
        $path = $path . '/' . $directory;

        if (!file_exists(DIR_IMAGE . $path)) {
          @mkdir(DIR_IMAGE . $path, 0777);
        }
      }

      list($width_orig, $height_orig) = getimagesize(DIR_IMAGE . $old_image);

      if ($width_orig != $width || $height_orig != $height) {
        $image = new Image(DIR_IMAGE . $old_image);
        $image->cropsize($width, $height, $type);
        $image->save(DIR_IMAGE . $image_new);
      } else {
        copy(DIR_IMAGE . $old_image, DIR_IMAGE . $image_new);
      }
    }

}
    if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
      return $this->config->get('config_ssl') . 'image/' . $image_new;
    } else {
      return $this->config->get('config_url') . 'image/' . $image_new;
    }
  }


}