# encoding: utf-8
class ContentsController < ApplicationController
		before_filter :authenticate_user!
		def update
			return unless params[:demo_id].present? && params[:id].present?
			@demos = current_user.demos.find(params[:demo_id])
			@content = @demos.contents.find(params[:id])
			render json: {success: 	@content.read_once}
		end
end
