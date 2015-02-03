# coding: utf-8
class BookedmaterialsController < ApplicationController
  def new
    @materials = Material.all
    @booking = Booking.find(flash[:id])
  end

  def create
    materials = params[:material]
    @booking = Booking.find(params[:booking][:id])
    materials.each do |ixd|
      if ixd != "-1"
        Bookedmaterial.create(
        {
          :booking => @booking,
          :material => Material.find(ixd)
        }
        )
      end
    end
    redirect_to @booking, notice: "予約しました。"
  end
end
