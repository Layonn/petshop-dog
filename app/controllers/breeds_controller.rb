class BreedsController < ApplicationController
  before_action :set_breed, only: [:edit, :update, :destroy]

  def index
    @breeds = Breed.order(:name).all
  end

  def edit
  end

  def new
    @breed = Breed.new
  end

  def create
    @breed = Breed.new(breed_params)

    respond_to do |format|
      if @breed.save
        format.html { redirect_to breeds_path, notice: t('flash.breeds.create.notice') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @breed.update(breed_params)
        format.html { redirect_to breeds_path, notice: t('flash.breeds.update.notice') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @breed.destroy
    respond_to do |format|
      format.html { redirect_to breeds_path, notice: t('flash.breeds.destroy.notice') }
    end
  end

  private
    def set_breed
      @breed = Breed.find(params[:id])
    end

    def breed_params
      params.require(:breed).permit(:name)
    end

end
