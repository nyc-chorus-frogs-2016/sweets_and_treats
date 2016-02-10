class WelcomeController < ApplicationController
  def search
   client = Yelp::Client.new({ consumer_key: ENV["YELP_KEY"],
                            consumer_secret:  ENV["YELP_SECRET"],
                            token:  ENV["YELP_TOKEN"],
                            token_secret:  ENV["YELP_TOKEN_SECRET"]
                          })

   response = client.search('New York', { term: params[:q] })
   render json: response
  end
end
