module HungryForm
  module Rails
    module Renderable
      def wrapper_class
        classes = []
        classes << attributes[:wrapper_class] if attributes[:wrapper_class]
        classes << 'hidden' unless visible?

        if self.is_a?(HungryForm::Elements::Base::ActiveElement) && self.error.present?
          classes << HungryForm.configuration.rails.error_class || 'invalid'
        end

        classes.join(' ') if classes.any?
      end

      def input_attributes
        attributes.except(*[configuration[:input_attributes_except], :wrapper_class, :checked].flatten)
      end
    end
  end
end