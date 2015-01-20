# coding: utf-8
class Admin::BookingsController < Admin::Base
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @bookedmaterials = Bookedmaterial.where(booking_id: @booking.id)
  end

  def new
    @booking = Booking.new
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(params[:booking], as: :admin)
    if @booking.save
      redirect_to [:admin, @booking], notice: "予約しました。"
    else
      render "new"
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.assign_attributes(params[:member], as: :admin)
    if @booking.save
      redirect_to [:admin, @booking], notice: "予約を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to :admin_bookings, notice: "予約をキャンセルしました。"
  end
end
