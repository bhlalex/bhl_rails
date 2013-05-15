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

ActiveRecord::Schema.define(:version => 20130515143759) do

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.integer  "book_count", :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "books", :force => true do |t|
    t.integer  "bibid"
    t.string   "title"
    t.string   "title_alternative"
    t.datetime "start_date"
    t.datetime "end_date"
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
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "books", ["language_id"], :name => "index_books_on_language_id"

  create_table "books_authors", :id => false, :force => true do |t|
    t.integer "book_id"
    t.integer "author_id"
  end

  add_index "books_authors", ["author_id"], :name => "index_books_authors_on_author_id"
  add_index "books_authors", ["book_id"], :name => "index_books_authors_on_book_id"

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

  create_table "subject_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
