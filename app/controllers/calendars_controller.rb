class CalendarsController < ApplicationController
  before_action :find_calendar, only: [:show, :edit, :update, :destroy]

  def new
    @calendar = Calendar.new
  end

  def show
  end

  def edit
  end

  def update
    if @calendar.update(calendar_params)
      flash[:success] = t("boby.successfully")
      redirect_to calendar_path(@calendar)
    else
      flash[:danger] = t("boby.unsuccessfully")
      render "edit"
    end
  end

  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.member_id = current_user.member.id
    if @calendar.save
      flash[:success] = t("boby.successfully")
      redirect_to @calendar
    else
      flash[:danger] = t("boby.unsuccessfully")
      render "new"
    end
  end

  def destroy
    @calendar.destroy
    flash[:success] = t("boby.successfully")
    redirect_to @calendar
  end
  
  private
    def find_calendar
      @calendar = Calendar.find_by(id:params[:id])
      unless @calendar
        redirect_to root_path
      end
    end

    def calendar_params
      params.require(:calendar).permit(:room_id, :title, :content, :start_time, :end_time, :member_id, :member_ids => [])
    end
end
