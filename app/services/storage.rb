class Storage
  class Expired < StandardError; end

  def initialize(session)
    @session = session
    check_expiration!
  end

  def start
    @session[:started_at] = Time.zone.now
  end

  def started?
    @session[:started_at].present?
  end

  def time_taken
    return nil unless started?
    seconds = (Time.zone.now - started_at).round
    seconds * 1000 # GA needs milliseconds
  end

  def save_form(form)
    @session['questions'] = {} unless @session['questions']
    @session['questions'][form.id] = form.as_json
  end

  def load_form(form)
    params = @session['questions'] ? (@session['questions'][form.id] || {}) : {}
    form.update_attributes(params)
  end

  def submission_result=(result)
    @session[:submission_result] = result
  end

  def submission_result
    @session[:submission_result]
  end

  private

  def check_expiration!
    if started? && expired?
      @session.destroy
      raise Expired
    else
      @session[:used_at] = Time.zone.now
    end
  end

  def expired?
    @session[:used_at] && ((Time.zone.now - used_at).round >= expires_in_seconds)
  end

  def used_at
    field_as_time(:used_at)
  end

  def started_at
    field_as_time(:started_at)
  end

  def field_as_time(field)
    @session[field].is_a?(String) ? Time.zone.parse(@session[field]) : @session[field]
  end

  def expires_in_seconds
    Settings.session.expires_in_minutes * 60
  end
end
