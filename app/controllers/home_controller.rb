class HomeController < ApplicationController
  ACTIONS = [:marital_status,
             :savings_and_investment,
             :benefit,
             :fee,
             :income,
             :probate,
             :claim,
             :form_name,
             :national_insurance,
             :personal_detail,
             :applicant_address,
             :contact].freeze

  def index
  end

  ACTIONS.each do |action|
    define_method(action.to_s) do
      instance_variable_set("@#{action}", model_from_params(action))
      assign_marital_status
    end

    define_method("#{action}_save") do
      begin
        instance = action.to_s.classify.constantize.new(params[action])
        instance.valid?
        session[action] = instance
        session["#{action}_errors"] = instance.errors || nil
        raise 'invalid object' if instance.errors.any?
        redirect_to next_step(action)
      rescue
        redirect_to action
      end
    end
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
