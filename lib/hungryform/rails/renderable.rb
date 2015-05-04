module HungryForm
  module Rails
    # This module adds view specific methods to every HungryForm element
    module Renderable
      def wrapper_class
        classes = []
        classes << attributes[:wrapper_class] if attributes[:wrapper_class]
        classes << 'hidden' unless visible?

        invalid = self.is_a?(HungryForm::Elements::Base::ActiveElement) &&
                  error.present?

        if invalid
          classes << HungryForm.configuration.rails.error_class || 'invalid'
        end

        classes.join(' ') if classes.any?
      end

      def input_attributes
        except_attrs = [
          configuration[:input_attributes_except],
          :wrapper_class, :checked
        ]
        attributes.except(*except_attrs.flatten)
      end
    end
  end
end
