# rubocop:disable Rails/OutputSafety
module YamlTableHelper
  # rubocop:disable Metrics/MethodLength
  def table_block(part)
    table_tag do
      part[:table].map do |row|
        if row.key?(:caption)
          caption_tag(row[:caption])
        elsif row.key?(:thead)
          thead_row(row)
        elsif row.key?(:tbody)
          tbody_row(row)
        end
      end.join.html_safe
    end
  end
  # rubocop:enable Metrics/MethodLength

  def thead_row(row)
    thead_tag do
      row[:thead].collect do |tr|
        tr_tag do
          tr[:tr].collect { |item| concat(th_tag(item.values.first)) }
        end
      end.join.html_safe
    end
  end

  def tbody_row(row)
    tbody_tag do
      row[:tbody].collect do |tr|
        tr_tag do
          tr[:tr].collect { |item| concat(td_tag(item.values.first)) }
        end
      end.join.html_safe
    end
  end

  def table_tag(&block)
    tag.table(class: 'govuk-table') do
      yield block
    end
  end

  def thead_tag(&block)
    tag.thead(class: 'govuk-table__head') do
      yield block
    end
  end

  def tbody_tag(&block)
    tag.tbody(class: 'govuk-table__body') do
      yield block
    end
  end

  def tr_tag(&block)
    tag.tr(class: 'govuk-table__row') do
      yield block
    end
  end

  def th_tag(item)
    tag.th(item, class: 'govuk-table__header').html_safe
  end

  def td_tag(item)
    tag.td(item, class: 'govuk-table__cell').html_safe
  end

  def caption_tag(item)
    tag.caption(item, class: 'govuk-table__caption').html_safe
  end

end
# rubocop:enable Rails/OutputSafety
