class Storage
  def initialize(session)
    @session = session
  end

  def save_form(form)
    @session[form.id] = form.as_json
  end

  def load_form(form)
    params = @session[form.id] || {}
    form.update_attributes(params)
  end
end
