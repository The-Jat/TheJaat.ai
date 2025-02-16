<div id="link-<?php echo $shortedUrl->id; ?>">
    <div class="d-flex align-items-start">
        <div class="flex-grow-1">
            <div class="float-end">
                <div class="table-actions">
                    <a href="{{ route('shortener.edit', $shortedUrl->id) }}" class="btn btn-icon btn-sm btn-primary"
                        data-bs-toggle="tooltip" data-bs-original-title="{{ trans('core/base::tables.edit') }}"><i
                            class="fa fa-edit"></i></a>
                    <a href="{{ route('shortener.destroy', $shortedUrl->id) }}"
                        class="btn btn-icon btn-sm btn-danger deleteDialog"
                        data-section="{{ route('shortener.destroy', $shortedUrl->id) }}" role="button"
                        data-bs-toggle="tooltip" data-bs-original-title="{{ trans('core/base::tables.delete_entry') }}">
                        <i class="fa fa-trash"></i>
                    </a>
                </div>
                <button type="button" class="btn btn-default bg-white btn-sm" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                        stroke-linejoin="round" class="feather feather-more-horizontal">
                        <circle cx="12" cy="12" r="1"></circle>
                        <circle cx="19" cy="12" r="1"></circle>
                        <circle cx="5" cy="12" r="1"></circle>
                    </svg>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" data-trigger="shortinfo" data-shorturl="<?php echo shortRoute($shortedUrl->domain, $shortedUrl->alias . $shortedUrl->custom); ?>">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" class="feather feather-info">
                                <circle cx="12" cy="12" r="10"></circle>
                                <line x1="12" y1="16" x2="12" y2="12"></line>
                                <line x1="12" y1="8" x2="12.01" y2="8"></line>
                            </svg>
                            More Info</a></li>
                    {{-- <li><a class="dropdown-item" href="<?php echo route('stats', [$shortedUrl->id]); ?>"><i data-feather="bar-chart-2"></i> <?php ee('Statistics'); ?></a></li> --}}
                    {{-- <?php if(user()->teamPermission('links.edit')): ?>
                        <li><a class="dropdown-item" href="<?php echo route('links.edit', [$shortedUrl->id]); ?>"><i data-feather="edit"></i> <?php ee('Edit'); ?></a></li>
                        <?php if($shortedUrl->archived): ?>
                            <li><a class="dropdown-item" href="<?php echo route('links.unarchive', ['link' => $shortedUrl->id]); ?>" data-trigger="archiveselected"><i data-feather="briefcase"></i> <?php ee('Unarchive'); ?></a></li>
                        <?php else: ?>
                            <li><a class="dropdown-item" href="<?php echo route('links.archive', ['link' => $shortedUrl->id]); ?>" data-trigger="archiveselected"><i data-feather="briefcase"></i> <?php ee('Archive'); ?></a></li>
                        <?php endif ?>
                        <?php if($shortedUrl->public): ?>
                            <li><a class="dropdown-item" href="<?php echo route('links.private', ['link' => $shortedUrl->id]); ?>" data-trigger="archiveselected"><i data-feather="eye-off"></i> <?php ee('Set Private'); ?></a></li>
                        <?php else: ?>
                            <li><a class="dropdown-item" href="<?php echo route('links.public', ['link' => $shortedUrl->id]); ?>" data-trigger="archiveselected"><i data-feather="eye"></i> <?php ee('Set Public'); ?></a></li>
                        <?php endif ?>
                    <?php endif ?>
                    <?php if(user()->has('qr')): ?>
                        <li><a class="dropdown-item" href="<?php echo route('qr.create', ['url' => Helpers\App::shortRoute($shortedUrl->domain, $shortedUrl->alias . $shortedUrl->custom)]); ?>"><i data-feather="aperture"></i> <?php ee('Custom QR Code'); ?></a></li>
                    <?php endif ?>
                    <?php if(user()->has('export')): ?>
                        <li><a class="dropdown-item" href="<?php echo route('links.stats.export', [$shortedUrl->id]); ?>"><i data-feather="download"></i> <?php ee('Export Statistics'); ?></a></li>
                    <?php endif ?>
                    <?php if(user()->teamPermission('links.edit')): ?>
                        <li><a class="dropdown-item" href="<?php echo route('links.reset', [$shortedUrl->id, \Core\Helper::nonce('link.reset')]); ?>" data-bs-toggle="modal" data-trigger="modalopen" data-bs-target="#resetModal"><i data-feather="rotate-ccw"></i> <?php ee('Reset Stats'); ?></a></li>
                    <?php endif ?> --}}
                    {{-- <?php if(user()->teamPermission('links.delete')): ?> --}}
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li><a class="dropdown-item text-danger" href="{{ route('shortener.destroy', $shortedUrl->id) }}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" class="feather feather-trash">
                                <polyline points="3 6 5 6 21 6"></polyline>
                                <path
                                    d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                </path>
                            </svg>
                            Delete</a></li>
                </ul>
            </div>
            <div class="mb-2 d-block">
                <input class="form-check-input me-2" type="checkbox" data-dynamic="1" value="<?php echo $shortedUrl->id; ?>">
                {{-- <img src="<?php echo route('link.ico', $shortedUrl->id); ?>" width="16" height="16" class="rounded-circle me-1" alt="<?php echo $url->meta_title; ?>"> --}}
                <a href="{{$shortedUrl->url}}" target="_blank" rel="nofollow"><strong
                        class="text-break"><?php echo clean(truncate(isEmpty($shortedUrl->meta_title, $shortedUrl->url), 50), 3); ?></strong></a>
            </div>
            <div class="d-none d-sm-block">
                <?php if(!$shortedUrl->status): ?>
                <small class="badge bg-danger text-xs me-2">Disabled</small>
                <?php endif ?>
                <?php if($shortedUrl->archived): ?>
                <small class="badge bg-success text-xs me-2">Archived</small>
                <?php endif ?>
                {{-- <?php if($channels = $shortedUrl->channels()): ?>
                <?php foreach($channels as $channel): ?>
                    <a href="<?php echo route('channel', [$channel->id]); ?>"><small class="badge text-xs me-2" style="background-color: <?php echo $channel->color; ?>"><?php echo $channel->name; ?></small></a>
                <?php endforeach ?>
            <?php endif ?> --}}
                <?php if($shortedUrl->public): ?>
                <i class="align-middle me-1" data-feather="eye"></i> <small class="me-2" data-bs-toggle="tooltip"
                    data-bs-placement="top" title="Public">Public</small>
                <?php endif ?>
                <?php if ($shortedUrl->bundle): ?>
                <i class="align-middle me-1" data-feather="crosshair"></i> <small class="me-2"
                    data-bs-toggle="tooltip" data-bs-placement="top"
                    title="<?php ee('Campaign'); ?>: <?php echo $shortedUrl->bundlename; ?>"><?php echo $shortedUrl->bundlename; ?></small>
                <?php endif ?>
                <?php if (!empty($shortedUrl->location)): ?>
                <i class="align-middle me-1" data-feather="map-pin"></i> <small
                    class="me-2"><?php echo e('Geo Targeted'); ?></small>
                <?php endif ?>
                <?php if (!empty($shortedUrl->devices)): ?>
                <i class="align-middle me-1" data-feather="smartphone"></i> <small
                    class="me-2"><?php echo e('Device Targeted'); ?></small>
                <?php endif ?>
                <?php if (!empty($shortedUrl->options) && isset(json_decode($shortedUrl->options, true)['languages'])): ?>
                <i class="align-middle me-1" data-feather="type"></i> <small
                    class="me-2"><?php echo e('Language Targeted'); ?></small>
                <?php endif ?>
                <?php if (!empty($shortedUrl->options) && isset(json_decode($shortedUrl->options, true)['rotators'])): ?>
                <i class="align-middle me-1" data-feather="refresh-cw"></i> <small
                    class="me-2"><?php echo e('A/B Testing'); ?></small>
                <?php endif ?>
                <?php if (!empty($shortedUrl->options) && isset(json_decode($shortedUrl->options, true)['clicklimit'])): ?>
                <i class="align-middle me-1" data-feather="lock"></i> <small
                    class="me-2"><?php echo e('Click Limit'); ?></small>
                <?php endif ?>
                <?php if (!empty($shortedUrl->pass)): ?>
                <i class="align-middle me-1" data-feather="lock"></i> <small
                    class="me-2"><?php echo e('Protected'); ?></small>
                <?php endif ?>
                <?php if (!empty($shortedUrl->expiry)): ?>
                <i class="align-middle me-1" data-feather="calendar"></i> <small class="me-2"
                    data-bs-toggle="tooltip" data-bs-placement="top"
                    title="<?php echo e('Expiry on'); ?> <?php echo date('d F, Y', strtotime($shortedUrl->expiry)); ?>"> <?php ee('Expiration'); ?></small>
                <?php endif ?>
                <?php if (!empty($shortedUrl->pixels)): ?>
                <i class="align-middle me-1" data-feather="compass"></i> <small class="me-2"
                    data-bs-toggle="tooltip" data-bs-placement="top"><?php echo e('Pixels'); ?></small>
                <?php endif ?>
                <?php if (!empty($shortedUrl->description)): ?>
                <i class="align-middle me-1" data-feather="book-open"></i> <small class="me-2"
                    data-bs-toggle="tooltip" data-bs-placement="top"
                    title="<?php echo $shortedUrl->description; ?>"><?php echo e('Note'); ?></small>
                <?php endif ?>
                <?php if ($shortedUrl->parameters && $parameters = json_decode($shortedUrl->parameters, true)): ?>
                <i class="align-middle me-1" data-feather="sliders"></i> <small
                    class="me-2"><?php echo e('Parameters'); ?></small>
                <?php endif ?>
            </div>
            <div class="d-block mt-1">
                <small class="text-muted"
                    data-href="{{$shortedUrl->domain}}/{{ $shortedUrl->alias }}">{{$shortedUrl->domain}}/{{ $shortedUrl->alias }}</small>
                <a href="#copy" class="copy inline-copy" data-lang="Copied"
                    data-clipboard-text="{{$shortedUrl->domain}}/{{ $shortedUrl->alias }}"><small>Copy</small></a>
            </div>
            <div class="d-block mt-1">
                <small class="text-navy">{{ timeago($shortedUrl->date) }}</small>
                - <a href=""><small class="text-navy fw-bold"><?php echo $shortedUrl->click; ?> Clicks</small></a>
                <small class="text-navy d-none d-sm-inline fw-bold"> - <?php echo $shortedUrl->uniqueclick; ?> Unique Clicks</small>
            </div>
        </div>
    </div>
</div>
<style>
    .inline-copy {
        position: relative;
        background: #008aff;
        color: #fff !important;
        text-decoration: none;
        font-size: 11px;
        top: -2px;
        margin-left: 2px;
        padding: 0 3px 1px;
        border: 1px solid #0078de;
        border-radius: 2px;
        -moz-border-radius: 2px;
        -webkit-border-radius: 2px;
    }
</style>
<!-- Include clipboard.js library -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.8/clipboard.min.js"></script>

<script>
    var clipboard = new ClipboardJS('.copy');

    clipboard.on('success', function(e) {
        // Handle successful copy here, e.g., show a success message
        console.log('Copied to clipboard: ' + e.text);
    });

    clipboard.on('error', function(e) {
        // Handle copying errors here, e.g., show an error message
        console.error('Copy failed: ' + e.action);
    });
</script>
