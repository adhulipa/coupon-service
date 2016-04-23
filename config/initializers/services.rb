# config/initializers/services.rb

require 'barrister-rails'

class Services

	def self.coupon_service
		@@services ||= proxy_services
		@@services[:coupon_service]
	end

	def self.proxy_services
		service = CouponService.new(StoreService.new)
		idl     = './services/coupon_service/interface.json'
		client  = Barrister::Rails::Client.new service, idl

		{ coupon_service: client.CouponService }
	end

end