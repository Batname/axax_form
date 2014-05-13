class EmailsController < ApplicationController


  def index
    @emails = Email.all
    @email = Email.new
  end


  def new
    @email = Email.new
  end

  def validate
    email = Email.new(email_params)
    validator(email)
    respond_to do |format|
      format.json { render json: @errors }
    end
  end

  def create
    @email = Email.new(email_params)
    respond_to do |format|
    if @email.save
      flash[:success] = 'Email добавлен!'
      format.html { redirect_to root_url }
    else
      format.html { render :new }
    end
    format.js
    end
  end


  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to email_url }
      format.json { head :ok }
      format.js
    end
  end


  private

  def email_params
    params.require(:email).permit(:email, :frequency, :text)
  end

end