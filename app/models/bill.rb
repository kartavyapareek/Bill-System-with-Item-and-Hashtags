class Bill < ApplicationRecord
	has_and_belongs_to_many :items, join_table: :bills_items
	accepts_nested_attributes_for :bills_items
end
