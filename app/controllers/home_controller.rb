class HomeController < ApplicationController
  def index
  end

  def summary
    @summary = Views::Summary.new(session)
  end

  private

  def model_from_params(action)
    model = action.to_s.classify.constantize.new
    if session[action]
      assign_attributes(model, session[action])
      session["#{action}_errors"].try(:each) do |attribute, message|
        model.errors.add(attribute, message)
      end
    end
    model
  end

  def assign_marital_status
    @married = session[:marital_status]['married'] if session[:marital_status]
  end

  def assign_attributes(instance, params)
    instance.attributes.keys.each do |key|
      instance.send("#{key}=", params[key.to_s])
    end
  end

  def next_step(action)
    ::Navigation.new.steps[action]
  end
end
