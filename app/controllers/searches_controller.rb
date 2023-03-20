class SearchesController < ApplicationController

  def area_search
		@rooms = Room.area_search(params[:area_search])
  end

	def keyword_search
		@rooms = Room.keyword_search(params[:keyword_search])
	end

end
