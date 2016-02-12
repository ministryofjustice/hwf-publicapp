class HomeController < ApplicationController
  ACTIONS = [:marital_status,
             :savings_and_investment,
             :benefit,
             :fee,
             :probate,
             :claim]

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
        redirect_to next_step(action)
      else
        redirect_to action
      end
    end
  end

  def summary
    @marital_status = session[:married]
    @savings_and_investments = session[:less_than_limit]
    @benefits = session[:on_benefits]
    @fee = session[:paid]
    @probate = session[:kase]
  end

  private

  def create_instance(action)
    instance_variable_set("@#{action}", model_instance(action))
    instance_variable_get("@#{action}")
  end

  def model_instance(model_name)
    model_name.to_s.classify.constantize.new
  end

  def assign_attributes(instance, params)
    instance.attributes.keys.each do |key|
      instance.send("#{key}=", params[key.to_s])
    end
  end

  def save_in_session(instance)
    instance.attributes.each do |attribute|
      session[attribute[0]] = instance.send(attribute[0])
    end
  end

  def next_step(action)
    ::Navigation.new.steps[action]
  end
end
