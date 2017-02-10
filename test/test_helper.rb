require 'minitest/autorun'
require 'bundler/setup'
require 'eml_to_pdf_ext'
require 'nokogiri'

class MiniTest::Test

  TEST_FOLDER_PATH = Pathname.new(File.expand_path(__dir__))

  def email_fixture_path(name)
    EmlToPdfExt::FileEmailProvider.new(fixture_path(name + ".eml", :emails))
  end

  def read_email_fixture_path(name)
    File.read(fixture_path(name + ".eml", :emails))
  end

  def raw_email_fixture_path(name)
    fixture_path(name + ".eml", :emails)
  end

  def html_fixture(name)
    fixture(name + ".html", :html)
  end

  def fixture_path(name, subfolder = "")
    (TEST_FOLDER_PATH + "fixtures" + subfolder.to_s + name).to_s
  end

  def fixture(name, subfolder = "")
    File.read(fixture_path(name, subfolder))
  end
end
