class StepEighteenPage < BasePage
  element :address, '#applicant_address_address'
  element :postcode, '#applicant_address_postcode'
  elements :copy, '.text > p'
  elements :h2, 'h2'
  element :step_num, '.heading-secondary'
  section :tbody, 'tbody' do
    sections :tr, 'tr' do
      element :th, 'th'
      element :td, 'td'
      element :right_link, '.right > a'
    end
  end
  element :submit_button, 'input.button'

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
