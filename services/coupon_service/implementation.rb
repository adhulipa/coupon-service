class Coupon

	COUPON_ATTRIBUTES = %w(code type value applied_on)

	def initialize(store_service)
		@store_service = store_service
	end

	def create(coupon_properties)
		coupon = to_serializable(coupon.create(coupon_properties))
		@store_service.create_coupon(coupon)
		coupon
	end

	def get_all_coupons
		Coupon.all.map { |c| to_serializable(c) }
	end

private
    
    def to_serializable(coupon)
    	coupon.serializable_hash.slice *COUPON_ATTRIBUTES
    end

end