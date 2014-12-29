# encoding: utf-8
class ContentsController < ApplicationController
		before_filter :authenticate_user!
		def update
			return unless params[:demo_id].present? && params[:id].present?
			@demo = current_user.demos.find(params[:demo_id])
			@content = @demo.contents.find(params[:id])
			render json: {success: 	@content.read_once}
		end

		def destroy
			@demo = current_user.demos.find(params[:demo_id])
			@content = @demo.contents.where(id: params[:id]).first
			render json: {success: @content.update_attribute(:status, -1)} and return if @content.present?
			render json: {success: false}
		end

end
