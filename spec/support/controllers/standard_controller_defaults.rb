def on_create_success
	response.should redirect_to(send(plural_model_url))
end