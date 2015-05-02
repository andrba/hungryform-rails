module HungryForm
  module Rails
    module Renderable
      def wrapper_class
        classes = []
        classes << configuration[:wrapper_class] if configuration.key?(:wrapper_class)
        classes << attributes[:wrapper_class] if attributes[:wrapper_class]
        classes << 'hidden' unless visible?
        classes << 'invalid' if self.is_a?(HungryForm::Elements::Base::ActiveElement) && self.error.present?
        classes.join(' ') if classes.any?
      end

      def input_attributes
        attributes.except(*[configuration[:input_attributes_except], :wrapper_class].flatten)
      end
    end
  end
end