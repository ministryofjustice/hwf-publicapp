class StepTwoPage < BasePage
  set_url '/questions/fee'

  section :content, '#content' do
    element :p, 'p'
    element :page_header, 'h1'
    element :hint, '.text'
  end

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
