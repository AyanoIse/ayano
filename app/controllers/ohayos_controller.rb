class OhayosController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]

    def top
      @ohayos =Ohayo.all
      
    end

    def index
      @ohayos = Ohayo.all
     
      @ohayo = @ohayos.first 

      if @ohayo.present? 
        @comments = @ohayo.comments
      else
        @comments = []
      end
      @comment = Comment.new

    end

    def new
      @ohayo = Ohayo.new
    end

  def create
     ohayo = Ohayo.new(ohayo_params)

     ohayo.user_id = current_user.id

     
    if ohayo.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  
  def show
    @ohayo = Ohayo.find(params[:id])

    @comments = @ohayo.comments
    @comment = Comment.new
  end

  def edit
    @ohayo = Ohayo.find(params[:id])
  end

  def update
    ohayo = Ohayo.find(params[:id])
    if ohayo.update(ohayo_params)
      redirect_to :action => "index", :id => ohayo.id
    else
      redirect_to :action => "new"
    end
    
  end

  
  def destroy
    ohayo = Ohayo.find(params[:id])
    ohayo.destroy
    redirect_to action: :index
 
  end

  def record
  end

  private
  def ohayo_params
    params.require(:ohayo).permit(:wake, :sleep, :time, :feel, :what, :image, :start_time)
  end

end
    

