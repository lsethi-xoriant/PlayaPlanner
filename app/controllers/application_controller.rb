class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_filter :set_csrf_cookie

  helper_method :current_user, :signed_in?

  def set_csrf_cookie
  	cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
	end

	protected

  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end

  private

  def current_user
    @current_user ||= User.find_by(session_token: session[:token])
  end

  def signed_in?
    !!current_user
  end

  def sign_in(user)
    @current_user = user
    session[:token] = user.reset_session_token!
  end

  def sign_out
    current_user.try(:reset_session_token!)
    session[:token] = nil
  end
end
