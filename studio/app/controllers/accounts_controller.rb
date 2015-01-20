# coding: utf-8
class AccountsController < ApplicationController
  before_filter :login_required

  def show
    @member = @current_member
    @histories = Booking.where(member_id: @member.id).order("date DESC")
    @booking = @histories.first
# @histories = Booking.where(member_id: @member.id).where("date < ?", Date.today).order("date DESC")
  end

  def edit
    @member = @current_member
    @booking = Booking.find_by_member_id(@member.id)
  end

  def update
    @member = @current_member
    @member.assign_attributes(params[:member])
    if @member.save
      redirect_to :account, notice: "更新しました。"
    else
      render "edit"
    end
  end

  def check
    @member = @current_member
    @booking = Booking.find_by_member_id(@member.id)
  end

  def destroy
    @member = @current_member
    @member.destroy
    redirect_to :root, notice: "退会しました"
  end
end
