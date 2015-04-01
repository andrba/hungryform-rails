module HungryForm
  module Rails
    module Renderable
      def html_class
        classes = []
        classes << attributes[:class] if attributes[:class]
        classes << 'hidden' unless visible?
        classes << 'invalid' if self.is_a?(HungryForm::Elements::Base::ActiveElement) && self.error.present?
        classes.join(' ') if classes.any?
      end
    end
  end
end