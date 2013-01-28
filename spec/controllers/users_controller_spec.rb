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

		describe "if the current user does not have user_editing access and the current user is not the user being updated" do
			before(:each) do
				withdraw_access(:user_editing)
				user = User.create! valid_attributes
				@additional_params = { :id => user.id, :user => valid_attributes }
			end
			it_should_deny_access_for_actions [:update,:edit]
		end

		describe "if the current user does not have user_editing access and is the same user as the one being updated but user_group_ids is in the request parameters" do
			before(:each) do
				group = FactoryGirl.create(:user_group)
				withdraw_access(:user_editing)
				@additional_params = { :id => @current_user.id, :user => valid_attributes.merge({ :user_group_ids => [group.id] }) }
			end
			it_should_deny_access_for_actions [:update]
		end

		describe "GET index" do
			it "assigns all users as @users" do
				user = User.create! valid_attributes
				get :index, {}
				assigns(:users).should eq([@current_user,user])
			end
		end

		describe "GET show" do
			it "assigns the requested user as @user" do
				user = User.create! valid_attributes
				get :show, {:id => user.to_param}
				assigns(:user).should eq(user)
			end
		end

		describe "GET new" do
			it "assigns a new user as @user" do
				get :new, {}
				assigns(:user).should be_a_new(User)
			end
		end

		describe "GET edit" do
			it "assigns the requested user as @user" do
				user = User.create! valid_attributes
				get :edit, {:id => user.to_param}
				assigns(:user).should eq(user)
			end
		end

		describe "POST create" do
			describe "with valid params" do
				it "creates a new User" do
					expect {
						post :create, {:user => valid_attributes}
					}.to change(User, :count).by(1)
				end

				it "assigns a newly created user as @user" do
					post :create, {:user => valid_attributes}
					assigns(:user).should be_a(User)
					assigns(:user).should be_persisted
				end

				it "redirects to the signup finished page" do
					post :create, {:user => valid_attributes}
					response.should redirect_to(signup_finished_url)
				end
			end

			describe "with invalid params" do
				it "assigns a newly created but unsaved user as @user" do
					# Trigger the behavior that occurs when invalid params are submitted
					User.any_instance.stub(:save).and_return(false)
					post :create, {:user => { :username => "trala" }}
					assigns(:user).should be_a_new(User)
				end

				it "re-renders the 'new' template" do
					# Trigger the behavior that occurs when invalid params are submitted
					User.any_instance.stub(:save).and_return(false)
					post :create, {:user => { :username => "trala" }}
					response.should render_template("new")
				end
			end
		end

		describe "PUT update" do
			describe "with valid params" do
				it "updates the requested user" do
					user = User.create! valid_attributes
					# Assuming there are no other users in the database, this
					# specifies that the User created on the previous line
					# receives the :update_attributes message with whatever params are
					# submitted in the request.
					User.any_instance.should_receive(:update_attributes).with({ "title" => "MyString" })
					put :update, {:id => user.to_param, :user => { "title" => "MyString" }}
				end

				it "assigns the requested user as @user" do
					user = User.create! valid_attributes
					put :update, {:id => user.to_param, :user => valid_attributes}
					assigns(:user).should eq(user)
				end

				it "redirects to the user index" do
					user = User.create! valid_attributes
					put :update, {:id => user.to_param, :user => valid_attributes}
					response.should redirect_to(users_url)
				end
			end

			describe "with invalid params" do
				it "assigns the user as @user" do
					user = User.create! valid_attributes
					# Trigger the behavior that occurs when invalid params are submitted
					User.any_instance.stub(:save).and_return(false)
					put :update, {:id => user.to_param, :user => { :password => "foo" }}
					assigns(:user).should eq(user)
				end

				it "re-renders the 'edit' template" do
					user = User.create! valid_attributes
					# Trigger the behavior that occurs when invalid params are submitted
					User.any_instance.stub(:save).and_return(false)
					put :update, {:id => user.to_param, :user => { :password => "foo" }}
					response.should render_template("edit")
				end
			end
		end
	end
end
