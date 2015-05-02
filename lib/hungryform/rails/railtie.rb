module HungryForm
  module Rails
    class Railtie < ::Rails::Railtie

      module Configuration
        attr_accessor :rails

        def self.extended(base)
          base.rails = ActiveSupport::OrderedOptions.new

          base.rails.elements_templates = 'hungryform'
          base.rails.error_class = 'invalid'

          [:next_button_class, :prev_button_class, :submit_button_class].each do |button|
            base.rails.send(button, '')
          end
        end
      end

      initializer 'hungryform', before: :load_config_initializers do
        HungryForm::Elements::Base::Element.send :include, Renderable
        HungryForm.configuration.extend Configuration
      end

      initializer 'active_support' do
        ActiveSupport.on_load(:action_view) do
          ::ActionView::Base.send :include, ActionView
        end
      end
    end
  end
end