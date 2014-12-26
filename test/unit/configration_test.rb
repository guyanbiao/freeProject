# == Schema Information
#
# Table name: configrations # 弹幕活动的配置
#
#  id               :integer          not null, primary key
#  demo_id          :integer          default(0), not null     # 活动id
#  font_size        :integer          default(20), not null    # 弹幕字体大小
#  speed            :integer          default(3), not null     # 弹幕滚动速度
#  rate             :integer          default(0), not null     # 弹幕频率
#  model            :integer          default(1), not null     # 弹幕模式
#  show_user_name   :boolean          default(FALSE), not null # 是否显示用户名
#  show_user_avatar :boolean          default(FALSE), not null # 是否显示用户头像
#  check_model      :integer          default(1), not null     # 审核模式
#  status           :integer          default(0), not null     # 状态
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class ConfigrationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end