# encoding: utf-8
# == Schema Information
#
# Table name: contents # 微信
#
#  id           :integer          not null, primary key
#  demo_id      :integer          default(0), not null                         # 活动id
#  published_at :datetime         default(2014-12-25 09:34:28 +0800), not null # 发送时间
#  sender_id    :string(255)      default("0"), not null                       # 发送者id
#  content      :string(255)      not null                                     # 消息內容
#  from         :string(255)      default("web"), not null                     # 信息来源
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Content < ActiveRecord::Base
  attr_accessible :content, :demo_id, :from, :published_at, :sender_id
  belongs_to :demo
end
