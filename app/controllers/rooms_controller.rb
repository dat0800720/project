class RoomsController < ApplicationController
  before_action :find_room, only: [:show, :edit, :update, :destroy]
  
  def index
    @pagy, @rooms = pagy(Room.all, items: 10)
  end

  def new
    @room = Room.new
  end

  def show
  end

  def edit
  end

  def update
    if @room.update(room_params)
      flash[:success] = t("boby.successfully")
      redirect_to room_path(@room)
    else
      flash[:danger] = t("boby.unsuccessfully")
      render "edit"
    end
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:success] = t("boby.successfully")
      redirect_to @room
    else
      flash[:danger] = t("boby.unsuccessfully")
      render "new"
    end
  end

  def destroy
    @room.destroy
    flash[:success] = t("boby.successfully")
    redirect_to @room
  end

  private
    def room_params
      params.require(:room).permit(:name, :max_member)
    end

    def find_room
      @room = Room.find_by(id:params[:id])
      unless @room
        redirect_to root_path
      end
    end
end
