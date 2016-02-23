class Localise
  def self.i18n(object, path)
    ["questions.#{object.class.name.underscore}",
     path].join '.'
  end
end
