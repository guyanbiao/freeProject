# encoding: utf-8
class DemosController < ApplicationController
	before_filter :authenticate_user!
	before_filter :demo_params, :only => [:create]
	before_filter :configration_params, :only => [:create]

	def index
		@demos = Demo.order('created_at').page(params[:page])
	end

	def new
		@demo = Demo.new
		@demo.configration = Configration.new
	end

	def create
		puts @p
		@demo = Demo.new @p
		if @demo.save && @demo.errors.empty?
			@demo.configration = Configration.create(@config)
			redirect_to demos_path
		else
			render json:{success:fail}
		end		
	end
# 显示活动的详细信息 
	def show 
		@demo = Demo.find(params[:id])
	end	
	
	def white
		@demo = Demo.find(params[:id])
		render layout: 'base'
	end

	def check
		@demo = Demo.find(params[:id])
		render layout: 'base'
	end

	def read
		@demo = Demo.find(params[:id])
		@contents = @demo.contents.read.order("published_at")
		render json: @contents
	end

	def unread
		@demo = Demo.find(params[:id])
		@contents = @demo.contents.un_read.order("published_at DESC")
		render json: @contents
	end

	private
	def demo_params
		@p = {
			name: params[:demo].delete('name'),
			started_at: params[:demo].delete('started_at')
			}
		@p
	end

	def configration_params
		@config = params[:demo]
	end

end
