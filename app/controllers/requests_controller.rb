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
      redirect_to @request
    else
      render "new"
    end
  end

  def edit; end

  def update
    if @request.update(request_params)
      redirect_to @request
    else
      render "edit"
    end
  end

  def show; end

  def destroy
    request.destroy
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
    params.require(:request).permit(:content, :member_id, :holiday_id, :request_status)
  end
end
