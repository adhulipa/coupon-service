

class StoreService

	STORE_PROPERTIES = %w(name)

	def create
		store = to_serializable(Store.create(store_properties))
	end

	def create_coupon(coupon)
		opts   = {
			type: coupon.type, 
			value: coupon.value, 
			code: coupon.code, 
			applied_on: coupon.applied_on
		}
		discount = ShopifyAPI::Discount.create opts
		!!discount
	end

private
	
	def to_serializable(store)
		store.serializable_hash.slice *store_properties
	end

end