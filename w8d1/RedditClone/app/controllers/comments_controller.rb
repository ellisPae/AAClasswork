class CommentsController < ApplicationController

    before_action :ensure_logged_in, only:  %i(new create edit update destroy)


    def show
        @comment = Comment.find(params[:id])
        render :show
    end

    def new
        @comment = Comment.new
        render :new
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.author_id = current_user.id
        
        # debugger

        if @comment.save
            redirect_to post_url(@comment.post_id)
        else
            flash.now[:errors] = @comment.errors.full_messages
            render :new
        end
    end

    def edit
        @comment = Comment.find(params[:id])
        render :edit
    end

    def update
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
            redirect_to post_url(@comment.post_id)
        else
            flash.now[:errors] = @comment.errors.full_messages
            render :edit
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy if @comment.author_id == current_user.id
        redirect_to post_url(@comment.post_id)
    end

    private
    def comment_params
        params.require(:comment).permit(:content, :parent_comment_id, :post_id)
    end

end
