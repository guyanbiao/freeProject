# encoding: utf-8
# == Schema Information
#
# Table name: users # 用户Model
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null    # 用户名
#  password   :string(255)      default(""), not null    # 密码
#  email      :string(255)      default(""), not null    # 电子邮件
#  status     :integer          default(0), not null     # 用户状态
#  dynamic    :boolean          default(FALSE), not null # 是否允许多处登陆
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
	include BCrypt
	include Authenticate
  attr_accessible :email, :name, :password, :status, :dynamic
  # ==================验证属性===========================
  validates :name, :password , :presence => {
  		message: '不能为空'
  }
  validates :name, :length => {
	  	minimum: 3,
	  	message: '用户名长度最小为%{count}个字符'
  }, :uniqueness => {
  		message: "该用户名已存在"
  }
  validates :password , :length => {
  		minimum: 6,
  		message: "密码长度最小为%{count}个字符"
  }
  validates :email, :uniqueness => true , :format => { 
  		with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
  		message: "电子邮件格式错误"
  		}, if: "email.present?"
  
  def password=(new_password)
  	@password = BCrypt::Password.create(new_password, :cost => 13)
  	write_attribute(:password, @password)	
  end
end
