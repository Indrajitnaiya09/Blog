class Article < ApplicationRecord
	belongs_to :category
	has_many :reviews

	extend FriendlyId
	friendly_id :title, use: [:slugged, :finders]



	validates_presence_of :title,:body,:category_id,:publish_date,:feature_image_url,:slug
	validate :date_checker
	mount_uploader :feature_image_url, FeatureImageUrlUploader

	def date_checker
		if publish_date > 1.month.from_now
			errors.add(:publish_date,"publish date can't be more then 30days ")
		end
	end

		
end


