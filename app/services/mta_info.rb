require 'nokogiri'
require 'open-uri'

class MtaInfo
  attr_reader :l_status,:l_message

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
        @l_service = @service.at('name:contains("L")').parent
        @l_status = @l_service.at('status').text
        @l_text = @l_service.at('text').text

        p @l_text unless @l_text === ""
        p @l_status
    else
      p @service
      @l_status = 'There is something up with the MTA API!'
    end
  end
end
