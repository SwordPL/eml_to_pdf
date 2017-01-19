require "eml_to_pdf/version"
require "eml_to_pdf/configuration"
require "eml_to_pdf/converter"
require "eml_to_pdf/converter"
require "eml_to_pdf/email"
require "eml_to_pdf/wkhtmltopdf"
require "eml_to_pdf/metadata_context"
require "eml_to_pdf/extraction_step"
require "eml_to_pdf/extraction_step_list"
require "eml_to_pdf/file_email_provider"
require "eml_to_pdf/memory_email_provider"

module EmlToPdf
  def self.convert(input, output)
    Converter.new(input, output).convert
  end

  def self.configure
    yield configuration if block_given?
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset_configuration!
    @configuration = Configuration.new
  end
end
