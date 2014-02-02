class ReviewsController < ApplicationController
  before_filter :logged_in?, :only => [:create, :edit, :destroy, :update, :new]
  before_filter :get_place
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = @place.reviews
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = @place.reviews.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/new
  # GET /reviews/new.json
  def new
    @review = @place.reviews.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/1/edit
  def edit
    @review = @place.reviews.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = @place.reviews.new(params[:review])
    @review.user = current_user
    respond_to do |format|
      if @review.save
        format.html { redirect_to place_path(@place), notice: 'Review was successfully created.' }
        format.json { render json: @review, status: :created, location: @review }
      else
        format.html { redirect_to place_path(@place, :anchor => "review"), notice: 'Please enter your review!!.' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.json
  def update
    @review = @place.reviews.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to reviews_path, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = @place.reviews.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully removed.' }
      format.json { head :no_content }
    end
  end
  
  private
  
  def get_place
    @place = Place.find(params[:place_id])    
  end
end
