module EmlToPdf
  class Configuration
    attr_accessor :from_label, :to_label, :cc_label, :date_label, :metadata_visible, :links_enabled, :link_format_whitelist

    def initialize
      @from_label, @to_label, @cc_label, @date_label= 'From', 'To', 'Cc', 'Date'
      @date_format = lambda { |date| date.strftime('%Y-%m-%d %H:%M:%S %z') }
      @metadata_visible = true
      @links_enabled = true
      @link_format_whitelist = []
    end

    def date_format(&block)
      if block_given?
        @date_format = block
      else
        @date_format
      end
    end

    def format_date(date)
      @date_format.call(date)
    end
  end
end
