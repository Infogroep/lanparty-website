module ControllerMacros
	def self.included(base)
		base.extend(ClassMethods)
	end

	# standard, empty value for additional_params
	def additional_params
		{ }
	end

	module ClassMethods
		def it_should_redirect_for_actions(actions, description, expected_redirect, expected_error)
			actions.each do |action|
				it "#{action} action #{description}" do
					get action, { :id => 1 }.merge(additional_params)
					response.should redirect_to(send(expected_redirect))
					flash[:error].should == expected_error
				end
			end
		end

		def it_should_require_login_for_actions(actions)
			it_should_redirect_for_actions(actions, "should require login", :login_url, "You must first log in or sign up before accessing this page.")
		end

		def it_should_deny_access_for_actions(actions)
			it_should_redirect_for_actions(actions, "should deny access", :home_url, "You are not allowed in this section.")
		end

		def it_should_require_access_for_actions(access_type, actions)
			describe "for access type #{access_type}" do
				before(:each) do
					withdraw_access(access_type)
				end
				it_should_deny_access_for_actions(actions)
			end
		end

		def describe_access(access_requirements, &body)
			login_actions = access_requirements.delete(:login) || []

			describe "when not yet logged in" do
				it_should_require_login_for_actions login_actions
			end
			describe "when logged in" do
				before(:each) do
					login
					give_full_access
				end

				describe "and access has not yet been granted" do
					access_requirements.each do |access_type, actions|
						it_should_require_access_for_actions access_type, actions
					end
				end

				describe "and access has been granted" do
					body && instance_eval(&body)
				end
			end
		end
	end


	def login
		User.skip_callback :save, :before, :prepare_password, :unless => Proc.new { |user| user.password_hash.nil? }
		@current_user = User.new(:username => "user",
		                         :email => "user@example.com",
		                         :password => "secret",
		                         :password_hash => "$2a$10$cg2feQJfTglKpkJjwCtFves068nDh00m6AYhSvwkBvFb5af2AAvwi",
		                         :password_salt => "$2a$10$cg2feQJfTglKpkJjwCtFve")
		@current_user.save!
		session[:user_id] = @current_user.id
	end

	def give_full_access
		new_params = { :name => "admin" }
		UserGroup.access_type_attributes.each do |attrs|
			new_params[attrs] = true
		end
		@admin_group = UserGroup.create(new_params)
		UserGroup.remove_implications
		@current_user.user_groups = [@admin_group]
		@current_user.save!
	end

	def access_type_attribute(access_type)
		:"access_type_#{access_type}"
	end

	def withdraw_access(access_type)
		@admin_group.update_attributes({ access_type_attribute(access_type) => false })
	end
end
