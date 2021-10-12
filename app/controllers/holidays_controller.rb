class HolidaysController < ApplicationController
  before_action :find_holiday, only: [:show, :edit, :update, :destroy]
  def index
    @holidays = Holiday.all
  end

  def new
    @holiday = Holiday.new
    
  end

  def create
    @holiday = Holiday.new(holiday_params)
    if @holiday.save
      redirect_to @holiday
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @holiday.update(holiday_params)
      redirect_to holiday_path(@holiday)
    else
      render "edit"
    end
  end

  def show
  end

  def destroy
    @holiday.destroy
    redirect_to @holiday
  end

  private

  def holiday_params
    params.require(:holiday).permit(:name)
  end

  def find_holiday
    @holiday = Holiday.find_by(id: params[:id])
    unless @holiday
      redirect_to root_path
    end
  end

end
