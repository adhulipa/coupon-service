class CouponsController < ApplicationController

	def create
		Services.coupon_service.create_coupon coupon_params
		redirect_to action: index
	end

private
	
	def coupon_params
		params.require(:coupon).permit(:type, :value, :code, :applied_on)
	end
end
