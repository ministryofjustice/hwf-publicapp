module Forms
  class FormName < Base
    attribute :identifier, String

    private

    def export_params
      {
        form_name: identifier.blank? ? nil : identifier
      }
    end
  end
end
