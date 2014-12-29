# encoding: utf-8
# == Schema Information
#
# Table name: users # 用户Model
#
#  id                     :integer          not null, primary key
#  name                   :string(255)      default(""), not null # 用户名
#  password               :string(255)      default(""), not null # 密码
#  password_confirmation  :string(255)      default(""), not null # 确认密码
#  email                  :string(255)      default(""), not null # 电子邮件
#  status                 :integer          default(0), not null  # 用户状态
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  token                  :string(255)      default(""), not null # 系统用户唯一标识
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :status
  has_many :demos
  default_value_for :token , :allows_nil => false do |variable|
 	UUID.new.generate
  end	

  def email=(email)
    write_attribute(:email, email || "#{UUID.new.generate}@")
  end
  #同步数据
  def synchronization(user_token)
  	@user = User.where(token: user_token).first
  	@user.demos.each do |demo|

  	end if @user.present?
  end
end
