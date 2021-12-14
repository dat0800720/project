class RequestsController < ApplicationController
  before_action :find_request, only: [:show, :edit, :update, :destroy]
  def index
    @search = Request.ransack(params[:q])
    @pagy, @requests = pagy(@search.result, items: 10)
  end
  
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      flash[:success] = t("body.successfully")
      redirect_to @request
    else
      flash[:danger] = t("body.unsuccessfully")
      render "new"
    end
  end

  def edit; end

  def update
    if @request.update(request_params)
      flash[:success] = t("body.successfully")
      redirect_to @request
    else
      flash[:danger] = t("body.unsuccessfully")
      render "edit"
    end
  end

  def show; end

  def destroy
    request.destroy
    flash[:success] = t("body.successfully")
    redirect_to @requests
  end

  private
  def find_request
    @request = Request.find_by(id: params[:id])
    unless @request
      redirect_to root_path
    end
  end

  def request_params
    params.require(:request).permit(:content, :member_id, :holiday_id, :request_status, approver_ids: [], follower_ids: [],
      break_times_attributes: [:id, :start_time, :end_time, :day, :_destroy])
  end
end
