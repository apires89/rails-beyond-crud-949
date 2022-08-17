class ReviewsController < ApplicationController
  def new
    #find the restaurant for the form
    @restaurant = Restaurant.find(params[:restaurant_id])
    #create a blank review
    @review = Review.new
  end

  def create
    #find the restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    #create the review with params coming from the form
    @review = Review.new(review_params)
    #associate review with restaurant
    @review.restaurant = @restaurant
    #save it
    if @review.save
      #redirect
      redirect_to @restaurant
    else
      #render the form again with errors
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end


  private

  def review_params
    params.require(:review).permit(:content)

  end



end
