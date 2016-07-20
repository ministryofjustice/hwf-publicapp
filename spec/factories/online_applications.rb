FactoryGirl.define do
  factory :online_application do
    married false
    min_threshold_exceeded false
    benefits true
    children 0
    refund false
    probate false
    ni_number 'AB123456C'
    date_of_birth Time.zone.parse('10/03/1976')
    first_name 'Peter'
    last_name 'Smith'
    address '102 Petty France, London'
    postcode 'SW1H 9AJ'
    email_contact false
    phone_contact false
    post_contact false

    trait :refund do
      refund true
      date_fee_paid 20.days.ago
    end

    trait :et do
      form_name 'ET'
    end

    trait :extra_savings_question_required do
      min_threshold_exceeded true
      max_threshold_exceeded false
    end

    trait :savings_less_than_threshold do
      min_threshold_exceeded false
    end

    trait :savings_more_than_threshold do
      min_threshold_exceeded true
      max_threshold_exceeded true
    end

    trait :savings_between_threshold do
      min_threshold_exceeded true
      max_threshold_exceeded false
    end

    trait :income_not_set do
      income nil
      income_min_threshold_exceeded nil
      income_max_threshold_exceeded nil
    end

    trait :no_income do
      income 0
    end

    trait :income_between_thresholds do
      income 1500
      income_min_threshold_exceeded true
      income_max_threshold_exceeded false
    end

    trait :income_below_thresholds do
      income nil
      income_min_threshold_exceeded false
    end

    trait :income_above_thresholds do
      income nil
      income_min_threshold_exceeded true
      income_max_threshold_exceeded true
    end
  end
end
