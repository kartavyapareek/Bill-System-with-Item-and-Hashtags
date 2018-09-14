class Item < ApplicationRecord
	has_and_belongs_to_many :tags, dependent: :destroy

	validates :name, presence: true
	validates :body, presence: true
	validates :price, presence: true
	
	after_create do
		item = Item.find_by(id: self.id)
		hashtags = self.body.scan(/#\w+/)
		hashtags.uniq.map do |hashtag|
			tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
			item.tags << tag
		end
	end

	before_update do
		item = Item.find_by(id: self.id)
		item.tags.clear
		hashtags = self.body.scan(/#\w+/)
		hashtags.uniq.map do |hashtag|
			tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
			item.tags << tag
		end
	end
end
