#encoding: utf-8
class Api::DemosController < Api::BaseController
	def create
		@demo =  Demo.new demo_params
		if @demo.save
			render json: {success:true, url: "/demos/#{@demo.id}/two_dimension_code"}
		else
			render json: @demo.errors
		end
	end

	def show
		@demo = Demo.find(params[:id])
		render :json => @demo	
	end

	def  two_dimension_code
		@demo = Demo.find(params[:id])
		@qr = RQRCode::QRCode.new( @demo.token , :size => 4, :level => :h )
		render :partial => 'two_dimension_code'
	end
	
	private
	def demo_params
		params[:demo]
	end
end