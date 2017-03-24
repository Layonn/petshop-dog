module ApplicationHelper
  def navbar_status(controller)
    'active' if params[:controller] == controller
  end

end
