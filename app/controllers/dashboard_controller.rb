class DashboardController < ApplicationController
	def index
  end

  def search
  	@items = Item.ransack(body_or_name_cont: params[:q]).result()
  	respond_to do |format|
  		format.html {}
  		format.json {
  			@items
  		}
  	end
  end
end
