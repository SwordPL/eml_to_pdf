require "eml_to_pdf_ext/version"
require "eml_to_pdf_ext/configuration"
require "eml_to_pdf_ext/converter"
require "eml_to_pdf_ext/converter"
require "eml_to_pdf_ext/email"
require "eml_to_pdf_ext/wkhtmltopdf"
require "eml_to_pdf_ext/metadata_context"
require "eml_to_pdf_ext/extraction_step"
require "eml_to_pdf_ext/extraction_step_list"
require "eml_to_pdf_ext/file_email_provider"
require "eml_to_pdf_ext/memory_email_provider"

module EmlToPdfExt
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
