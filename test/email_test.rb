require 'test_helper'

class EmailTest < MiniTest::Test
  def setup
    super
    EmlToPdfExt.configure do |config|
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

  def test_ascii_7bit
    email = EmlToPdfExt::Email.new(email_fixture_path("ascii_7bit"))
    assert_html_equal(html_fixture("ascii_7bit"), email.to_html)
  end

  def test_attachment
    email = EmlToPdfExt::Email.new(email_fixture_path("attachment"))
    assert_html_equal(html_fixture("attachment"), email.to_html)
  end

  def test_attachments_without_content_disposition
    email = EmlToPdfExt::Email.new(email_fixture_path("attachments_without_content_disposition"))
    assert_html_equal(html_fixture("attachments_without_content_disposition"), email.to_html)
  end

  def test_broken_meta_tags
    email = EmlToPdfExt::Email.new(email_fixture_path("broken_meta_tags"))
    assert_html_equal(html_fixture("broken_meta_tags"), email.to_html)
  end

  def test_cid
    email = EmlToPdfExt::Email.new(email_fixture_path("cid"))
    assert_html_equal(html_fixture("cid"), email.to_html)
  end

  def test_encoded_word_without_lwsp
    email = EmlToPdfExt::Email.new(email_fixture_path("encoded_word_without_lwsp"))
    assert_html_equal(html_fixture("encoded_word_without_lwsp"), email.to_html)
  end

  def test_from_header_with_quotes
    email = EmlToPdfExt::Email.new(email_fixture_path("from_header_with_quotes"))
    assert_html_equal(html_fixture("from_header_with_quotes"), email.to_html)
  end

  def test_fwd_attachment
    email = EmlToPdfExt::Email.new(email_fixture_path("fwd_attachment"))
    assert_html_equal(html_fixture("fwd_attachment"), email.to_html)
  end

  def test_invalid_date
    email = EmlToPdfExt::Email.new(email_fixture_path("invalid_date"))
    assert_html_equal(html_fixture("invalid_date"), email.to_html)
  end

  def test_latin1
    email = EmlToPdfExt::Email.new(email_fixture_path("latin1"))
    assert_html_equal(html_fixture("latin1"), email.to_html)
  end

  def test_latin1_multipart
    email = EmlToPdfExt::Email.new(email_fixture_path("latin1_multipart"))
    assert_html_equal(html_fixture("latin1_multipart"), email.to_html)
  end

  def test_multipart_text
    email = EmlToPdfExt::Email.new(email_fixture_path("multipart_text"))
    assert_html_equal(html_fixture("multipart_text"), email.to_html)
  end

  def test_multiple_html_parts
    email = EmlToPdfExt::Email.new(email_fixture_path("multiple_html_parts"))
    assert_html_equal(html_fixture("multiple_html_parts"), email.to_html)
  end

  def test_nested_attachments
    email = EmlToPdfExt::Email.new(email_fixture_path("nested_attachments"))
    assert_html_equal(html_fixture("nested_attachments"), email.to_html)
  end

  def test_nested_html_attachment
    email = EmlToPdfExt::Email.new(email_fixture_path("nested_html_attachment"))
    assert_html_equal(html_fixture("nested_html_attachment"), email.to_html)
  end

  def test_nested_referenced_image_attachment
    email = EmlToPdfExt::Email.new(email_fixture_path("nested_referenced_image_attachment"))
    assert_html_equal(html_fixture("nested_referenced_image_attachment"), email.to_html)
  end

  def test_resent
    email = EmlToPdfExt::Email.new(email_fixture_path("resent"))
    assert_html_equal(html_fixture("resent"), email.to_html)
  end

  def test_time_zone_dates
    email = EmlToPdfExt::Email.new(email_fixture_path("time_zone_dates"))
    assert_html_equal(html_fixture("time_zone_dates"), email.to_html)
  end

  def test_utf8
    email = EmlToPdfExt::Email.new(email_fixture_path("utf8"))
    assert_html_equal(html_fixture("utf8"), email.to_html)
  end

  def test_xxs_mail
    email = EmlToPdfExt::Email.new(email_fixture_path("xxs_mail"))
    assert_html_equal(html_fixture("xxs_mail"), email.to_html)
  end

  def assert_html_equal(expected, actual)
    assert_equal(expected.gsub(/\s+/, ' '), actual.gsub(/\s+/, ' '))
  end
end
