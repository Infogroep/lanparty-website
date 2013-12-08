class Clan < ActiveRecord::Base
	validates :tag, presence: true
	has_many :users

	def get_view_tag
		temp_tag = tag
		temp_tag = "" unless temp_tag
		temp_tag = abbreviate(temp_tag) if long_tag temp_tag
		temp_tag = truncate(temp_tag) if long_tag temp_tag
		temp_tag
	end

	private
	def long_tag(string)
		string.size > 25
	end

	def abbreviate(string)
		string.split.map{|x| x.gsub(/\W+/,'')}.map(&:capitalize).map(&:first)*''
	end

	def truncate(string)
		string[0, 15]+"..."
	end
end
