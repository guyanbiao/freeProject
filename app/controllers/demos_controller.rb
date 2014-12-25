# encoding: utf-8
class DemosController < ApplicationController
	before_filter :authenticate_user!
	def new
		@demos = Demo.new
	end

	def index
		
	end
	
end
