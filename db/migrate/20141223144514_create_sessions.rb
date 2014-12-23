# encoding: utf-8
class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions, :comment => "登陆" do |t|
      t.string :user_id, :null => false, :default => '', :comment => '用户id'
      t.string :ip_addr, :null => false, :default => '', :comment => '登陆ip地址'
      t.string :last_login_ip_addr, :null => false, :default => '' , :comment => '上一次登陆的ip地址'
      t.datetime :login_time, :null => false, :default => Time.now, :comment => '登陆时间'
      t.datetime :last_login_time, :null => false, :default => Time.now, :comment => '上一次登陆时间'
     
      t.timestamps
    end
  end
end
