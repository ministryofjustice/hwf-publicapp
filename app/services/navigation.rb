class Navigation

  def steps
    { marital_status: :savings_and_investment,
      savings_and_investment: :benefit,
      benefit: :fee,
      fee: :probate,
      probate: :claim,
      claim: :summary }
  end

end
