class ArtistPolicy < ApplicationPolicy
  	
  	def index?
		user.admin? if !user.nil?
	end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
