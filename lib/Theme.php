<?php

namespace ChildTheme;

use DioBrando\Theme as ThemeBase;

/**
 * Class Theme
 *
 * Configure settings by overriding parent class constants
 *
 * @package Theme
 */
class Theme extends ThemeBase
{
    const REMOVE_DEFAULT_POST_TYPE = true;

    const PLATFORM_THEME_SUPPORT = [
        'estarossa/nav-menu',
        'estarossa/tag-manager',
        'design-producer',
        'video-producer',
        'media-gallery-producer',
        'preview-producer'
    ];

    /**
     * Add theme-specific hooks
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Add theme-specific style and script enqueues
     */
    public function assets()
    {
        parent::assets();
    }
}
