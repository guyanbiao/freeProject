# encoding: utf-8
module Authenticate
	def self.included(base)
		base.extend ClassMethods
	end

	module ClassMethods
		def authenticate(name, password)
				return unless name.present? && password.present?
				begin
					@user = User.where(name: name).first
				rescue Exception => e
					Rails.logger.info '没有找到用户name = #{name}'
				end
				return @user if BCrypt::Password.new(@user.try(:password))  == password
  		end	
	end
end