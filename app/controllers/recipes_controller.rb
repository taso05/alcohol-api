class RecipesController < ApplicationController
  def index
    recipes = Recipe.all
    render json: recipes
  end

  # レシピの新規作成
  def create
    recipe = Recipe.new({
                          title: params[:title], # タイトル
                          content: params[:content], # 説明文
                          percentage: params[:percentage], # お酒の度数
                          sweetness: params[:sweetness], # お酒の甘さ
                          image: params[:image], # 画像
                          user_id: params[:user_id], # ユーザーID
                        })

    if recipe.save
      render json: recipe, status: :created
    else
      render json: recipe.errors, status: :unprocessable_entity
    end
  end

  # レシピの編集
  def update
    recipe = Recipe.find(params[:id])
    if recipe.update(
      title: params[:title],
      content: params[:content],
      percentage: params[:percentage],
      sweetness: params[:sweetness],
      image: params[:image],
      user_id: params[:user_id],
    )
      render json: recipe, status: :ok
    else
      render json: recipe.errors, status: :unprocessable_entity
    end
  end

  # private

  # ストロングパラメータ
  # def recipe_params
  #   params.require(:recipe).permit(:title, :description, :ingredients, :instructions)
  # end

  # レシピの削除
  def destroy
    recipe = Recipe.find(params[:id])
    if recipe.destroy
      render json: { message: '削除しました。' }, status: :ok
    else
      render json: { message: '削除に失敗しました' }, status: :unprocessable_entity
    end
  end
end
