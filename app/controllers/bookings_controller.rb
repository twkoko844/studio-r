# coding: utf-8
class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    d = params[:date]
    @room = params[:room][:num]
    @date = Date.new(d["(1i)"].to_i, d["(2i)"].to_i, d["(3i)"].to_i)
    @booking = Booking.new
    @bookings = Booking.search(@room, @date)
    @time = Array.new(11).fill(0)
    @bookings.each do |booking|
      for i in 0..11 do
        if i >= booking.from && i < booking.to then
          @time[i] = 1
        end
      end
    end
  end

  def create
    @booking = Booking.new(params[:booking])
    @booking.book_id = SecureRandom.hex(4)
    if @current_member
      @booking.member = @current_member
    end

    if @booking.save
      redirect_to :new_bookedmaterial, flash: {id: @booking.id}
    else
      render "new"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to :root, notice: "予約をキャンセルしました。"
  end
  
  def search
  end

  def check
  end

  def booksearch
    @booking = Booking.where(book_id: params[:book_id]).first
    if @current_member
      if !@current_member.admin && @booking.member != @current_member then
        redirect_to :check_bookings, notice: "他のユーザーの予約です。"
      else
        render "show"
      end
    else
      if @booking.member != nil then
        redirect_to :check_bookings, notice: "他のユーザーの予約です。"
      else
        render "show"
      end
    end
  end
end
