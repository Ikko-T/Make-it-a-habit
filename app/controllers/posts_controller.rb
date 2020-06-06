class PostsController < ApplicationController

    # 投稿データを取得するアクション
    def index
        @posts = Post.all.order(created_at: :desc)
    end

    # 投稿データを表示するアクション
    def show
        @post = Post.find_by(id: params[:id])
    end

    # 新規習慣化を作成するアクション
    def new
    end

    # 新規作成した習慣を送信するアクション
    def create
        @post = Post.new(content: params[:content])
        @post.save
        redirect_to("/posts/index") #指定のURLに転送する
    end

    # 習慣化リストの編集をするアクション
    def edit
        @post = Post.find_by(id: params[:id])
    end

    # フォームの値を受け取り投稿一覧ページにリダイレクトさせる
    def update
        @post = Post.find_by(id: params[:id])
        @post.content = params[:content] # フォームの入力値を受け取る
        @post.save
        redirect_to("/posts/index")
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        @post.destroy
        redirect_to("/posts/index")
    end
end
