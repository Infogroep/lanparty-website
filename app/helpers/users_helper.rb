module UsersHelper
	def avatar_url user, size = 48
		gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
		"http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
	end
end
