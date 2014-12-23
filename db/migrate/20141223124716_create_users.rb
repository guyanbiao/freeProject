# encoding: utf-8
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, :comment => '用户Model' do |t|
      t.string :name, :null => false, :default => '', :comment => '用户名'
      t.string :password, :null => false, :default => '', :comment => '密码'
      # t.string :salt, :null => false, :default => '', :comment => '密码'
      t.string :email, :null => false, :default => '', :comment => '电子邮件'
      t.integer :status, :null => false, :default => 0 , :comment => '用户状态'
      t.boolean :dynamic, :null => false, :default => false, :comment => '是否允许多处登陆'

      t.timestamps
    end
  end
end
