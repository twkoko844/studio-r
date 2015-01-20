# coding: utf-8
class Admin::RoomsController < Admin::Base
  def index
    @rooms = Room.order("id")
  end
  def show
    @room = Room.find(params[:id])
  if params[:format].in?(["jpg", "png", "gif"])
      send_image
    else
      render "show"
    end
  end

  private
  def send_image
    if @room.image.present?
      send_data @room.image.data,
        type: @room.image.content_type, disposition: "inline"
    else
      raise NotFound
    end
  end
end
