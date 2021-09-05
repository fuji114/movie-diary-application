class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @movie = Movie.find(params[:movie_id])
    @comments = Comment.includes(:user).order('created_at DESC')
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to movie_path(@comment.movie) # 今回の実装には関係ありませんが、このようにPrefixでパスを指定することが望ましいです。
    else
      @movie = @comment.movie
      @comments = @movie.comments.includes(:user)
      render "movies/show" # views/tweets/show.html.erbのファイルを参照しています。
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_title, :comment_text).merge(user_id: current_user.id, movie_id: params[:movie_id])
  end
end