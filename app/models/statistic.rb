# encoding: utf-8
# == Schema Information
#
# Table name: statistics # 统计
#
#  id         :integer          not null, primary key
#  source_id  :integer          not null              # 资源id
#  point      :datetime         not null              # 统计时间
#  count      :integer          default(0), not null  # 数量
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Statistic < ActiveRecord::Base
  attr_accessible :count, :point, :source_id
end
