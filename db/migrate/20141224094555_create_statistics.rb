# encoding: utf-8
class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics, :comment => '统计' do |t|
      t.integer :source_id, :null => false, :comment => '资源id'
      #t.string :type, :null => false, :comment => '资源类型'
      t.datetime :point, :null => false, :comment => '统计时间'
      t.integer :count, :null => false, :default => 0, :comment => '数量'
      
      t.timestamps
    end
  end
end
