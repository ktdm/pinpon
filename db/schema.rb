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

ActiveRecord::Schema.define(:version => 1) do

  create_table "equivalences", :force => true do |t|
    t.integer  "source_word_id"
    t.integer  "target_word_id"
    t.integer  "upvotes",        :default => 0
    t.integer  "downvotes",      :default => 0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "explanations", :force => true do |t|
    t.integer  "equivalence_id"
    t.text     "body"
    t.text     "example",                       :null => false
    t.integer  "upvotes",        :default => 0
    t.integer  "downvotes",      :default => 0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "explanations", ["equivalence_id"], :name => "index_explanations_on_equivalence_id"

  create_table "languages", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "relations", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "suggestions", :force => true do |t|
    t.integer  "apropos_of_id"
    t.integer  "suggested_word_id"
    t.string   "relation",                         :null => false
    t.integer  "upvotes",           :default => 0
    t.integer  "downvotes",         :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "suggestions", ["apropos_of_id"], :name => "index_suggestions_on_apropos_of_id"

  create_table "words", :force => true do |t|
    t.string   "value",                     :null => false
    t.string   "language",                  :null => false
    t.integer  "upvotes",    :default => 0
    t.integer  "downvotes",  :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "words", ["value", "language"], :name => "index_words_on_value_and_language", :unique => true

end
