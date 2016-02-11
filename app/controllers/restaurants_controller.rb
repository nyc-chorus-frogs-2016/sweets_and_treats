class RestaurantsController < ApplicationController
  before_action :ensure_owner, only: [:edit, :update]

  def index
    @categories = Category.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    client = Yelp::Client.new({ consumer_key: ENV["YELP_KEY"],
                            consumer_secret:  ENV["YELP_SECRET"],
                            token:  ENV["YELP_TOKEN"],
                            token_secret:  ENV["YELP_TOKEN_SECRET"]
                          })

    @yelp_data = client.business(@restaurant.yelp_id)
    @name = @yelp_data.business.name
    @address = @yelp_data.business.location.display_address
    @phone = @yelp_data.business.display_phone
    @yelp_data_json = @yelp_data.to_json

  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      flash.notice = 'Restaurant saved'
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  private
    def ensure_owner
      @restaurant = Restaurant.find(params[:id])
      unless @restaurant.editable_by? current_user
        flash[:error] = "You can't update #{@restaurant.name}"
        redirect_to restaurant_path(@restaurant)
      end
    end
end
