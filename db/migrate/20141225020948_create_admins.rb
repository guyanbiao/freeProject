# encoding: utf-8
class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins, :comment => '管理员用户' do |t|
    	t.string :name, :null => false, :default => '', :comment => '用户名'
      t.string :email, :null => false, :default => '', :comment => '电子邮件'
      t.string :encrypted_password,:null => false, :default => '', :comment => '密码'
      
      t.timestamps
    end
  end
end
