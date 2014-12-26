# encoding: utf-8
class ConfigrationsController < ApplicationController
	before_filter :authenticate_user!
	
	def update
	       logger.info params[:configration]
	       @configration = Configration.find(params[:id])
	       if @configration.update_attributes(params[:configration])
	       	render json: {success: true}.merge(params[:configration]) and return
	       end
		render json: {success: false}
	end

end
