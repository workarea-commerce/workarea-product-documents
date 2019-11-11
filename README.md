WebLinc Product Documents
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

You must have access to a WebLinc gems server to use this gem. Add your gems server credentials to Bundler:

    bundle config gems.weblinc.com my_username:my_password

Or set the appropriate environment variable in a shell startup file:

    export BUNDLE_GEMS__WEBLINC__COM='my_username:my_password'

Then add the gem to your application's Gemfile specifying the source:

    # ...
    gem 'workarea-product_documents', source: 'https://gems.weblinc.com'
    # ...

Or use a source block:

    # ...
    source 'https://gems.weblinc.com' do
      gem 'workarea-product_documents'
    end
    # ...

Update your application's bundle.

    cd path/to/application
    bundle

WebLinc Platform Documentation
--------------------------------------------------------------------------------

See [https://developer.workarea.com/](https://developer.workarea.com/) for Workarea platform documentation.

Copyright & Licensing
--------------------------------------------------------------------------------

Copyright WebLinc 2015. All rights reserved.

For licensing, contact sales@weblinc.com.
