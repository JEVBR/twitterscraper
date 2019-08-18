# cadastros_controller.rb
class CadastrosController < ApplicationController
  before_action :set_cadastro, only: %i[show edit update destroy]

  def index
    @cadastros = Cadastro.all.order(created_at: :desc).limit(10)
    return unless params[:search].present?

    @cadastros = @cadastros.where(
      'name LIKE ? or scraped_description LIKE ? or scraped_user LIKE ?',
      "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%"
    )
  end

  def show; end

  def new
    @cadastro = Cadastro.new
  end

  def create
    @cadastro = Cadastro.new(cadastro_params)

    respond_to do |format|
      if @cadastro.save
        format.html { redirect_to cadastro_path(@cadastro),notice: 'Registration done' }
      else
        flash[:alert] = 'Something went wrong!'
        format.html { render :edit }
      end
    end
  end

  def update
    respond_to do |format|
      if @cadastro.update(cadastro_params)
        format.html { redirect_to @cadastro, notice: 'Change successfull' }
      else
        flash[:alert] = 'Something went wrong!'
        format.html { render :edit }
      end
    end
  end

  def destroy
    @cadastro.destroy
    redirect_to cadastros_path
  end

  private

  def set_cadastro
    @cadastro = Cadastro.find(params[:id])
  end

  def cadastro_params
    params.require(:cadastro).permit(:name, :url)
  end
end
