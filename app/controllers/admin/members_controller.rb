# coding: utf-8
class Admin::MembersController < Admin::Base
  before_filter :login_required
  def index
    # @members = Member.all
    @members = Member.paginate(page: params[:page], order: :id, per_page: 15)
  end
  
  def search
    @members = Member.search(params[:q])
    render "index"
  end
  
  def show
    @member = Member.find(params[:id])
    render "show"
  end

  def new
    @member = Member.new
  end

  def edit
    @member = Member.find(params[:id])
  end

  def create
    @member = Member.new(params[:member], as: :admin)
    if @member.save
      redirect_to :admin_members, notice: "作成しました。"
    else
      render "new"
    end
  end

  def update
    @member = Member.find(params[:id])
    @member.assign_attributes(params[:member], as: :admin)
    if @member.save
      redirect_to [:admin, @member], notice: "更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :admin_members, notice: "削除しました。"
  end

  def suspend
    @member = Member.find(params[:id])
    if @member.suspend == false
      @member.suspend = true
    elsif @member.suspend == true
      @member.suspend = false
    end
    @member.save
    redirect_to :admin_members, notice: "停止しました。"
  end
end
