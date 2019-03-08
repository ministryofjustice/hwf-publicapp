class ProbateFeesSwitch
  def self.use_probate_fees_changes?
    Time.zone.now >= Settings.probate_fees.release_date
  end
end
