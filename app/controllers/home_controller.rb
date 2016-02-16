class HomeController < ApplicationController
  ACTIONS = [:marital_status,
             :savings_and_investment,
             :benefit,
             :fee,
             :probate,
             :claim,
             :form_name,
             :national_insurance,
             :personal_detail,
             :applicant_address].freeze

  def index
  end

  ACTIONS.each do |action|
    define_method(action.to_s) do
      instance_variable_set("@#{action}", model_instance(action))
    end

    define_method("#{action}_save") do
      instance = create_instance(action)
      assign_attributes(instance, params[action.to_s.singularize])
      if instance.valid?
        save_in_session(instance)
        session[:errors] = nil
        redirect_to next_step(action)
      else
        session[:errors] = instance.errors
        redirect_to action
      end
    end
  end

  def summary
    @summary = Views::Summary.new(session)
  end

  private

  def create_instance(action)
    instance_variable_set("@#{action}", model_instance(action))
    instance_variable_get("@#{action}")
  end

  def model_instance(model_name)
    model = model_name.to_s.classify.constantize.new
    session[:errors].try(:each) do |attribute, message|
      model.errors.add(attribute, message)
    end
    model
  end

  def assign_attributes(instance, params)
    instance.attributes.keys.each do |key|
      instance.send("#{key}=", params[key.to_s])
    end
  end

  def save_in_session(instance)
    instance.attributes.each do |attribute|
      session["#{instance.class.name.underscore}_#{attribute[0]}"] = instance.send(attribute[0])
    end
  end

  def next_step(action)
    ::Navigation.new.steps[action]
  end
end
