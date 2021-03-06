module SitePrism
  class Page
    def self.inherited(subclass)
      super
      SitePrismSubclass << subclass
    end

    def load_page(expansion_or_html = {})
      if expansion_or_html.is_a? String
        @page = Capybara.string(expansion_or_html)
      else
        expanded_url = url(expansion_or_html)
        raise SitePrism::NoUrlForPage if expanded_url.nil?

        visit expanded_url
      end
    end
  end
end
