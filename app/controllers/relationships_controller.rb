class RelationshipsController < ApplicationController
  def create
    @follow = current_user.relationships.create(follow_id: params[:user_id], user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end
  def destroy
    @follow = Relationship.find_by(follow_id: params[:id],user_id: current_user.id)
    @follow.destroy
    redirect_back(fallback_location: root_path)
  end
end
