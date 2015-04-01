module HungryForm
  module Rails
    class Railtie < ::Rails::Railtie

      module Configuration
        attr_accessor :rails
      end

      initializer 'hungryform', before: :load_config_initializers do
        HungryForm::Elements::Base::Element.send :include, Renderable

        HungryForm.configuration.extend Configuration
        HungryForm.configuration.rails = ActiveSupport::OrderedOptions.new
        HungryForm.configuration.rails.elements_templates = 'hungryform'
      end

      initializer 'active_support' do
        ActiveSupport.on_load(:action_view) do
          ::ActionView::Base.send :include, ActionView
        end
      end
    end
  end
end