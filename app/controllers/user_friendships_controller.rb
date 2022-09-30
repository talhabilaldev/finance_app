class UserFriendshipsController < ApplicationController
    def create
        current_user.friendships.build(friend_id: params[:friend])
        if current_user.save
            flash[:notice] = "You successfully added #{User.find(params[:friend]).full_name} to your friend list."
        else
            flash[:alert] = "Something went wrong."
        end
        redirect_to my_friends_path
    end

    def destroy
        user_friend = current_user.friendships.where(friend_id: params[:id]).first
        user_friend.destroy
        flash[:alert] = "#{User.find(params[:id]).full_name} was successfully removed from your list."
        redirect_to my_friends_path
    end
end
