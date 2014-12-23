# encoding: utf-8
class Api::BaseController < ApplicationController
	def index
		render text: "Api"
	end
end