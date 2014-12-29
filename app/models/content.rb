# encoding: utf-8
# == Schema Information
#
# Table name: contents # 信息
#
#  id           :integer          not null, primary key
#  demo_id      :integer          default(0), not null                         # 活动id
#  published_at :datetime         default(2014-12-28 17:24:50 +0800), not null # 发送时间
#  sender_id    :string(255)      default(""), not null                        # 发送者id/对应微信中的FromUserName
#  content      :string(255)      not null                                     # 消息內容
#  from         :string(255)      default("web"), not null                     # 信息来源
#  is_read      :boolean          default(FALSE), not null                     # 是否已读
#  moved        :boolean          default(FALSE), not null                     # 显示
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Content < ActiveRecord::Base
  attr_accessible :content, :demo_id, :from, :published_at, :sender_id, :is_read, :moved
  belongs_to :demo
  scope :un_read, -> {where(is_read: false)}
  scope :read, -> {where(is_read: true)}
  scope :un_moved, -> {where(moved: false)}
  scope :moved, -> {where(moved: true)}
  
  def read_once
  	update_attribute(:is_read, true)
  end

  def published_at=(time)
  		write_attribute(:published_at, self.created_at) unless published_at.present?
  end

end
