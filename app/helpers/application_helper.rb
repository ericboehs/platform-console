# frozen_string_literal: true

# For application-wide helpers
module ApplicationHelper
  # The flutie gem may be a better alternative if we outgrow this
  def body_class
    qualified_controller_name = controller.controller_path.tr '/', '-'
    "#{qualified_controller_name} #{qualified_controller_name}-#{controller.action_name}"
  end

  # The active_link_to gem may be a better alternative if we outgrow this
  def active_li_link_to(name = nil, options = {}, html_options = {}, &block)
    active = 'uk-active' if current_page? options
    content_tag :li, class: active do
      link_to name, options, html_options, &block
    end
  end
end
