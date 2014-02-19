class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	rescue_from CanCan::AccessDenied do |exception|
		if exception.action == :create && exception.subject == Nugget && !current_user.approved?
			redirect_to root_url, :warning => "Thank you for contributing, however new accounts must be approved by an administrator after five nugget submissions."
		else
			redirect_to root_url, :danger => exception.message # Style alert seperatly
		end
  end
end
