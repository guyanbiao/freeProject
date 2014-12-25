# encoding: utf-8
class HardWorker
  include Sidekiq::Worker

  def perform(token)
  	@demo = Demo.where(token: token).first
    	if @demo.present?
    		@demo.statistics.create(
    			count: @demo.contents.count,
    			point: Time.now
    			)
    		puts "-=-=-=-=-#{token}=-=-=-=="
    	end	
  end
end