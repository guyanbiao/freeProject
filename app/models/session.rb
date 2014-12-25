# == Schema Information
#
# Table name: sessions # 登陆
#
#  id                 :integer          not null, primary key
#  user_id            :string(255)      default(""), not null                        # 用户id
#  ip_addr            :string(255)      default(""), not null                        # 登陆ip地址
#  last_login_ip_addr :string(255)      default(""), not null                        # 上一次登陆的ip地址
#  login_time         :datetime         default(2014-12-24 01:49:42 +0800), not null # 登陆时间
#  last_login_time    :datetime         default(2014-12-24 01:49:42 +0800), not null # 上一次登陆时间
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Session < ActiveRecord::Base
  	attr_accessible :title, :body, :user_id, :ip_addr, :last_login_ip_addr, :login_time, :last_login_time
end
