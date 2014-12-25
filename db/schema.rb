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

ActiveRecord::Schema.define(:version => 20141225070745) do

  create_table "admins", :force => true, :comment => "管理员用户" do |t|
    t.string   "name",               :default => "", :null => false, :comment => "用户名"
    t.string   "email",              :default => "", :null => false, :comment => "电子邮件"
    t.string   "encrypted_password", :default => "", :null => false, :comment => "密码"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "configrations", :force => true, :comment => "弹幕活动的配置" do |t|
    t.integer  "demo_id",          :default => 0,     :null => false, :comment => "活动id"
    t.integer  "font_size",        :default => 20,    :null => false, :comment => "弹幕字体大小"
    t.integer  "speed",            :default => 3,     :null => false, :comment => "弹幕滚动速度"
    t.integer  "rate",             :default => 0,     :null => false, :comment => "弹幕频率"
    t.integer  "model",            :default => 1,     :null => false, :comment => "弹幕模式"
    t.boolean  "show_user_name",   :default => false, :null => false, :comment => "是否显示用户名"
    t.boolean  "show_user_avatar", :default => false, :null => false, :comment => "是否显示用户头像"
    t.integer  "check_model",      :default => 1,     :null => false, :comment => "审核模式"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "contents", :force => true, :comment => "微信" do |t|
    t.integer  "demo_id",      :default => 0,                     :null => false, :comment => "活动id"
    t.datetime "published_at", :default => '2014-12-25 09:34:28', :null => false, :comment => "发送时间"
    t.string   "sender_id",    :default => "0",                   :null => false, :comment => "发送者id"
    t.string   "content",                                         :null => false, :comment => "消息內容"
    t.string   "from",         :default => "web",                 :null => false, :comment => "信息来源"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "demos", :force => true, :comment => "活动" do |t|
    t.string   "name",                   :default => "",                    :null => false, :comment => "活动名称"
    t.string   "token",                  :default => "",                    :null => false, :comment => "活动唯一标识"
    t.string   "two_dimension_code_url", :default => "",                    :null => false, :comment => "二维码网络地址"
    t.datetime "published_at",           :default => '2014-12-25 09:34:27',                 :comment => "活动发布时间"
    t.datetime "started_at",             :default => '2014-12-25 09:34:27',                 :comment => "活动开始时间"
    t.integer  "duration",               :default => 0,                                     :comment => "活动时间"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
  end

  create_table "statistics", :force => true, :comment => "统计" do |t|
    t.integer  "source_id",                 :null => false, :comment => "资源id"
    t.datetime "point",                     :null => false, :comment => "统计时间"
    t.integer  "count",      :default => 0, :null => false, :comment => "数量"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "users", :force => true, :comment => "用户Model" do |t|
    t.string   "name",                   :default => "", :null => false, :comment => "用户名"
    t.string   "password",               :default => "", :null => false, :comment => "密码"
    t.string   "password_confirmation",  :default => "", :null => false, :comment => "确认密码"
    t.string   "email",                  :default => "", :null => false, :comment => "电子邮件"
    t.integer  "status",                 :default => 0,  :null => false, :comment => "用户状态"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
