Workarea Product Documents
================================================================================

Product Documents plugin for the Workarea platform.
-------------------------------------------------------------------------------

This gem adds the ability to add documents to a product for display on the detail page.

Files can be added via the product admin. Each file requires a display name and a file for downloading.
Files with the same display name will be grouped together when output on the product detail page.

The display order of the files can be modified via drag-and-drop in the admin.


Getting Started
--------------------------------------------------------------------------------

This gem contains a rails engine that must be mounted onto a host Rails application.

Add the gem to your application's Gemfile specifying the source:

    # ...
    gem 'workarea-product_documents'
    # ...

Update your application's bundle.

    cd path/to/application
    bundle

Workarea Platform Documentation
--------------------------------------------------------------------------------

See [https://developer.workarea.com/](https://developer.workarea.com/) for Workarea platform documentation.

License
--------------------------------------------------------------------------------

Workarea Emarsys is released under the [Business Software License](LICENSE)
