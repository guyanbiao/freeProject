# == Schema Information
#
# Table name: contents # 信息
#
#  id           :integer          not null, primary key
#  demo_id      :integer          default(0), not null                         # 活动id
#  published_at :datetime         default(2014-12-27 00:13:41 +0800), not null # 发送时间
#  sender_id    :string(255)      default(""), not null                        # 发送者id/对应微信中的FromUserName
#  content      :string(255)      not null                                     # 消息內容
#  from         :string(255)      default("web"), not null                     # 信息来源
#  is_read      :boolean          default(FALSE), not null                     # 是否已读
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ContentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
