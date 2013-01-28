module WebsiteErrors
	class UserFriendlyError < RuntimeError
	end

	class BarcodeNotFoundError < UserFriendlyError
		def initialize(barcode)
			super "Barcode not found: #{barcode}"
		end
	end
end