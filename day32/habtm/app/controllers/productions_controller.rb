class ProductionsController < ApplicationController
  before_action :set_production, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit]

  # GET /productions
  # GET /productions.json
  def index
    @productions = Production.all
  end

  # GET /productions/1
  # GET /productions/1.json
  def show
  end

  # GET /productions/new
  def new
    @production = Production.new
  end

  # GET /productions/1/edit
  def edit
    @categories = Category.all
  end

  # POST /productions
  # POST /productions.json
  def create
    params[:production][:category_ids] ||= []
    @production = Production.new(production_params)

    respond_to do |format|
      if @production.save
        format.html { redirect_to @production, notice: 'Production was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /productions/1
  # PATCH/PUT /productions/1.json
  def update
    respond_to do |format|
      params[:production][:category_ids] ||= []
      if @production.update(production_params)
        format.html { redirect_to @production, notice: 'Production was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /productions/1
  # DELETE /productions/1.json
  def destroy
    @production.destroy
    respond_to do |format|
      format.html { redirect_to productions_url, notice: 'Production was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_production
    @production = Production.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def production_params
    params.require(:production).permit(:name, category_ids: [])
  end

  def set_categories
    @categories = Category.all
  end
end
