class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Storage::Expired, with: :expired_redirect

  private

  def online_application
    @online_application ||= builder.online_application
  end

  def builder
    @builder ||= OnlineApplicationBuilder.new(storage)
  end

  def storage
    @storage ||= Storage.new(session)
  end

  def suppress_browser_cache
    response.headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
  end

  def redirect_if_storage_unstarted
    redirect_to(root_path) unless storage.started?
  end

  def expired_redirect
    flash[:error] = t('session.expired_message')
    redirect_to(root_path)
  end

  def ga_events
    @ga_events ||= []
  end
end
