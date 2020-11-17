class FooterPage < BasePage
  section :content, '.govuk-footer.no-print' do
    element :footer_links, '.govuk-footer__inline-list'
  end
end
