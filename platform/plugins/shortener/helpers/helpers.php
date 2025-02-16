<?php

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Botble\Base\Supports\SortItemsWithChildrenHelper;
use Botble\Shortener\Repositories\Interfaces\ShortenerInterface;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;


if (!function_exists('get_single_shorted_field')) {
  function get_single_shorted_field(int $id): Collection|LengthAwarePaginator
  {
    return app(ShortenerInterface::class)->getSingleShortedField($id);
  }
}

if (!function_exists('redirects')) {
  /**
   * Redirect Types
   * @return void
   */
  function redirects()
  {

    // $user = \Models\User::where('id', \Core\Auth::user()->rID())->first();
    $redirects = [];

    // if(config('frame') == 3 || $user->pro()){

    //     $redirects[e('Redirection')] = [
    //        "direct" => e("Direct"),
    //        "frame" => e("Frame"),
    //        "splash" => e("Splash")
    //     ];

    // } else {
    $methods = array("0" => "direct", "1" => "frame", "2" => "splash");

    // $redirects['Redirection'] = [
    //     $methods['frame'] => ucfirst($methods[config('frame')])
    // ];
    // }

    // if($user->has('overlay') !== false){

    //     foreach(DB::overlay()->where('userid', $user->id)->find() as $overlay){
    //         $redirects[e('CTA Overlay')]['overlay-'.$overlay->id] = $overlay->name;
    //     }

    // }
    // if($user->has('splash') !== false){
    //     foreach(DB::splash()->where('userid', $user->id)->find() as $overlay){
    //         $redirects[e('Custom Splash')][$overlay->id] = $overlay->name;
    //     }

    // }
    return $methods;
  }
}

if (!function_exists('shortRoute')) {

  /**
   * Generate Short Link
   * @param [type] $domain
   * @param [type] $alias
   * @return void
   */
  function shortRoute($domain, $alias)
  {

    if (!$domain || empty($domain)) $domain = config('url');

    // if(strpos($domain, '*.') !== false) return str_replace('*', $alias, $domain);

    return trim($domain) . '/' . trim($alias);
  }
}

if (!function_exists('timeago')) {

  /**
   * Convert a timestamp into timeago format
   * @param time
   * @return string
   */
  function timeago($time)
  {
    if (!$time) return '';

    $time = strtotime($time);
    $periods = ["second", "minute", "hour", "day", "week", "month", "year", "decade"];
    $lengths = ["60", "60", "24", "7", "4.35", "12", "10"];
    $now = time();
    $difference = $now - $time;
    for ($j = 0; $difference >= $lengths[$j] && $j < count($lengths) - 1; $j++) {
      $difference /= $lengths[$j];
    }
    $difference = round($difference);
    if ($difference > 1) $periods[$j] = $periods[$j] . 's';
    // return e("{d} {p} ago", null, ["d" => $difference, "p" => $periods[$j]]);
    return $difference . " " . $periods[$j] . " ago"; //"{d} {p} ago", null, ["d" => $difference, "p" => $periods[$j]];

  }
}

if (!function_exists('isEmpty')) {

  function isEmpty($variable, $default)
  {
    return empty($variable) ? $default : $variable;
  }
}

if (!function_exists('truncate')) {

  /**
   * Truncate a string
   * @param string, delimiter, append string
   * @return string truncated message
   * @since 1.0
   */
  function truncate($string, $delimiter, $end = "...")
  {

    if (is_null($string)) return $string;

    $length = strlen($string);

    if ($length > $delimiter) {
      $newstring = substr($string, 0, strrpos($string, ' ', $delimiter - $length)) . $end;

      if (strlen($newstring) < 5) {
        return substr($string, 0, $delimiter) . $end;
      } else {
        return $newstring;
      }
    }

    return $string;
  }
}

if (!function_exists('clean')) {

  /**
   * Clean a string
   * @param    $string
   * @param   $level cleaning level (1=lowest, 2, 3=highest)
   * @param   boolean $chars
   * @param   string  $leave
   * @return     mixed
   */
  function clean($string, $level = '1', $chars = FALSE, $leave = "")
  {

    if (!is_string($string)) return $string;

    $string = preg_replace('/<script[^>]*>([\s\S]*?)<\/script[^>]*>/i', '', $string);

    switch ($level) {
      case '3':
        if (empty($leave)) {
          $search = array(
            '@<script[^>]*?>.*?</script>@si',
            '@<[\/\!]*?[^<>]*?>@si',
            '@<style[^>]*?>.*?</style>@siU',
            '@<![\s\S]*?--[ \t\n\r]*>@',
          );
          $string = preg_replace($search, '', $string);
        }
        $evil_tags = ['@document.cookie@siU', '@onAbort@siU', '@onActivate@siU', '@onAttribute@siU', '@onAfterPrint@siU', '@onAfterScriptExecute@siU', '@onAfterUpdate@siU', '@onAnimationCancel@siU', '@onAnimationEnd@siU', '@onAnimationIteration@siU', '@onAnimationStart@siU', '@onAriaRequest@siU', '@onAutoComplete@siU', '@onAutoCompleteError@siU', '@onAuxClick@siU', '@onBeforeActivate@siU', '@onBeforeCopy@siU', '@onBeforeCut@siU', '@onBeforeInput@siU', '@onBeforePrint@siU', '@onBeforeDeactivate@siU', '@onBeforeEditFocus@siU', '@onBeforePaste@siU', '@onBeforePrint@siU', '@onBeforeScriptExecute@siU', '@onBeforeToggle@siU', '@onBeforeUnload@siU', '@onBeforeUpdate@siU', '@onBegin@siU', '@onBlur@siU', '@onBounce@siU', '@onCancel@siU', '@onCanPlay@siU', '@onCanPlayThrough@siU', '@onCellChange@siU', '@onChange@siU', '@onClick@siU', '@onClose@siU', '@onCommand@siU', '@onCompassNeedsCalibration@siU', '@onContextMenu@siU', '@onControlSelect@siU', '@onCopy@siU', '@onCueChange@siU', '@onCut@siU', '@onDataAvailable@siU', '@onDataSetChanged@siU', '@onDataSetComplete@siU', '@onDblClick@siU', '@onDeactivate@siU', '@onDeviceLight@siU', '@onDeviceMotion@siU', '@onDeviceOrientation@siU', '@onDeviceProximity@siU', '@onDrag@siU', '@onDragDrop@siU', '@onDragEnd@siU', '@onDragExit@siU', '@onDragEnter@siU', '@onDragLeave@siU', '@onDragOver@siU', '@onDragStart@siU', '@onDrop@siU', '@onDurationChange@siU', '@onEmptied@siU', '@onEnd@siU', '@onEnded@siU', '@onError@siU', '@onErrorUpdate@siU', '@onExit@siU', '@onFilterChange@siU', '@onFinish@siU', '@onFocus@siU', '@onFocusIn@siU', '@onFocusOut@siU', '@onFormChange@siU', '@onFormInput@siU', '@onFullScreenChange@siU', '@onFullScreenError@siU', '@onGotPointerCapture@siU', '@onHashChange@siU', '@onHelp@siU', '@onInput@siU', '@onInvalid@siU', '@onKeyDown@siU', '@onKeyPress@siU', '@onKeyUp@siU', '@onLanguageChange@siU', '@onLayoutComplete@siU', '@onLoad@siU', '@onLoadEnd@siU', '@onLoadedData@siU', '@onLoadedMetaData@siU', '@onLoadStart@siU', '@onLoseCapture@siU', '@onLostPointerCapture@siU', '@onMediaComplete@siU', '@onMediaError@siU', '@onMessage@siU', '@onMouseDown@siU', '@onMouseEnter@siU', '@onMouseLeave@siU', '@onMouseMove@siU', '@onMouseOut@siU', '@onMouseOver@siU', '@onMouseUp@siU', '@onMouseWheel@siU', '@onMove@siU', '@onMoveEnd@siU', '@onMoveStart@siU', '@onMozFullScreenChange@siU', '@onMozFullScreenError@siU', '@onMozPointerLockChange@siU', '@onMozPointerLockError@siU', '@onMsContentZoom@siU', '@onMsFullScreenChange@siU', '@onMsFullScreenError@siU', '@onMsGestureChange@siU', '@onMsGestureDoubleTap@siU', '@onMsGestureEnd@siU', '@onMsGestureHold@siU', '@onMsGestureStart@siU', '@onMsGestureTap@siU', '@onMsGotPointerCapture@siU', '@onMsInertiaStart@siU', '@onMsLostPointerCapture@siU', '@onMsManipulationStateChanged@siU', '@onMsPointerCancel@siU', '@onMsPointerDown@siU', '@onMsPointerEnter@siU', '@onMsPointerLeave@siU', '@onMsPointerMove@siU', '@onMsPointerOut@siU', '@onMsPointerOver@siU', '@onMsPointerUp@siU', '@onMsSiteModeJumpListItemRemoved@siU', '@onMsThumbnailClick@siU', '@onOffline@siU', '@onOnline@siU', '@onOutOfSync@siU', '@onPage@siU', '@onPageHide@siU', '@onPageShow@siU', '@onPaste@siU', '@onPause@siU', '@onPlay@siU', '@onPlaying@siU', '@onPointerCancel@siU', '@onPointerDown@siU', '@onPointerEnter@siU', '@onPointerLeave@siU', '@onPointerLockChange@siU', '@onPointerLockError@siU', '@onPointerMove@siU', '@onPointerOut@siU', '@onPointerOver@siU', '@onPointerRawUpdate@siU', '@onPointerUp@siU', '@onPopState@siU', '@onProgress@siU', '@onPropertyChange@siU', '@onqt_error@siU', '@onRateChange@siU', '@onReadyStateChange@siU', '@onReceived@siU', '@onRepeat@siU', '@onReset@siU', '@onResize@siU', '@onResizeEnd@siU', '@onResizeStart@siU', '@onResume@siU', '@onReverse@siU', '@onRowDelete@siU', '@onRowEnter@siU', '@onRowExit@siU', '@onRowInserted@siU', '@onRowsDelete@siU', '@onRowsEnter@siU', '@onRowsExit@siU', '@onRowsInserted@siU', '@onScroll@siU', '@onSearch@siU', '@onSeek@siU', '@onSeeked@siU', '@onSeeking@siU', '@onSelect@siU', '@onSelectionChange@siU', '@onSelectStart@siU', '@onStalled@siU', '@onStorage@siU', '@onStorageCommit@siU', '@onStart@siU', '@onStop@siU', '@onShow@siU', '@onSyncRestored@siU', '@onSubmit@siU', '@onSuspend@siU', '@onSynchRestored@siU', '@onTimeError@siU', '@onTimeUpdate@siU', '@onTimer@siU', '@onTrackChange@siU', '@onTransitionEnd@siU', '@onTransitionRun@siU', '@onTransitionStart@siU', '@onToggle@siU', '@onTouchCancel@siU', '@onTouchEnd@siU', '@onTouchLeave@siU', '@onTouchMove@siU', '@onTouchStart@siU', '@onTransitionCancel@siU', '@onTransitionEnd@siU', '@onUnload@siU', '@onUnhandledRejection@siU', '@onURLFlip@siU', '@onUserProximity@siU', '@onVolumeChange@siU', '@onWaiting@siU', '@onWebKitAnimationEnd@siU', '@onWebKitAnimationIteration@siU', '@onWebKitAnimationStart@siU', '@onWebKitFullScreenChange@siU', '@onWebKitFullScreenError@siU', '@onWebKitTransitionEnd@siU', '@onWheel@siU'];
        $string = preg_replace($evil_tags, '', $string);
        $string = strip_tags($string, $leave);
        if ($chars) {
          $string = htmlspecialchars($string, ENT_QUOTES);
        }
        break;
      case '2':
        $string = strip_tags($string, '<b><i><s><p><u><strong><span>');
        break;
      case '1':
        $string = strip_tags($string, '<b><i><s><u><strong><a><pre><code><p><div><span><br>');
        break;
    }
    if (!preg_match('!nofollow!', $string)) $string = str_replace('href=', 'rel="nofollow" href=', $string);
    return $string;
  }
}

if (!function_exists('nonce')) {

  /**
   * Create a unique Nonce Token
   * @param string $action
   * @param string $key
   * @return void
   */
  function nonce($action = '', $duration = 60)
  {
    $i = ceil(time() / ($duration * 60 / 2));
    $nonce = md5($i . $action . $action);
    return substr($nonce, -12, 10);
  }
}

if (!function_exists('shortRoute')) {

  /**
   * Generate Short Link
   * @param [type] $domain
   * @param [type] $alias
   * @return void
   */
  function shortRoute($domain, $alias)
  {

    // if(!$domain || empty($domain)) $domain = config('url');

    // if(strpos($domain, '*.') !== false) return str_replace('*', $alias, $domain);

    return trim($domain) . '/' . trim($alias);
  }
}

if (!function_exists('getDomains')) {
  function getDomains()
  {
    $localDomains = [
      'http://127.0.0.1:8000/shorty',
      // 'example.org',
      // 'example.net',
      // Add more local domains as needed
    ];

    $productionDomains = [
      'www.thejat.in/shorty',
      // 'example-production.org',
      // 'example-production.net',
      // Add more production domains as needed
    ];

    // Choose domains based on the environment
    $domains = app()->environment('dev') ? $localDomains : $productionDomains;

    return $domains;
  }
}
