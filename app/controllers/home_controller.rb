require 'nokogiri'
require 'open-uri'

class HomeController < ApplicationController
  def index
    begin
        puts 'fetching...'
        @service = Nokogiri::XML.parse(open("http://web.mta.info/status/serviceStatus.txt"))
    rescue OpenURI::HTTPError
        @service = 404
    end
    if @service != 404
        @status = @service.xpath('//status')[7].text.include?('GOOD SERVICE') ? 'THE L IS OKAY' : 'THE L IS NOT SO GOOD'
    else
        @status = "SOMETHING IS UP WITH THE STATUS SERVICE"
    end
  end
end
