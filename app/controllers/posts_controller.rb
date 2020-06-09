class PostsController < ApplicationController
    before_action :authenticate_user
    before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

    # 投稿データを取得するアクション
    def index
        @posts = Post.all.order(created_at: :desc)
    end

    # 投稿データを表示するアクション
    def show
        @post = Post.find_by(id: params[:id])
        @user = @post.user
    end

    # 新規習慣化を作成するアクション
    def new
        @post = Post.new
    end

    # 新規作成した習慣リストを送信するアクション
    def create
        @post = Post.new(content: params[:content], user_id: @current_user.id)
        if @post.save
            flash[:notice] = "新規作成しました"
            redirect_to("/posts/index") #指定のURLに転送する
        else
            render("posts/new")
        end
    end

    # 習慣化リストの編集をするアクション
    def edit
        @post = Post.find_by(id: params[:id])
    end

    # フォームの値を受け取り投稿一覧ページにリダイレクトさせる
    def update
        @post = Post.find_by(id: params[:id])
        @post.content = params[:content] # フォームの入力値を受け取る
        if @post.save
            flash[:notice] = "内容を編集しました"
            redirect_to("/posts/index")
        else
            render("posts/edit")
        end
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        @post.destroy
        flash[:notice] = "削除しました"
        redirect_to("/posts/index")
    end

    def ensure_correct_user
        @post = Post.find_by(id: params[:id])
        if @post.user_id != @current_user.id
            flash[:notice] = "権限がありません"
            redirect_to("/posts/index")
        end
    end
end
