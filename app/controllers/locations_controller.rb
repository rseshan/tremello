class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.where(params[:location]).first_or_create

    respond_to do |format|
      if @location.save
        @musician = Musician.where(:id => current_user.id).first
        @musician.location_id = @location.id
        @musician.save
        format.html { redirect_to musician_path(current_user), notice: 'You have successfully marked your territory!' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @location, notice: 'You have successfully updated your location.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    @musician = Musician.where(:id => current_user.id).first
    @musician.location_id = nil
    @musician.save

    redirect_to musician_path(current_user)
  end
end
