require "nokogiri"
require "open-uri"

class HomeController < ApplicationController
  def index
    @status = MtaInfo.new.l_status
  end
end
