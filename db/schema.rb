# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120203160956) do

  # For now we are leaving the "posts" table as is, though
  # this table will eventually be renamed to "spins" or something
  # more sensible
 
  drop_table "posts"
  create_table "posts", :force => true do |t|

    # Track attributes
    # (We could get carried away with these: http://en.wikipedia.org/wiki/ID3)
    t.text "track_name"
    t.text "track_album"
    t.text "track_artist"
    t.text "track_notes"
    t.datetime "track_release_date"
    t.datetime "track_record_label"

    # Spin attributes
    t.text "spin_dj_name"
    t.text "spin_source_url"
    t.datetime "spin_datetime"

    # Radio station attributes
    t.text "radio_station_name"
    t.text "radio_station_url"
    t.text "radio_station_music_director"
    t.text "radio_station_call_letters"

    # Enum - { college, commercial, public, private }
    t.text "radio_station_format"
    t.text "radio_station_frequency"
    t.text "radio_station_format"
    t.text "radio_station_geographic_location"

    # DJ attributes
    t.text "dj_name"
    t.text "dj_contact_info"

    # Radio show attributes
    t.text "radio_show_name"
    t.text "radio_schedule"

    # Active record attributes
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
