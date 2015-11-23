class PostsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.name = current_user.name
    @post.save!

    @posts = Post.where("trip_id = ?", @post.trip_id)

    @trip = Trip.find(@post.trip_id)
    Trip.update(@trip, average_points: @posts.average(:point))

    @company = Company.find(@trip.company.id)
    Company.update(@company, points: @company.trips.average(:average_points))    
    
    respond_to do |format|
      if @post.save

        format.html { redirect_to @post, notice: 'Person was successfully created.' }
        format.json { render action: 'show', status: :created, location: @person }
        # added:
        format.js   { render action: 'show', status: :created, location: @person }
      else
        format.html { render action: 'new' }
        format.json { render json: @post_params.errors, status: :unprocessable_entity }
        # added:
        format.js   { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:id, :trip_id, :point, :name, :message)
    end
end
