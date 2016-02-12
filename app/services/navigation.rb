class Navigation

  def steps
    { marital_status: :savings_and_investment,
      savings_and_investment: :benefit,
      benefit: :fee,
      fee: :probate,
      probate: :summary }
  end

end
