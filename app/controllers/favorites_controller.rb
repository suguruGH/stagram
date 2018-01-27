class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to user_url(favorite.user), notice: "#{favorite.picture.user.name}さんのpicをお気に入りしました"
  end

  def destroy
    favorite = current_user.favorites.find_by(picture_id: params[:picture_id]).destroy
    redirect_to user_url(current_user), notice: "#{favorite.picture.user.name}さんのpicをお気に入り解除しました"
  end
end
