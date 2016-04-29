module Forms
  class FormName < Base
    attribute :identifier, String

    validates :identifier, length: { maximum: 49 }

    private

    def export_params
      {
        form_name: identifier.blank? ? nil : identifier
      }
    end
  end
end
