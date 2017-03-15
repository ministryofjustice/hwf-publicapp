module ApplicationHelper
  def display_for_english?
    I18n.locale == :en
  end
end
