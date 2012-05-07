/*
 Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config )
{
    config.toolbar = 'Easy';

    config.toolbar_Easy =
        [
            ['Bold','Italic','Strike'],
            ['BulletedList','NumberedList','Blockquote'],
            ['JustifyLeft','JustifyCenter','JustifyRight'],
            ['Link','Unlink'],
            ['Subscript', 'Superscript'],
            ['YahooMaps', 'Dictionary'],
            '/',
            ['Format'],
            ['Underline', 'JustifyBlock', 'TextColor'],
            ['Outdent','Indent'],
            ['Undo','Redo'],
            ['Source']
        ];
};