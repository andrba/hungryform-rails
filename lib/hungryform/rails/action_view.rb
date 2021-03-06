module HungryForm
  module Rails
    # View helpers
    module ActionView
      # Render a form
      def hungry_form_for(form, options = {})
        options[:data] ||= {}
        options[:data][:rel] ||= form_rel(form)
        options[:class] = [options[:class], 'hungryform'].compact.join(' ')

        views_prefix = options.delete(:elements_templates) ||
                       HungryForm.configuration.rails.elements_templates

        form_tag('', options) do
          render partial: "#{views_prefix}/form", locals: {
            form: form,
            views_prefix: views_prefix
          }
        end
      end

      # Render a link to the next page
      def hungry_link_to_next_page(form, name, **options, &block)
        link_to name, *link_params(form, options, action: :next), &block
      end

      # Render a link to the previous page
      def hungry_link_to_prev_page(form, name, **options, &block)
        link_to name, *link_params(form, options, action: :prev), &block
      end

      # Render a link to a provided page
      def hungry_link_to_page(form, page, **options, &block)
        link_to page.label, *link_params(form, options, action: :page, page: page), &block
      end

      # Render a link that submits the form
      def hungry_link_to_submit(form, name, **options, &block)
        params = clean_params(form, options.delete(:params))

        link_to(name, url_for(params), options.reverse_merge(
          data: { 
            form_method: :post,
            form_action: :submit,
            rel: form_rel(form)
          }
        ), &block)
      end

      private

      # Form ralation attribute is used to streamline js selection of a form
      # and its navigational elements like next/prev buttons and pages lists
      def form_rel(form)
        "hungry-form-#{form.__id__}"
      end

      # Builds link_to params except for the link's name
      def link_params(form, options, action_options = {})
        options = options.dup
        method = options.delete(:method) || 'get'
        params = clean_params(form, options.delete(:params))

        if method.to_s == 'get'
          params[:page] = get_page(form, action_options)
        else
          params[:page] = form.current_page.name
        end

        options.reverse_merge!(
          data: {
            form_method: method,
            form_action: action_options[:action],
            rel: form_rel(form)
          }
        )

        [url_for(params), options]
      end

      # Find the name of the page to go to when the 'get' method is used in a
      # form navigation
      def get_page(form, action_options)
        case action_options[:action]
        when :page
          action_options[:page].name
        when :next, :prev
          form.send("#{action_options[:action]}_page").try(:name) || ''
        end
      end

      # Remove Rails specific params from the params hash as well as
      # all the form params
      def clean_params(form, params)
        rails_params = [:authenticity_token, :commit, :utf8, :_method]
        form_params = form.elements.keys + [:form_action, :errors]
        self.params.except(*(rails_params + form_params)).merge(params || {})
      end
    end
  end
end
