class AnalyticsController < ApplicationController
  def index
  	@links = Link.all
  	# @links.each do |link|
  	#   redirect_to :action=>"index"
  	# end
  end
end
