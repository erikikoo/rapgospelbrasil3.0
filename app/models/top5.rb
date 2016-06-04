class Top5 < ActiveRecord::Base
  belongs_to :artist
  validates :titulo, :artista,:titulo2, :artista2,:titulo3, :artista3,:titulo4, :artista4,:titulo5, :artista5, presence: true
end
