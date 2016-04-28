class Admin < ActiveRecord::Base

	has_many :artist_datas
	has_many :videos
end
