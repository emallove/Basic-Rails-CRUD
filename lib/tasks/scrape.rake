require 'rubygems'  
require 'nokogiri'  
require 'open-uri'  

namespace :screen do
  desc "screen scrape at walmart"
  task :scrape_batman do
    url = "http://www.walmart.com/search/search-ng.do?search_constraint=0&ic=48_0&search_query=Batman&Find.x=0&Find.y=0&Find=Find"  
    doc = Nokogiri::HTML(open(url))  
    doc.css(".item").each do |item|  
        puts item.at_css(".prodLink").text  
    end  
  end  

  task :scrape_wmbr_playlist do
    url = "http://www.track-blaster.com/wmbr/playlist.php?id=13253"  
    doc = Nokogiri::HTML(open(url))

    doc.xpath('//div[@class="dataRowTime"]')

    # doc.css(".item").each do |item|  
    #     puts item.at_css(".prodLink").text  
    # end  
  end  
end  


