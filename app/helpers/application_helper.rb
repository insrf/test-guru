module ApplicationHelper

  FLASH_KEY = { 'notice' => 'alert alert-success', 'alert' => 'alert alert-danger' }.freeze

  def year_now
    Time.current.year
  end

  def flash_css_class(key)
    FLASH_KEY[key]
  end

end
