require "filesize"
require "cgi"
require "ostruct"

module EmlToPdfExt
  class MetadataContext < OpenStruct
    def config
      EmlToPdfExt.configuration
    end

    def format_attachment_size(attachment)
      Filesize.from("#{attachment.body.decoded.size} B").pretty
    end

    def format_date(date)
      config.format_date(date)
    end

    def html_escape(str)
      CGI.escapeHTML(str)
    end

    def get_binding
      binding
    end
  end
end
