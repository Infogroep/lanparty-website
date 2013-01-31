module StandardControllerDefaults
	def on_create_success
		response.should redirect_to(send(plural_model_url))
	end

	def on_create_fail
		response.should render_template("new")
	end

	def on_update_success(instance)
		response.should redirect_to(send(plural_model_url))
	end

	def on_update_fail(instance)
		response.should render_template("edit")
	end

	def on_destroy_success
		response.should redirect_to(send(plural_model_url))
	end
end
