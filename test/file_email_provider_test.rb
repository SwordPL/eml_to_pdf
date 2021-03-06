require 'test_helper'

class FileEmailProviderTest < MiniTest::Test
  def setup
    super
    EmlToPdf.configure do |config|
      config.from_label = "Von:"
      config.to_label = "An:"
      config.cc_label = "Cc:"
      config.date_label = "Datum:"
      config.date_format do |date|
        date.strftime("%d.%m.%Y um %H:%M")
      end
    end
  end

  def teardown
    super
    EmlToPdfExt.reset_configuration!
  end

  def test_type_of_object
    email = EmlToPdfExt::FileEmailProvider.new(raw_email_fixture_path("ascii_7bit"))
    assert_kind_of(Mail::Message, email.email)
  end
end