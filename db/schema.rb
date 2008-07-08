# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080708165855) do

  create_table "bj_config", :primary_key => "bj_config_id", :force => true do |t|
    t.text "hostname"
    t.text "key"
    t.text "value"
    t.text "cast"
  end

  create_table "bj_job", :primary_key => "bj_job_id", :force => true do |t|
    t.text     "command"
    t.text     "state"
    t.integer  "priority",       :limit => 11
    t.text     "tag"
    t.integer  "is_restartable", :limit => 11
    t.text     "submitter"
    t.text     "runner"
    t.integer  "pid",            :limit => 11
    t.datetime "submitted_at"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.text     "env"
    t.text     "stdin"
    t.text     "stdout"
    t.text     "stderr"
    t.integer  "exit_status",    :limit => 11
  end

  create_table "bj_job_archive", :primary_key => "bj_job_archive_id", :force => true do |t|
    t.text     "command"
    t.text     "state"
    t.integer  "priority",       :limit => 11
    t.text     "tag"
    t.integer  "is_restartable", :limit => 11
    t.text     "submitter"
    t.text     "runner"
    t.integer  "pid",            :limit => 11
    t.datetime "submitted_at"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "archived_at"
    t.text     "env"
    t.text     "stdin"
    t.text     "stdout"
    t.text     "stderr"
    t.integer  "exit_status",    :limit => 11
  end

  create_table "exercises", :force => true do |t|
    t.integer  "host_id",    :limit => 11
    t.integer  "passed",     :limit => 11
    t.integer  "failed",     :limit => 11
    t.integer  "users",      :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exercises", ["host_id"], :name => "index_excercises_on_host_id"

  create_table "hosts", :force => true do |t|
    t.string  "hostname"
    t.string  "url"
    t.integer "role_id",      :limit => 11
    t.string  "url_username"
    t.string  "url_password"
    t.string  "ssh_username"
    t.string  "ssh_password"
  end

  create_table "pages", :force => true do |t|
    t.string  "uri_pattern"
    t.integer "role_id",     :limit => 11
    t.integer "order",       :limit => 11
    t.string  "assertions"
    t.string  "variables"
    t.string  "section"
    t.string  "uri_actual"
  end

  add_index "pages", ["role_id"], :name => "index_pages_on_role_id"

  create_table "roles", :force => true do |t|
    t.string "role"
  end

  create_table "samples", :force => true do |t|
    t.integer  "exercise_id", :limit => 11
    t.integer  "page_id",     :limit => 11
    t.boolean  "passed"
    t.integer  "user",        :limit => 11
    t.integer  "response",    :limit => 11
    t.float    "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "page_data"
    t.integer  "page_size",   :limit => 11
    t.float    "memory"
  end

  add_index "samples", ["exercise_id", "page_id"], :name => "index_samples_on_excercise_id_and_page_id"

end
