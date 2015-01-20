# coding: utf-8
class MembersController < ApplicationController
  def new
    @member = Member.new
  end
  
  def create
    @member = Member.new(params[:member])
    if @member.save
      session[:member_id] = @member.id
      redirect_to :root, notice: "会員を登録しました。"
    else
      render "new"
    end
  end
end
