class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  def validator(object)
    object.valid?
    model = object.class.name.underscore.to_sym
    field = params[model].first[0]
    @errors = object.errors[field]
    if @errors.empty?
      @errors = true
    else
      name = t("activerecord.attributes.#{model}.#{field}")
      @errors.map! { |e| "<div class=\"alert alert-danger\">#{name} #{e}</div>" }
    end
  end


end
