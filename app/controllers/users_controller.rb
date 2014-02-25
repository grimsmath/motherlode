class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    authorize @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    authorize @user
  end

  # GET /users/new
  def new
    @user = User.new
    authorize @user, :create?
  end

  # GET /users/1/edit
  def edit
    authorize @user, :update?
  end

  # POST /users
  # POST /users.json
  def create
    authorize User

    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize @user

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    authorize @user

    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def approve
    set_user
    authorize @user
    @user.update_attribute :approved, true

    respond_to do |format|
      format.html { redirect_to users_url }
    end
  end

  def unapprove
    set_user
    authorize @user
    @user.update_attribute :approved, false
    redirect_to users_url
  end

  def make_admin
    set_user
    authorize @user
    @user.update_attribute :admin, true
    redirect_to users_url
  end

  def strip_admin
    set_user
    authorize @user
    @user.update_attribute :admin, false
    redirect_to users_url
  end

  def update_password_form
    set_user
    authorize @user, :update_password?
  end

  def update_password
    set_user
    authorize @user, :update?
    binding.remote_pry
    if @user.update(user_params)
      redirect_to users_path
    else
      flash[:failure] = 'Unable to change password'
      redirect_to users_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)

      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
    end
end
