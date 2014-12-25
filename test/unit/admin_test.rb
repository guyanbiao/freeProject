# == Schema Information
#
# Table name: admins # 管理员用户
#
#  id                 :integer          not null, primary key
#  name               :string(255)      default(""), not null # 用户名
#  email              :string(255)      default(""), not null # 电子邮件
#  encrypted_password :string(255)      default(""), not null # 密码
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end