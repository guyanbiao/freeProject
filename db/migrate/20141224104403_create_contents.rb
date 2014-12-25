# encoding: utf-8
class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents, :comment => '微信' do |t|
    	t.integer :demo_id, :null => false, :default =>0 , :comment => "活动id"
      t.datetime :published_at, :null => false, :default =>Time.now , :comment => "发送时间"
      t.string :sender_id, :content, :null => false, :default => 0, :comment => "发送者id"
      t.text :content, :null => false, :comment => "消息內容"
      t.string :from, :null => false, :default =>'web', :comment => "信息来源"
       
      t.timestamps
    end
  end
end
