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

ActiveRecord::Schema.define(:version => 20130816175552) do

  create_table "source_stops", :id => false, :force => true do |t|
    t.integer  "source_id",                                                           :null => false
    t.string   "external_stop_id",                                                    :null => false
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
    t.decimal  "external_lat",                          :precision => 9, :scale => 6
    t.decimal  "external_lon",                          :precision => 9, :scale => 6
    t.string   "external_stop_name"
    t.string   "external_stop_desc"
    t.string   "external_zone_id",       :limit => 100
    t.string   "external_stop_url"
    t.string   "external_stop_street"
    t.string   "external_stop_city"
    t.string   "external_stop_region"
    t.string   "external_stop_postcode", :limit => 50
    t.string   "external_stop_country",  :limit => 100
    t.integer  "stop_id"
  end

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "realtime_url"
  end

  create_table "spatial_ref_sys", :id => false, :force => true do |t|
    t.integer "srid",                      :null => false
    t.string  "auth_name", :limit => 256
    t.integer "auth_srid"
    t.string  "srtext",    :limit => 2048
    t.string  "proj4text", :limit => 2048
  end

# Could not dump table "stops" because of following StandardError
#   Unknown type 'geometry' for column 'geo_point'

end
