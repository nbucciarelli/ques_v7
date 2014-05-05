class QuesController < ApplicationController
  before_action :authenticate_user!
  # def index
  #   # GET
  #   # List of data
  #   # Replaced by our home index CURRENTLY
  # end
  def index
    @ques = if params[:q]
      Que.search_names params[:q]
    else
      Que.all
    end
    respond_to do |format|
      format.js
    end
  end

  def show
    # GET
    # Shows an individual object
    @que = Que.find params[:id]
  end

  def new
    # GET
    # Brings you to the new page
    @que = Que.new
  end

  def create
    # POST
    # Creates the data
    @que = Que.new que_params
    success = @que.save
    if success == true
      flash[:notice] = "You have successfully entered le Que."
      redirect_to root_path
    else
      flash[:error] = "You need to enter more information before entering le Que."
      render :new
    end
  end

  def edit
    # GET
    # Brings you to the edit page
    @que = Que.find params[:id]
  end

  def update
    # PUT/PATCH
    # Updates existing data
    @que = Que.find params[:id]
    success = @que.update_attributes que_params
    if success == true
      flash[:notice] = "You have successfully updated le Que."
      redirect_to root_path
    else
      flash[:error] = "You need to enter more information before editing your Que."
      render :edit
    end
  end

  def destroy
    # DELETE
    # Deletes stuff
    @que = Que.find params[:id]
    @que.delete
    redirect_to root_path
  end

  def help_student
    @que = Que.find params[:id]
    @que.nick_visit!

    respond_to do |format|
      # dataType: "script"
      # this is format.js in our controller
      format.js
    end
  end

  def resolve_student
    @que = Que.find params[:id]
    @que.nick_leave!
    respond_to do |format|
      format.js
    end
  end

  def try_helping_student
    @que = Que.find params[:id]
    @que.nick_tried_helping!
    respond_to do |format|
      format.js
    end
  end

  def search_names
    @search_names = Que.search_names params[:q]
  end

  def help_me
    Que.create({name: current_user.name, email: current_user.email})
    flash[:notice] = "You have successfully updated le Que."
    redirect_to root_path

  end
  
  private
    def que_params
      params.require(:que).permit(:name, :email, :image)
    end
end
