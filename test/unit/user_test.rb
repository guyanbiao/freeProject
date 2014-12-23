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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
