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

ActiveRecord::Schema.define(:version => 20141223144514) do

  create_table "demos", :force => true, :comment => "活动" do |t|
    t.string   "name",                   :default => "",                    :null => false, :comment => "活动名称"
    t.string   "token",                  :default => "",                    :null => false, :comment => "活动唯一标识"
    t.string   "two_dimension_code_url", :default => "",                    :null => false, :comment => "二维码网络地址"
    t.datetime "published_at",           :default => '2014-12-24 06:51:15',                 :comment => "活动发布时间"
    t.datetime "started_at",             :default => '2014-12-24 06:51:15',                 :comment => "活动开始时间"
    t.integer  "duration",               :default => 0,                                     :comment => "活动时间"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
  end

  create_table "sessions", :force => true, :comment => "登陆" do |t|
    t.string   "user_id",            :default => "",                    :null => false, :comment => "用户id"
    t.string   "ip_addr",            :default => "",                    :null => false, :comment => "登陆ip地址"
    t.string   "last_login_ip_addr", :default => "",                    :null => false, :comment => "上一次登陆的ip地址"
    t.datetime "login_time",         :default => '2014-12-24 06:51:16', :null => false, :comment => "登陆时间"
    t.datetime "last_login_time",    :default => '2014-12-24 06:51:16', :null => false, :comment => "上一次登陆时间"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  create_table "users", :force => true, :comment => "用户Model" do |t|
    t.string   "name",       :default => "",    :null => false, :comment => "用户名"
    t.string   "password",   :default => "",    :null => false, :comment => "密码"
    t.string   "email",      :default => "",    :null => false, :comment => "电子邮件"
    t.integer  "status",     :default => 0,     :null => false, :comment => "用户状态"
    t.boolean  "dynamic",    :default => false, :null => false, :comment => "是否允许多处登陆"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

end
