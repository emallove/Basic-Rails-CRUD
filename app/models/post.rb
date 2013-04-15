class Post < ActiveRecord::Base

  # Counter-intutive that this line would prevent the saving of
  # Post attributes
  # attr_accessor :artist, :song, :body, :album, :artist, :release_date, :notes, :radio_station, :dj_name, :spun_at, :radio_station_url, :music_director, :created_at, :updated_at

  # def new
  #   @artist = "foo"
  # end

end
