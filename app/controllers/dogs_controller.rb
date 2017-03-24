class DogsController < ApplicationController
  before_action :set_dog, only: [:edit, :update, :destroy]

  def index
    @dogs = Dog.all.order(:name)
  end

  def edit
  end

  def new
    @dogs = Dog.new
  end

  def create
    @dogs = Dog.new(dog_params)

    respond_to do |format|
      if @dogs.save
        format.html { redirect_to dogs_path, notice: t('flash.dogs.create.notice') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to dogs_path, notice: t('flash.dogs.update.notice') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @dog.destroy
    respond_to do |format|
      format.html { redirect_to dogs_path, notice: t('flash.dogs.destoy.notice') }
    end
  end

  private
    def set_dog
      @dog = Dog.find(params[:id])
    end

    def dog_params
      params.require(:dog).permit(:name, :gender, :castrated, :born_in, :last_appointment, :breed_id, :client_id)
    end

end
