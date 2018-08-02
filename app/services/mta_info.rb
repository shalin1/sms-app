require 'nokogiri'
require 'open-uri'

class MtaInfo
  attr_reader :l_status

  def initialize
    @l_status = MtaInfo.get_current_l_train_status
  end

  def self.get_current_l_train_status
    begin
      puts "fetching..."
      @service = Nokogiri::XML.parse(open("http://web.mta.info/status/serviceStatus.txt/"))

    rescue OpenURI::HTTPError
      @service = 404
    end
    if @service != 404
      @l_status = @service.xpath("//status")[7].text.include?("GOOD SERVICE") ? "The L is running well!" : "The L is all messed up!"
    else
      @l_status = 'There is something up with the MTA API!'
      puts @service
    end
  end
end
