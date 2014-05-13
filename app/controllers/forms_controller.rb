class FormsController < ApplicationController

  # http_basic_authenticate_with name: "bat", password: "21091019", except: [:index, :show]





  def index
    @forms = Form.all
  end


 def show
   @form = Form.find(params[:id])
 end

  def edit
    @form = Form.find(params[:id])
  end



  def new
   @form = Form.new
  end

  def create
    @form = Form.new(form_params)

    respond_to do |format|
    if @form.save
      format.html { redirect_to @form , notice: 'Zombie was successfully created.' }
    else
      format.html { render :new }
    end
    format.js
    end
  end


  def update
    @form = Form.find(params[:id])
    if @form.update(form_params)
      redirect_to @form
    else
      render :new
    end
  end

  def destroy
    @form = Form.find(params[:id])
    @form.destroy
    respond_to do |format|
      # format.html { redirect_to zombies_url, notice: 'Zombie was successfully destroyed.' }
      # format.json { head :no_content }
      format.js
    end
  end


  private
  def form_params
    params.require(:form).permit(:title, :email, :text, :decomp)
  end

end
