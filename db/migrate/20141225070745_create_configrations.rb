# encoding: utf-8
class CreateConfigrations < ActiveRecord::Migration
  def change
    create_table :configrations, :comment => "弹幕活动的配置" do |t|
      t.integer :demo_id, :null => false, :default => 0, :comment => '活动id'
      t.integer :font_size, :null => false, :default => 20, :comment => '弹幕字体大小'
      t.integer :speed, :null => false, :default => 3, :comment => '弹幕滚动速度'
      t.integer :rate, :null => false, :default => 0, :comment => '弹幕频率'
      t.integer :model, :null => false, :default => 1, :comment => '弹幕模式'
      t.boolean :show_user_name, :null => false, :default => false, :comment => '是否显示用户名'
      t.boolean :show_user_avatar, :null => false, :default => false, :comment => '是否显示用户头像'
      t.integer :check_model, :null => false, :default => 1, :comment => '审核模式'

      t.timestamps
    end
  end
end
