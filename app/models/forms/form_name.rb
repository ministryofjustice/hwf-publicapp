module Forms
  class FormName < Base
    attribute :identifier, String
    attribute :unknown, Boolean
    attribute :et, Boolean
    attribute :probate, Boolean

    validates :identifier, length: { maximum: 49 }
    validates :identifier, presence: true, unless: 'unknown? || et?'

    validates :probate, acceptance: { accept: false }

    private

    def export_params
      {
        form_name: form_name
      }
    end

    def form_name
      [prefix, name].compact.join(' ') if prefix || name
    end

    def name
      identifier.blank? ? nil : identifier
    end

    def prefix
      et? ? 'ET' : nil
    end
  end
end
