class CheckUpdateStatus
  require "open-uri"

  TargetUri = "http://www.nttdocomo.co.jp/support/utilization/product_update/list/index.html?s=date"

  def initialize
    @page = Nokogiri::HTML(open(TargetUri).read)
    @update_contents = @page.css(".section table").first.css("tr").map{|tr| tr.css("td").map(&:text)}
  end

  def check!
    keys = [:update_start_at, :device_name, :update_method, :update_deadline_at, :note]
    @update_contents.each do |content|
      ary = *[keys, content].transpose
      info = Hash[*ary.flatten]

      if UpdateInfo.where(device_name: info[:device_name]).empty?
        puts "Please!! Update this device. #{info[:device_name]}"
      end
    end
  end

end

CheckUpdateStatus.new.check!
