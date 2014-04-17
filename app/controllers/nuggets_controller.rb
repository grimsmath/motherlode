class NuggetsController < ApplicationController
  before_action :set_nugget, only: [:show, :edit, :update, :destroy, :approve, :unapprove]
  before_action :authorization

  # GET /nuggets
  # GET /nuggets.json
  def index
    @nuggets = Nugget.all
  end

  # GET /nuggets/1
  # GET /nuggets/1.json
  def show
  end

  # GET /nuggets/new
  def new
    @nugget = Nugget.new
    @nugget.category_id = params[:category_id]
  end

  # GET /nuggets/1/edit
  def edit
  end

  # POST /nuggets
  # POST /nuggets.json
  def create
    @nugget = current_user.nuggets.new(nugget_params)

    respond_to do |format|
      if @nugget.save
        format.html { redirect_to @nugget, notice: 'Nugget was successfully created.' }
        format.json { render action: 'show', status: :created, location: @nugget }
      else
        format.html { render action: 'new' }
        format.json { render json: @nugget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nuggets/1
  # PATCH/PUT /nuggets/1.json
  def update
    respond_to do |format|
      if @nugget.update(nugget_params)
        format.html { redirect_to @nugget, notice: 'Nugget was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @nugget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nuggets/1
  # DELETE /nuggets/1.json
  def destroy
    @nugget.destroy
    respond_to do |format|
      format.html { redirect_to nuggets_url }
      format.json { head :no_content }
    end
  end

  def approve
    @nugget.update_attribute :approved, true
    redirect_to :back
  end

  def unapprove
    @nugget.update_attribute :approved, false
    redirect_to :back
  end

  private
    def authorization
      authorize(@nugget || Nugget)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_nugget
      @nugget = Nugget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nugget_params
      params.require(:nugget).permit(:title, :category_id, :user_id, :approved,
                                     contents_attributes: [:id, :name, :content],
                                     images_attributes: [:id, :title, :caption, :content],
                                     locations_attributes: [:id, :address, :latitude, :longitude])
    end
end
