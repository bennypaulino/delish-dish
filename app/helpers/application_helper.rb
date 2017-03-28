module ApplicationHelper
  # Returns a title on a per-page basis.
  def full_title(page_title = '')
    base_title = "nomnomnomnom"
    default_page_title = "DelishDish"
    if page_title.empty?
      default_page_title + " | " + base_title
    else
     page_title + " | " + base_title
    end
  end

  def alert_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end
end
