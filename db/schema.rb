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

ActiveRecord::Schema.define(:version => 20141223081443) do

  create_table "demos", :force => true, :comment => "活动" do |t|
    t.string   "name",                   :default => "",                    :null => false, :comment => "活动名称"
    t.string   "token",                  :default => "",                    :null => false, :comment => "活动唯一标识"
    t.string   "two_dimension_code_url", :default => "",                    :null => false, :comment => "二维码网络地址"
    t.datetime "published_at",           :default => '2014-12-23 08:36:27',                 :comment => "活动发布时间"
    t.datetime "started_at",             :default => '2014-12-23 08:36:27',                 :comment => "活动开始时间"
    t.integer  "duration",               :default => 0,                                     :comment => "活动时间"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
  end

end
