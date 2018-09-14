class BillsItem < ApplicationRecord
	belongs_to :bill
	belongs_to :item
end
