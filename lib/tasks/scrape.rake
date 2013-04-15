require 'rubygems'  
require 'nokogiri'  
require 'open-uri'  

require 'config/environment'
 
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

    # PERFORMANCE HIT - maybe don't read in the entire string into memory?
    doc = Nokogiri::HTML(open(url))

    # x.xpath('//div[@class="dataRowBand"]')[4].text
    rows = doc.xpath('//div[contains(@class, "song_in_set")]')

    rows.each do |b| 
      _split_text = b.text.split(/(?:\t|\n)+/) 

      # ["",
      # "9:42",
      # "Daft Punk",
      # "Television Rules the Nation",
      # "Human After All",
      # "(Virgin, 2006)"]

      # spin = Post.new artist: _split_text[2]
      spin = Post.new

      spin.spin_datetime = _split_text[1]
      spin.track_artist = _split_text[2]
      spin.track_name = _split_text[3]
      spin.track_album = _split_text[4]
      spin.spin_source_url = url
      # spin.comment = _split_text[5]

      # PERFORMANCE HIT - do multiple inserts at a time.  Waaay faster.
      spin.save!

      # EAM - DEBUGGING
      # ap spin
      # break

    end

    # parse_table_nokogiri(doc)
    # parse_table_nokogiri(Nokogiri::HTML(open(url)))

    # doc.xpath('//div[@class="dataRowTime"]')

    # doc.css(".item").each do |item|  
    #     puts item.at_css(".prodLink").text  
    # end  
  end  
end  


def parse_table_nokogiri(html)

    doc = Nokogiri::HTML(html)
    table = doc.xpath('//div').max_by {|table| table.xpath('.//div').length}

    rows = table.search('div')[1..-1]
    rows.each do |row|

        cells = row.search('div//text()').collect {|text| CGI.unescapeHTML(text.to_s.strip)}
        cells.each do |col|

            puts col
            puts "_____________"

        end
    end
end
