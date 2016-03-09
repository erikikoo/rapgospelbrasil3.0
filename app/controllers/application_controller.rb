class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login

    # Refresh the menu in the layout
    refresh_dom_with_partial('div#container-artistas', 'historia')

    # Continue with the default rendering
  end

end
