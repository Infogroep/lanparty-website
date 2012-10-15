module ControllerMacros
	def self.included(base)
		base.extend(ClassMethods)
	end

	module ClassMethods
		def it_should_require_login_for_actions(*actions)
			actions.each do |action|
				it "#{action} action should require login" do
					get action, :id => 1
					response.should redirect_to(login_url)
					flash[:alert].should == "You must first log in or sign up before accessing this page."
				end
			end
		end
	end
	
	def login
		user = User.new(:username => "user", :email => "user@example.com", :password => "secret")
		user.save!
		session[:user_id] = user.id
	end
end
