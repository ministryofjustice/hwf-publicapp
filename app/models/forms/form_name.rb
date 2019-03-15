module Forms
  class FormName < Base
    attribute :identifier, String
    attribute :unknown, Boolean

    validates :identifier, length: { maximum: 49 }
    validates :identifier, presence: true, unless: 'unknown?'
    validates :identifier, format: { with: /\A((?!EX160|COP44A).)*\z/i }, allow_nil: true

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
