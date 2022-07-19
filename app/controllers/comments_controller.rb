class CommentsController < ApplicationController
    before_action :set_post
    before_action :set_comment, only: [:destroy]

    def create
        @post.comments.create! params.required(:comment).permit(:content)
        redirect_to @post
    end 

    def destroy
        if @comment.destroy
            flash[:success] = "Deleted"
            redirect_to post_path(@post)
        else
            redirect_to root_path, alert: "Can't delete"
        end
    end

    private
        def set_post
            @post = Post.find(params[:post_id])
        end

        def set_comment
            @comment = Comment.find params[:id]
        end
    
end
