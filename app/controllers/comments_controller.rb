class CommentsController < ApplicationController

    def create
        @comment = Comment.new(comment_params)
        if @comment.save
          redirect_to prototype_path(@comment.prototype) # Prefixでパス指定⇨コメントに紐づく詳細ページへ
        else
            @prototype = @comment.prototype
            @comments = @prototype.comments
          render "prototypes/show" # views/prototypes/show.html.erbのファイルを参照
        end
    end

    private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end



