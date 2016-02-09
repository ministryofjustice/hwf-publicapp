class HomeController < ApplicationController
  ACTIONS = [:marital_status]
  def index
  end

  ACTIONS.each do |action|
    define_method(action.to_s) do
      instance_variable_set("@#{action}", model_instance(action))
    end

    define_method("#{action}_save") do
      session[action] = params[action.to_s]["married"]
      redirect_to :summary
    end
  end

  def summary
    @marital_status = session[:marital_status]
  end

  private

  def model_instance(model_name)
    model_name.to_s.classify.constantize.new
  end
end
