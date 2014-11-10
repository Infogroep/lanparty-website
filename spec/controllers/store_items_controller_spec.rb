require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.	If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.	There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.	Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe StoreItemsController do

	before(:each) do
		@store_item_class = FactoryGirl.create(:store_item_class)
	end

	# This should return the minimal set of attributes required to create a valid
	# StoreItem. As you add validations to StoreItem, be sure to
	# update the return value of this method accordingly.
	def valid_attributes
		{ :name => "store_itemname", :purchase_price => 12, :stock => 5, :store_item_class_id => @store_item_class.id }
	end

	describe_access(
			login: [:index, :edit, :destroy, :show, :new, :update, :create],
			store_editing: [:edit, :destroy, :new, :update, :create]
	) do

		include_examples "standard_controller", StoreItem

	end
end
