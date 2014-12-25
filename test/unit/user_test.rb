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
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
