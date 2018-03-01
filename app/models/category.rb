class Category < ApplicationRecord
	validates_presence_of :name,:description
	has_many :articles


end
