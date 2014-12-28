# == Schema Information
#
# Table name: configrations # 弹幕活动的配置
#
#  id               :integer          not null, primary key
#  demo_id          :integer          default(0), not null     # 活动id
#  font_size        :integer          default(20), not null    # 弹幕字体大小
#  speed            :integer          default(3), not null     # 弹幕滚动速度
#  rate             :integer          default(1), not null     # 弹幕频率
#  model            :integer          default(1), not null     # 弹幕模式
#  show_user_name   :boolean          default(FALSE), not null # 是否显示用户名
#  show_user_avatar :boolean          default(FALSE), not null # 是否显示用户头像
#  check_model      :integer          default(1), not null     # 审核模式
#  is_started       :boolean          default(FALSE), not null # 是否开始弹幕
#  is_stop          :boolean          default(FALSE), not null # 是否暂停弹幕
#  status           :integer          default(0), not null     # 状态
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

## encoding: utf-8
class Configration < ActiveRecord::Base
  attr_accessible :font_size, :model, :rate, :show_user_avatar, :show_user_name, :speed, :demo_id , :check_model, :status, :is_started, :is_stop
  MODEL = {1 => '顶部显示', 2 => '上部显示', 3 => '下部显示', 4 => '底部显示'}
  STATUS = {-1 => '屏蔽', 1 => '结束', 2 => '开始', 3 => '暂停', 4 => '继续'}
  validates :demo_id, :presence => true
  belongs_to :demo
  # validates :status, inclusion: { in: STATUS.keys }
  # default_value_for :font_size, 20
  # default_value_for :speed, 3
  # default_value_for :rate, 3
  # default_value_for :model, 1
  # default_value_for :show_user_name, false
  # default_value_for :show_user_avatar, false
  # default_value_for :check_model,1
  
end
