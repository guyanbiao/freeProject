# encoding: utf-8
class DemosController < ApplicationController
	before_filter :authenticate_user!
	before_filter :demo_params, :only => [:create]
	before_filter :configration_params, :only => [:create]

	def index
		@demos = current_user.demos.order('created_at').page(params[:page])
	end

	def new
		@demo = Demo.new
		@demo.configration = Configration.new
	end

	def create
		puts @p
		@demo = current_user.demos.build @p
		if @demo.save && @demo.errors.empty?
			@demo.configration = Configration.create(@config)
			redirect_to demos_path
		else
			render json:{success:fail}
		end		
	end
# 显示活动的详细信息 
	def show 
		puts 
		@demo = current_user.demos.find(params[:id])
	end	
	
	def white
		@demo = current_user.demos.find(params[:id])
		render layout: 'base'
	end

	def check
		@demo = current_user.demos.find(params[:id])
		render layout: 'base'
	end

	def read
		@demo = current_user.demos.find(params[:id])
		@contents = @demo.contents.read.order("id,published_at").last(50)
		render json: @contents
	end

	def unread
		@demo = current_user.demos.find(params[:id])
		@contents = @demo.contents.un_read.order("id,published_at DESC").first(50)
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
