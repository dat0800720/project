class RequestsController < ApplicationController
  before_action :find_request, only: [:show, :edit, :approved, :update, :destroy]
  def index
    if params[:a] == "send"
      @pagy, @requests = pagy(Request.where(member_id: current_user.member&.id).where.not(request_status: 1), items: 10)
    elsif params[:a] == "approved"
      @pagy, @requests = pagy(Request.where.not(request_status: 1).joins(:member_requests).where(member_requests: { member_id: current_user.member&.id, type_recipient: 0}), items: 10)
    elsif params[:a] == "followed"
      @pagy, @requests = pagy(Request.where.not(request_status: 1).joins(:member_requests).where(member_requests: { member_id: current_user.member&.id, type_recipient: 1}), items: 10)
    elsif params[:a] == "draft"
      @pagy, @requests = pagy(Request.where(member_id: current_user.member&.id).where(request_status: 1), items: 10)
    else
      @pagy, @requests = pagy(Request.where(member_id: current_user.member&.id).where.not(request_status: 1), items: 10)
    end
  end
  
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.member_id = current_user.member.id
    if @request.save
      flash[:success] = t("boby.successfully")
      redirect_to @request
    else
      flash[:danger] = t("boby.unsuccessfully")
      render "new"
    end
  end

  def edit; end

  def update
    if @request.update(request_params)
      flash[:success] = t("boby.successfully")
      redirect_to @request
    else
      flash[:danger] = t("boby.unsuccessfully")
      render "edit"
    end
  end

  def approved
    @request.request_status = 2
    @request.save!
    redirect_to request_path
  end

  def show; end

  def destroy
    @request.destroy
    flash[:success] = t("boby.successfully")
    redirect_to @requests_url
  end

  private
  def find_request
    @request = Request.includes(:break_times).find_by(id: params[:id])
    unless @request
      redirect_to root_path
    end
  end

  def request_params
    params.require(:request).permit(:content, :member_id, :holiday_id, :request_status, :button_draft, approver_ids: [], follower_ids: [],
      break_times_attributes: [:id, :start_time, :end_time, :day, :_destroy])
  end
end
