# encoding: utf-8
# == Schema Information
#
# Table name: demos # 活动
#
#  id                     :integer          not null, primary key
#  name                   :string(255)      default(""), not null            # 活动名称
#  token                  :string(255)      default(""), not null            # 活动唯一标识
#  two_dimension_code_url :string(255)      default(""), not null            # 二维码网络地址
#  published_at           :datetime         default(2014-12-23 08:36:27 UTC) # 活动发布时间
#  started_at             :datetime         default(2014-12-23 08:36:27 UTC) # 活动开始时间
#  duration               :integer          default(0)                       # 活动时间
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Demo < ActiveRecord::Base
	attr_accessible :name, :published_at, :two_dimension_code_url, :started_at, :duration, :token
	validates :token, uniqueness: {
		message: "活动已存在"
	}
	validates :name, :presence => {
		message: "请输入活动用户名"
	}
	after_create :published

 	default_value_for :token , :allows_nil => false do |variable|
 		UUID.new.generate
 	end	

	private
	def published
		write_attribute(:published_at, self.created_at)
	end
end
