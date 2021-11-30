class HolidaysController < ApplicationController
  before_action :find_holiday, only: [:show, :edit, :update, :destroy]
  def index
    @search = Holiday.ransack(params[:q])
    @pagy, @holidays = pagy(@search.result, items: 10)
  end

  def new
    @holiday = Holiday.new
  end

  def create
    @holiday = Holiday.new(holiday_params)
    if @holiday.save
      flash[:success] = t("body.successfully")
      redirect_to holidays_path
    else
      flash[:danger] = t("body.unsuccessfully")
      render "new"
    end
  end

  def edit; end

  def update
    if @holiday.update(holiday_params)
      flash[:success] = t("body.successfully")
      redirect_to holidays_path(@holiday)
    else
      flash[:danger] = t("body.unsuccessfully")
      render "edit"
    end
  end

  def destroy
    if @holiday.destroy
      flash[:success] = t("question.successfully")
    else
      flash[:danger] = t("question.unsuccessfully")
    end
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
