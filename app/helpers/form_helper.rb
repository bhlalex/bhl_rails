module FormHelper

  class BHLFormBuilder < ActionView::Helpers::FormBuilder

    def text_area(method, options = {})
      (options['class'] = "#{options['class'].to_s} errors").strip! if errors_on?(method)
      super(method, options)
    end

    def text_field(method, options = {})
      (options['class'] = "#{options['class'].to_s} errors").strip! if errors_on?(method)
      super(method, options)
    end

    def password_field(method, options = {})
      (options['class'] = "#{options['class'].to_s} errors").strip! if errors_on?(method)
      super(method, options)
    end

    def label(method, content_or_options_with_block = nil, options = {}, &block)
      options = content_or_options_with_block if content_or_options_with_block.is_a?(Hash)
      options.symbolize_keys!
      if errors_on?(method)
        (options[:class] = "#{options[:class].to_s} errors").strip!
        (options[:title] = "#{options[:title].to_s} #{I18n.t(:form_validation_errors_for_attribute_assistive)}").strip!
        errors = errors_for_method(@object, method)
      end
    
      if block_given?
        @template.content_tag(:label, "#{@template.capture(&block)} #{errors.to_s}".html_safe, options)
      else
        super(method, content_or_options_with_block, options) + (errors ? @template.content_tag(:span, errors.to_s) : nil)
      end
    end

    # tags can include :all, :minimal (default) or a comma separated string of tags
    def allowed_html_help_tip(tags = :minimal)
      return nil
      tags = "p, em, strong, a, ul, ol, li" if tags.to_sym == :minimal
      tags = "p, em, strong, a, ul, ol, li, table, tr, td" if tags.to_sym == :all
      return I18n.t(:allowed_html_tags, :comma_separated_tags => tags)
    end

    private

    def errors_on?(method)
      @object.respond_to?(:errors) && @object.errors.respond_to?(:messages) && ! @object.errors.messages[method.to_sym].blank?
    end

    def errors_for_method(object, method)
      return unless errors_on?(method)
      errors = object.errors.messages[method.to_sym]
      if errors.any?
        errors = [errors] if errors.is_a? String
        @template.content_tag(:span, { :class => 'errors' }){ " " + errors.join(", ") }
      end
    end
  end

  def validation_errors_for(resource, message = nil)
    if resource.errors.any?
      message ||= I18n.t('activerecord.errors.template.header', :count => resource.errors.size, :model => '')
      capture_haml do
        haml_tag 'fieldset#errors' do
          haml_tag :legend, message
          haml_tag :ul do
            resource.errors.full_messages.each do |error|
              haml_tag :li, error
            end
          end
        end
      end
    end
  end
end