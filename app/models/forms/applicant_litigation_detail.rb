module Forms
  class ApplicantLitigationDetail < Base
    attribute :litigation_friend_details, String

    validates :litigation_friend_details, presence: true

    private

    def export_params
      {
        litigation_friend_details: litigation_friend_details
      }
    end
  end
end
