def probate_fees_release_date
  if Settings.probate_fees.release_date.is_a?(Date)
    Settings.probate_fees.release_date
  else
    Time.zone.parse(Settings.probate_fees.release_date)
  end
end

def a_day_before_disable_probate_fees
  probate_fees_release_date - 1.day
end