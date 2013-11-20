shared_examples "standard_controller" do |model,options = {}|
	supported_actions = [:index,:show,:new,:edit,:create,:update,:destroy]
	actions = options[:only] ? options[:only] : (options[:except] ? supported_actions - options[:except] : supported_actions)

	singular_model_str = model.name.underscore
	singular_model     = singular_model_str.to_sym
	plural_model       = singular_model_str.pluralize.to_sym

	class_eval(<<-EOF)
	def plural_model_url
		:#{plural_model}_url
	end
	EOF

	def self.fetch_option(options,action,option,default)
		return default if (action_options = options[action]).nil?

		action_options.fetch(option,default)
	end

	describe "GET index" do
		it "assigns all #{plural_model} as @#{plural_model}" do
			model_instance = model.create! valid_attributes
			get :index, additional_params
			assigns(plural_model).should eq(model.all)
		end
	end if actions.include?(:index)

	describe "GET show" do
		it "assigns the requested #{singular_model} as @#{singular_model}" do
			model_instance = model.create! valid_attributes
			get :show, additional_params.merge({ :id => model_instance.id.to_s })
			assigns(singular_model).should eq(model_instance)
		end
	end if actions.include?(:show)

	describe "GET new" do
		it "assigns a new #{singular_model} as @#{singular_model}" do
			get :new, additional_params
			assigns(singular_model).should be_a_new(model)
		end
	end if actions.include?(:new)

	describe "GET edit" do
		it "assigns the requested #{singular_model} as @#{singular_model}" do
			model_instance = model.create! valid_attributes
			get :edit, additional_params.merge({ :id => model_instance.id.to_s })
			assigns(singular_model).should eq(model_instance)
		end
	end if actions.include?(:edit)

	describe "POST create" do
		describe "with valid params" do
			it "creates a new #{singular_model}" do
				expect {
					post :create, additional_params.merge({ singular_model => valid_attributes })
				}.to change(model, :count).by(1)
			end

			it "assigns a newly created #{singular_model} as @#{singular_model}" do
				post :create, additional_params.merge({ singular_model => valid_attributes })
				assigns(singular_model).should be_a(model)
				assigns(singular_model).should be_persisted
			end

			it fetch_option(options,:create,:on_success,"redirects to the #{plural_model} list") do
				post :create, additional_params.merge({ singular_model => valid_attributes })
				on_create_success
			end
		end

		describe "with invalid params" do
			it "assigns a newly created but unsaved #{singular_model} as @#{singular_model}" do
				# Trigger the behavior that occurs when invalid params are submitted
				model.any_instance.stub(:save).and_return(false)
				post :create, additional_params.merge({ singular_model => { "bleh" => "bah" } })
				assigns(singular_model).should be_a_new(model)
			end

			it fetch_option(options,:create,:on_fail,"re-renders the 'new' template") do
				# Trigger the behavior that occurs when invalid params are submitted
				model.any_instance.stub(:save).and_return(false)
				post :create, additional_params.merge({ singular_model => { "bleh" => "bah" } })
				on_create_fail
			end
		end
	end if actions.include?(:create)

	describe "PATCH update" do
		describe "with valid params" do
			it "updates the requested #{singular_model}" do
				model_instance = model.create! valid_attributes
				# Assuming there are no other plural_model in the database, this
				# specifies that the model created on the previous line
				# receives the :update message with whatever params are
				# submitted in the request.
				model.any_instance.should_receive(:update).with(valid_attributes)
				put :update, additional_params.merge({ :id => model_instance.id, singular_model => valid_attributes })
			end

			it "assigns the requested #{singular_model} as @#{singular_model}" do
				model_instance = model.create! valid_attributes
				put :update, additional_params.merge({ :id => model_instance.id, singular_model => valid_attributes })
				assigns(singular_model).should eq(model_instance)
			end

			it fetch_option(options,:update,:on_success,"redirects to the #{plural_model} list") do
				model_instance = model.create! valid_attributes
				put :update, additional_params.merge({ :id => model_instance.id, singular_model => valid_attributes })
				on_update_success(model_instance)
			end
		end

		describe "with invalid params" do
			it "assigns the #{singular_model} as @#{singular_model}" do
				model_instance = model.create! valid_attributes
				# Trigger the behavior that occurs when invalid params are submitted
				model.any_instance.stub(:save).and_return(false)
				put :update, additional_params.merge({ :id => model_instance.id.to_s, singular_model => { "bleh" => "bah" } })
				assigns(singular_model).should eq(model_instance)
			end

			it fetch_option(options,:update,:on_fail,"re-renders the 'edit' template") do
				model_instance = model.create! valid_attributes
				# Trigger the behavior that occurs when invalid params are submitted
				model.any_instance.stub(:save).and_return(false)
				put :update, additional_params.merge({ :id => model_instance.id.to_s, singular_model => { "bleh" => "bah" } })
				on_update_fail(model_instance)
			end
		end
	end if actions.include?(:update)

	describe "DELETE destroy" do
		it "destroys the requested #{singular_model}" do
			model_instance = model.create! valid_attributes
			expect {
				delete :destroy, additional_params.merge({ :id => model_instance.id.to_s })
			}.to change(model, :count).by(-1)
		end

		it fetch_option(options,:destroy,:on_success,"redirects to the #{plural_model} list") do
			model_instance = model.create! valid_attributes
			delete :destroy, additional_params.merge({ :id => model_instance.id.to_s })
			on_destroy_success
		end
	end if actions.include?(:destroy)
end