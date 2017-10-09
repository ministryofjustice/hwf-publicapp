module Forms
  class FormName < Base
    attribute :identifier, String
    attribute :unknown, Boolean

    validates :identifier, length: { maximum: 49 }
    validates :identifier, presence: true, unless: 'unknown?'

    private

    def export_params
      {
        form_name: name
      }
    end

    def name
      identifier.blank? ? nil : identifier
    end

  end
end
