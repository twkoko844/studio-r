# coding: utf-8
class SessionsController < ApplicationController
  def create
    member = Member.authenticate(params[:email], params[:password])
    if member
      if member.suspend
        p "ok"
        redirect_to :login, notice: "このアカウントは停止されています"
      elsif member.admin
        session[:member_id] = member.id
        redirect_to :admin_root
      else
        session[:member_id] = member.id
        redirect_to :root
      end
    else
      redirect_to :login, notice: "メールアドレスとパスワードが一致しません"
    end
    #redirect_to params[:from] || :root
  end

  def destroy
    session.delete(:member_id)
    redirect_to :root
  end
end
