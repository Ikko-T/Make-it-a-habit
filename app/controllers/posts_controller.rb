class PostsController < ApplicationController

    # 投稿データを取得するアクション
    def index
        @posts = Post.all
    end

    # 投稿データを表示するアクション
    def show
        @post = Post.find_by(id: params[:id])
    end

    # 新規習慣化を作成するアクション
    def new
    end
end
