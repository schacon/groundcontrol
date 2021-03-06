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

ActiveRecord::Schema.define(:version => 20080819160004) do

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
    t.integer  "host_id",                    :limit => 11
    t.integer  "passed",                     :limit => 11
    t.integer  "failed",                     :limit => 11
    t.integer  "users",                      :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "exercise_type",              :limit => 30
    t.string   "aut_version",                :limit => 50
    t.text     "aut_note"
    t.integer  "num_concurrent_connections", :limit => 11
    t.integer  "num_hits_per_page",          :limit => 11
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

  create_table "hosts_stacks", :id => false, :force => true do |t|
    t.integer "stack_id", :limit => 11, :default => 0, :null => false
    t.integer "host_id",  :limit => 11, :default => 0, :null => false
  end

  add_index "hosts_stacks", ["stack_id", "host_id"], :name => "index_hosts_stacks_on_stack_id_and_host_id", :unique => true

  create_table "pages", :force => true do |t|
    t.string  "uri_pattern"
    t.integer "role_id",     :limit => 11
    t.integer "position",    :limit => 11
    t.string  "assertions"
    t.string  "variables"
    t.string  "section"
    t.text    "post_data"
  end

  add_index "pages", ["role_id"], :name => "index_pages_on_role_id"

  create_table "roles", :force => true do |t|
    t.string "role"
  end

  create_table "samples", :force => true do |t|
    t.integer  "exercise_id",    :limit => 11
    t.integer  "page_id",        :limit => 11
    t.boolean  "passed"
    t.integer  "user",           :limit => 11
    t.integer  "response",       :limit => 11
    t.float    "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "page_data"
    t.integer  "page_size",      :limit => 11
    t.float    "changed_memory"
    t.string   "page_uri"
    t.float    "total_memory"
  end

  add_index "samples", ["exercise_id", "page_id"], :name => "index_samples_on_excercise_id_and_page_id"

  create_table "stacks", :force => true do |t|
    t.string   "name",       :limit => 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
