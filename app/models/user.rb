class User < ActiveRecord::Base
	require 'csv'
	has_many :items
	dependent_destroy :items
	after_create :initialize_default_items

	protected

	def initialize_default_items
		item_data = File.read("lib/playa_packing_list.csv")
		CSV.parse(item_data, :headers => true) do |row|
			i = Item.new(row.to_hash)
			i.user_id = self.id
			i.save!
		end
	end
end
