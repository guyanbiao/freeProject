# encoding: utf-8
module Domains
	class Api
		def self.matches?(request)
			request.host === "api.abc.com"
		end
	end
end