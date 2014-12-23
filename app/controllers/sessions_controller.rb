# encoding: utf-8
class SessionsController < ApplicationController
	def new
		@session = Session.new
	end
   
   def create
   		@user =	User.authenticate(params[:user_name], params[:password])
   		if @user.present?
   			logger.info @user.inspect
   			logger.info request.ip
   			@session = Session.new user_id: @user.id, ip_addr: request.ip
   			# @session.last_login_ip_addr = @session.ip_addr unless @session.last_login_ip_addr == @session.ip_addr
   			@session.save
   			if @session.errors.empty?
   				session[:current_user] = @session.user_id
   				render json: {success: true}
   			else
   				render json: {success: false}
   			end
   			
   		else
   			render json: params
   		end
   		
   end
end
