class Video < ActiveRecord::Base  
  belongs_to :movies, :polymorphic => true

  validates :link, presence: true
end
