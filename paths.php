<?php
/**
 * This file is part of dotfiles
 *
 * @copyright Copyright (c) 2015, John Nickell.
 * @license   http://opensource.org/licenses/MIT The MIT License
 * @author    John Nickell <https://johnnickell.com>
 */

$home_dir = getenv('HOME');
$root_dir = __DIR__;

return [
    'root'    => $root_dir,
    'backup'  => $root_dir.'/backup',
    'copy'    => $root_dir.'/copy',
    'home'    => $home_dir,
    'link'    => $root_dir.'/link',
    'script'  => $root_dir.'/script',
    'sublime' => $root_dir.'/sublime',
    'vendor'  => $root_dir.'/vendor'
];
