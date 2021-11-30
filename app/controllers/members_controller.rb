class MembersController < ApplicationController
  before_action :find_member, only: [:show ,:edit, :update, :destroy]
  def index
    @search = Member.ransack(params[:q])
    @pagy, @members = pagy(@search.result, items: 10)
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to @member
    else
      render "new"
    end
  end

  def show; end

  def edit; end

  def update
    if @member.update(member_params)
      redirect_to @member
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to member_url
  end

  private
  def find_member
    @member = Member.find_by(id:params[:id])
    unless @member
      redirect_to root_path
    end
  end

  def member_params
    params.require(:member).permit(:name, :employee_code, :sex, :bithday, :nation, :marriage, :nationality, :religion, 
      :identity_card, :date_issued, :issued_at, :home_town, :permanent_address, :presenter, :license_plates,
      :vehicle_brand, :vehicle_color, :phone_number, :relatives_phone, :current_address, :bank_account,
      :bank_name, :work_status, :seniority)
  end
end
