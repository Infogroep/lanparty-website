require 'bcrypt'

class User < ActiveRecord::Base
	# new columns need to be added here to be writable through mass assignment
	attr_accessible :username, :email, :password, :password_confirmation, :password_hash, :password_salt, :clan_tag, :payed, :user_group_ids
	attr_accessor :password
	before_save :prepare_password

	scope :payed, -> { where("payed = ?", true) }

	validates_presence_of :username, :email
	validates_uniqueness_of :username, :email, :allow_blank => true
	validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
	validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
	validates_presence_of :password, :on => :create
	validates_confirmation_of :password
	validates_length_of :password, :minimum => 4, :allow_blank => true

	has_and_belongs_to_many :user_groups
	has_and_belongs_to_many :teams
	belongs_to :clan
	has_many :logs

	# login can be either username or email address
	def self.authenticate(login, pass)
		user = find_by_username(login) || find_by_email(login)
		return user if user && user.password_hash == user.encrypt_password(pass)
	end

	def encrypt_password(pass)
		BCrypt::Engine.hash_secret(pass, password_salt)
	end

	def access_allowed?(access_type)
		allowed = false
		user_groups.find_each do |group|
			allowed ||= group.allows_access?(access_type)
		end
		allowed
	end

	def clan_tag
		clan.try(:tag)
	end

	def clan_tag=(tag)
		self.clan = Clan.find_or_create_by_tag(tag) if tag.present?
	end

	def self.smsg_generate_checksum val
		mod = val % 97
		return mod == 0 ? 97 : mod
	end

	def structured_message
		id_str = sprintf "%010d", id
		checksum = sprintf "%02d", User.smsg_generate_checksum(id)
		"+++#{id_str[0..2]}/#{id_str[3..6]}/#{id_str[7..9]}#{checksum}+++"
	end

	def self.find_by_structured_message msg
		m = /\+\+\+(\d{3})\/(\d{4})\/(\d{3})(\d{2})\+\+\+/.match(msg)

		raise "invalid structured message: #{msg}" if m.nil?

		requested_id = (m[1] + m[2] + m[3]).to_i
		calculated_checksum = smsg_generate_checksum(requested_id)
		message_checksum = m[4].to_i

		raise "wrong structured message checksum in #{msg}: expected #{calculated_checksum}, got #{message_checksum}." if calculated_checksum != message_checksum

		self.find(requested_id)
	end

	def all_badges
		badges = []

		user_groups.each do |user_group|
			badge_url = user_group.badge_url(:badge)
			badges.push({ :image_url => badge_url, :title => user_group.description }) if badge_url
		end

		teams.each do |team|
			compo = team.compo
			has_won = compo.has_won?(team)
			badge_url = has_won && compo.winning_badge_url(:badge) || compo.participation_badge_url(:badge)
			badge_title = has_won && "#{compo.game.name} compo winner" || "#{compo.game.name} compo participant"
			badges.push({ :image_url => badge_url, :title => badge_title }) if badge_url
		end

		badges
	end

	private

	def prepare_password
		unless password.blank?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = encrypt_password(password)
		end
	end
end
