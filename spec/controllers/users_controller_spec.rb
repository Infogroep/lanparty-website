require 'spec_helper'

describe UsersController do

# This should return the minimal set of attributes required to create a valid
# BlogComment. As you add validations to BlogComment, be sure to
# update the return value of this method accordingly.
	def valid_attributes
		{ :username => "atestuser", :password => "pass", :password_confirmation => "pass", :email => "myemail@flopdrop.com", :clan_tag => "flopdrop" }
	end

	def additional_params
		@additional_params || {}
	end

	def set_owner(user)
		@additional_params = additional_params.merge({ :id => user.id, :user => user.attributes })
	end

	def on_create_success
		response.should redirect_to(signup_finished_url)
	end

	describe_access(
			:login => [:edit,:update],
	    :user_editing => [:markpayed]
	) do

		describe "if user_group_ids is in the request parameters" do
			before(:each) do
				group = FactoryGirl.create(:user_group)
				@additional_params = { :user => valid_attributes.merge({ :user_group_ids => [group.id] }) }
			end
			it_should_deny_access_for_actions [:create]
		end

		describe "if the current user does not have user_editing access and is the same user as the one being updated but user_group_ids is in the request parameters" do
			before(:each) do
				group = FactoryGirl.create(:user_group)
				withdraw_access(:user_editing)
				@additional_params = { :id => @current_user.id, :user => valid_attributes.merge({ :user_group_ids => [group.id] }) }
			end
			it_should_deny_access_for_actions [:update]
		end

		it_should_require_user_or_access_for_actions(:user_editing, [:update,:edit]) do

			include_examples "standard_controller", User, :except => [:destroy],
			                 :create => { :on_success => "redirects to the signup_finished page" }

		end
	end
end
