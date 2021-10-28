class KittensController < ApplicationController
  before_action :find_kitten, only: [:show, :edit, :update, :destroy]

  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end 

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to @kitten, notice: 'Kitten successfully created!'
    else
      render :new
    end 
  end 

  def show
  end 

  def edit
  end 

  def update
    if @kitten.update
      redirect_to @kitten, notice: 'Kitten successfully updated!'
    else 
      render :edit
    end 
  end 

  def destroy
    @kitten.destroy
    redirect_to root_path, notice: 'Kitten deleted'
  end 

  private 

  def find_kitten
    @kitten = Kitten.find(params[:id])
  end 

  def kitten_params
    params.requite(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
