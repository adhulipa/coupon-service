class CouponService

	class Coupon < ActiveRecord::Base
		validates :code, presence: true
		validates :type, presence: true
		validates :value, presence: true
		validates :applied_on, presence: true
	end

end