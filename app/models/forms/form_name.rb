module Forms
  class FormName < Base
    attribute :identifier, String
    attribute :unknown, Boolean
    attribute :probate, Boolean

    validates :identifier, length: { maximum: 49 }
    validates :identifier, presence: true, unless: 'unknown?'

    validates :probate, acceptance: { accept: false }

    private

    def export_params
      {
        form_name: name
      }
    end

    def name
      identifier.presence
    end

  end
end
