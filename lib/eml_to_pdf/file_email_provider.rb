require 'mail'

module EmlToPdf
  class FileEmailProvider
    def initialize(input_path)
      @email = Mail.read(input_path)
    end

    attr_reader :email
  end
end
