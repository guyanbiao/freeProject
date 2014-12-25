# encoding: utf-8
class DemosController < ApplicationController
	before_filter :authenticate_user!

	def index
		@demos = Demo.order('created_at').page(params[:page])
	end

	def new
		@demo = Demo.new
	end

	def create
		logger.info demo_params
		@demo = Demo.new demo_params
		if @demo.save && @demo.errors.empty?
			redirect_to demos_path
		else
			render json:{success:fail}
		end		
	end

	def show 
		@demo = Demo.find(params[:id])
	end	
	private
	def demo_params
		params[:demo]
	end
end
