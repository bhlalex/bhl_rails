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

ActiveRecord::Schema.define(:version => 20130526105036) do

  create_table "annotations", :force => true do |t|
    t.integer  "volume_id"
    t.integer  "page_id"
    t.string   "string"
    t.integer  "location_x"
    t.integer  "location_y"
    t.integer  "height"
    t.integer  "width"
    t.integer  "zorder"
    t.integer  "hltype"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "annotations", ["page_id"], :name => "index_annotations_on_page_id"
  add_index "annotations", ["volume_id"], :name => "index_annotations_on_volume_id"

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.integer  "book_count", :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "book_authors", :id => false, :force => true do |t|
    t.integer "book_id"
    t.integer "author_id"
    t.boolean "is_alternative"
  end

  add_index "book_authors", ["author_id"], :name => "index_book_authors_on_author_id"
  add_index "book_authors", ["book_id"], :name => "index_book_authors_on_book_id"

  create_table "book_subjects", :id => false, :force => true do |t|
    t.integer  "book_id"
    t.integer  "subject_id"
    t.integer  "subject_type_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "book_subjects", ["book_id"], :name => "index_book_subjects_on_book_id"
  add_index "book_subjects", ["subject_id"], :name => "index_book_subjects_on_subject_id"
  add_index "book_subjects", ["subject_type_id"], :name => "index_book_subjects_on_subject_type_id"

  create_table "books", :force => true do |t|
    t.string   "bibid"
    t.string   "title"
    t.string   "title_alternative"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "publisher"
    t.integer  "language_id"
    t.text     "note"
    t.string   "edition"
    t.string   "format_extent"
    t.string   "collection"
    t.string   "contributor"
    t.integer  "fill_metadata_fail"
    t.integer  "metadata_index_status"
    t.integer  "generate_format_fail"
    t.text     "mods"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "books", ["language_id"], :name => "index_books_on_language_id"

  create_table "books_locations", :id => false, :force => true do |t|
    t.integer "book_id"
    t.integer "location_id"
  end

  add_index "books_locations", ["book_id"], :name => "index_books_locations_on_book_id"
  add_index "books_locations", ["location_id"], :name => "index_books_locations_on_location_id"

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "harvest_event_books", :force => true do |t|
    t.integer  "harvest_event_id"
    t.integer  "book_id"
    t.boolean  "success"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "harvest_event_books", ["book_id"], :name => "index_harvest_event_books_on_book_id"
  add_index "harvest_event_books", ["harvest_event_id"], :name => "index_harvest_event_books_on_harvest_event_id"

  create_table "harvest_event_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "harvest_events", :force => true do |t|
    t.integer  "harvest_event_type_id"
    t.string   "description"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "harvest_events", ["harvest_event_type_id"], :name => "index_harvest_events_on_harvest_event_type_id"

  create_table "languages", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "formatted_address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "country_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "locations", ["country_id"], :name => "index_locations_on_country_id"

  create_table "names", :force => true do |t|
    t.string   "string"
    t.integer  "eol_page_id"
    t.string   "eol_thumb"
    t.integer  "lookup_fail"
    t.integer  "name_bank_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "page_names", :id => false, :force => true do |t|
    t.integer  "page_id"
    t.integer  "name_id"
    t.string   "namestring"
    t.string   "name_found"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "page_names", ["name_id"], :name => "index_page_names_on_name_id"
  add_index "page_names", ["page_id"], :name => "index_page_names_on_page_id"

  create_table "pages", :force => true do |t|
    t.integer  "volume_id"
    t.integer  "page_number"
    t.boolean  "is_empty"
    t.integer  "fill_names_fail"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "pages", ["volume_id"], :name => "index_pages_on_volume_id"

  create_table "queries", :force => true do |t|
    t.string   "string"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "queries", ["user_id"], :name => "index_queries_on_user_id"

  create_table "subject_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.integer  "location_lookup_fail"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "subjects", ["location_id"], :name => "index_subjects_on_location_id"

  create_table "user_books", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_books", ["book_id"], :name => "index_user_books_on_book_id"
  add_index "user_books", ["user_id"], :name => "index_user_books_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username",                      :null => false
    t.string   "password",                      :null => false
    t.string   "real_name"
    t.string   "email",                         :null => false
    t.boolean  "active",     :default => false
    t.string   "guid",                          :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "users", ["guid"], :name => "index_users_on_guid"
  add_index "users", ["password"], :name => "index_users_on_password"
  add_index "users", ["username"], :name => "index_users_on_username"

  create_table "volumes", :force => true do |t|
    t.integer  "book_id"
    t.integer  "job_id"
    t.integer  "copyright"
    t.string   "name"
    t.integer  "volume_number"
    t.integer  "fill_content_fail"
    t.integer  "get_thumbnail_fail"
    t.integer  "content_index_status"
    t.integer  "generate_names_xml_fail"
    t.integer  "ubio_in_dar_fail"
    t.integer  "get_pages_names_fail"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "volumes", ["book_id"], :name => "index_volumes_on_book_id"

end
