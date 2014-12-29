# encoding: utf-8
class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	 change_table(:users) do |t|
  		 t.string :token, :null => false, :default => '', :comment => '系统用户唯一标识'
  	end
  end
end
