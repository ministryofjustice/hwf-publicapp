module YamlHelper
  include ActionView::Helpers::TagHelper

  def display_section(yaml_hash, from = 2, add_to = nil)
    @recursion_level = from
    @this_section = yaml_hash

    @result = add_to || ActiveSupport::SafeBuffer.new
    add_header
    process_collection(:parts) if collection_exists?(:parts)
    process_sections(from) if collection_exists?(:sections)
    @result
  end

  private

  def add_header
    unless @this_section[:title].blank?
      @result << header_block do
        header_text + anchor_tag
      end
    end
  end

  def header_block(&block)
    content_tag("h#{@recursion_level}", class: header_class) do
      yield block
    end
  end

  def header_text
    content_tag(:span, @this_section[:title])
  end

  def anchor_tag
    content_tag(:a, '', name: @this_section[:title].parameterize.underscore)
  end

  def ul_tag(&block)
    content_tag(:ul, class: 'list list-bullet') do
      yield block
    end
  end

  def li_tag(item)
    content_tag('li', item)
  end

  def collection_exists?(name)
    @this_section[name]
  end

  def process_collection(name)
    @this_section[name].each do |part|
      @result << if part.keys.first == :ul
                   ul_tag do
                     collect_list_items(part)
                   end
                 else
                   content_tag(part.keys.first, part.values.first.html_safe)
                 end
    end
  end

  def collect_list_items(part)
    part.values.first.collect { |item| concat(li_tag(item.values.first)) }
  end

  def process_sections(from)
    @this_section[:sections].each do |subsection|
      display_section subsection, from + 1, @result
    end
  end

  def header_class
    {
      1 => 'heading-xlarge heading-with-lede',
      2 => 'heading-large',
      3 => 'heading-medium'
    }[@recursion_level]
  end
end
