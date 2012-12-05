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
					flash[:alert].should == "You must first log in or sign up before accessing this page."
				end
			end
    end

    def it_should_require_access_for_actions(access_type, actions)
      actions.each do |action|
        it "#{action} action should require #{access_type} access" do
          get action, :id => 1
          response.should redirect_to(root_url)
          flash[:alert].should == "You are not allowed in this section."
        end
      end
    end

    def describe_access(access_requirements,&body)
      login_actions = access_requirements.delete(:login) || []

      describe "login required" do
        it_should_require_login_for_actions login_actions
      end
      describe "logged in" do
        before(:each) do
          login
        end
        describe "access required" do
          access_requirements.each do |access_type,actions|
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
		@current_user = User.new(:username => "user",
                             :email => "user@example.com",
                             :password => "secret")
		@current_user.save!
		session[:user_id] = @current_user.id
  end

  def give_full_access
    @admin_group = UserGroup.new(:name => "admin",
                                 :user_editing => true,
                                 :store_editing => true)
    @admin_group.save!
    @current_user.user_groups = [@admin_group]
    @current_user.save!
  end
end
