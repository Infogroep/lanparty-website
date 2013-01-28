module ControllerMacros
	def self.included(base)
		base.extend(ClassMethods)
	end

	module ClassMethods
		def it_should_require_login_for_actions(actions)
			actions.each do |action|
				it "#{action} action should require login" do
					get action, :id => 1
					response.should redirect_to(login_url)
					flash[:error].should == "You must first log in or sign up before accessing this page."
				end
			end
		end

		def it_should_require_access_for_actions(access_type, actions)
			actions.each do |action|
				it "#{action} action should require #{access_type} access" do
					get action, :id => 1
					response.should redirect_to(home_url)
					flash[:error].should == "You are not allowed in this section."
				end
			end
		end

		def describe_access(access_requirements, &body)
			login_actions = access_requirements.delete(:login) || []

			describe "login required" do
				it_should_require_login_for_actions login_actions
			end
			describe "logged in" do
				before(:each) do
					login
				end
				describe "access required" do
					access_requirements.each do |access_type, actions|
						it_should_require_access_for_actions access_type, actions
					end
				end
				describe "access granted" do
					before(:each) do
						give_full_access
					end
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
		@current_user.user_groups = [@admin_group]
		@current_user.save!
	end
end
