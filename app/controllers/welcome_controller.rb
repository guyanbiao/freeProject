# encoding: utf-8
class WelcomeController < ApplicationController
	before_filter :authenticate_user!
	def index
		puts @current_user
	end

end