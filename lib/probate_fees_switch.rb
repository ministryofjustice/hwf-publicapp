class ProbateFeesSwitch
  def self.disable_probate_fees?
    Time.zone.now >= Settings.probate_fees.release_date
  end
end
