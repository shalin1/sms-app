require 'nokogiri'
require 'open-uri'

class MtaInfo
  attr_reader :l_status

  def initialize
    @l_status = MtaInfo.get_current_l_train_status
  end

  def self.get_current_l_train_status
    begin
      puts "fetching L train status at #{Time.now.getlocal('-04:00')}"
      @service = Nokogiri::XML.parse(open("http://web.mta.info/status/serviceStatus.txt"))

    rescue OpenURI::HTTPError
      @service = 404
    end
    if @service != 404
        @l_status = @service.xpath("//status")[7].text
        p @l_status
    else
      p @service
      @l_status = 'There is something up with the MTA API!'
    end
  end
end
