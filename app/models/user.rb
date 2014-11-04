class User < ActiveRecord::Base
	require 'csv'
	attr_reader :password

	before_validation :ensure_session_token
	validates :password_digest, :presence => { :message => "Password can't be blank" }
	validates :password, length: { minimum: 6, allow_nil: true }
	validates :username, uniqueness: true
	after_create :initialize_default_items

	has_many :items, dependent: :destroy
	has_one :current_session_token

	def self.find_by_credentials(username, password)
		user = User.find_by(username: username)
		user.try(:is_password?, password) ? user : nil
	end
  
	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end
  
	def is_password?(password)
		BCrypt::Password.new(self.password_digest).is_password?(password)
	end
  
	def reset_session_token!
		self.session_token = SecureRandom::urlsafe_base64(16)
		self.save
		self.session_token
	end
	
	private

	def ensure_session_token
		self.session_token ||= SecureRandom::urlsafe_base64(16) 
	end

	def initialize_default_items
		item_data = File.read("lib/playa_packing_list.csv")
		CSV.parse(item_data, :headers => true) do |row|
			i = Item.new(row.to_hash)
			i.user_id = self.id
			i.save!
		end
	end
end
