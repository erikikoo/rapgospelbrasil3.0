class Top5 < ActiveRecord::Base
  belongs_to :artist
  validates :titulo, :rank,:titulo2, :rank2,:titulo3, :rank3,:titulo4, :rank4,:titulo5, :rank5, presence: true
end
