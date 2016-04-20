class Storage
  def initialize(session)
    @session = session
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

  def empty?
    @session['questions'].blank?
  end
end
