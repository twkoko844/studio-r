# coding: utf-8
class Admin::BookingsController < Admin::Base
  def index
    # @bookings = Booking.all
    @bookings = Booking.paginate(page: params[:page], :order => "date DESC", per_page: 15)
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
    # @date = Date.new(params[:booking]["date(1i)"].to_i, [:booking]["date(2i)"].to_i, [:booking]["date(3i)"].to_i)
    # params[:booking][:date] = @date
    @member = Member.find(params[:booking][:member].to_i)
    params[:booking][:member] = @member
    @room = Room.find(params[:booking][:room].to_i)
    params[:booking][:room] = @room
    @booking.assign_attributes(params[:booking], as: :admin)
    # @booking.date = @date
    if @booking.save
p @booking
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

  def search
    if params[:member_name] == "未登録ユーザー"
      @bookings = Booking.where(member_id: nil).paginate(page: params[:page], :order => "date DESC", per_page: 15)
    elsif params[:member_name] != ""
      @member = Member.where(name: params[:member_name]).limit(1)
      @bookings = Booking.where(member_id: @member).paginate(page: params[:page], :order => "date DESC", per_page: 15)
    else
      @bookings = Booking.paginate(page: params[:page], :order => "date DESC", per_page: 15)
    end
    render "index"
  end
end
