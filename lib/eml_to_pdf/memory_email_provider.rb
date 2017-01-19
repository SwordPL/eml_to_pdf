require 'mail'

module EmlToPdf
  class MemoryEmailProvider
    def initialize(content)
      @email = Mail.new(content)
    end

    attr_reader :email
  end
end
