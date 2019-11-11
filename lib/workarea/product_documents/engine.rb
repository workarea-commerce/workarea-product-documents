module Workarea
  module ProductDocuments
    class Engine < ::Rails::Engine
      include Workarea::Plugin
      isolate_namespace Workarea::ProductDocuments
    end
  end
end
