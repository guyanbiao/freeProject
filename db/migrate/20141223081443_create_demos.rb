# encoding: utf-8
class CreateDemos < ActiveRecord::Migration
  def change
    create_table :demos, :comment=>"活动" do |t|
      t.integer :user_id, :default => 0, :null => false, :comment => '活动的所有者id'
      t.string :name, :default => '', :null => false, :comment => "活动名称"
      t.string :token, :default => '', :null => false, :comment => "活动唯一标识"
      t.string :two_dimension_code_url , :default => '', :null => false, :comment => "二维码网络地址"
      t.datetime :published_at, :default => Time.now , :comment => "活动发布时间"
      t.datetime :started_at, :default => Time.now, :comment => "活动开始时间"
      t.integer :duration, :default => 0, :comment => "活动时间"
      t.text :description , :comment => "活动描述"
      
      t.timestamps
    end
  end
end
