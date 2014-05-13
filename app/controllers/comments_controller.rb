class CommentsController < ApplicationController

  # http_basic_authenticate_with name: "bat", password: "21091019", only: :destroy


  def create
    @form = Form.find(params[:form_id])
    @comment = @form.comments.create(comment_params)
    redirect_to form_path(@form)
  end

  def destroy
    @form = Form.find(params[:form_id])
    @comment = @form.comments.find(params[:id])
    @comment.destroy
    redirect_to form_path(@form)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end


end
