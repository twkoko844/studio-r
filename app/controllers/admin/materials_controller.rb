# coding: utf-8

class Admin::MaterialsController < Admin::Base
  def index
    @materials = Material.all
  end
  def show
    @material = Material.find(params[:id])
  end

  def new
  end

  def edit
    @material = Material.find(params[:id])
    @materialKind = MaterialKind.all
  end

  def create
  end

  def update
    @material = Material.find(params[:id])
   # @mk = MaterialKind.find(params[:kind]) # 配列？
   # @material.kind = @mk　# レコード入れたい
    @material.assign_attributes(params[:material], as: :admin)
    if @material.save
      redirect_to [:admin, :materials], notice: "機材情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @material = Material.find(params[:id])
    @material.destroy
    redirect_to :admin_materials, notice: "削除しました。"
  end

  def suspend
    @material = Material.find(params[:id])
    if @material.suspend
      @material.suspend = false
      @material.save
    redirect_to :admin_materials, notice: "停止を取り消しました。"
    else
      @material.suspend = true
      @material.save
    redirect_to :admin_materials, notice: "停止しました。"
    end
  end
end
