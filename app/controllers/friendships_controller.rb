class FriendshipsController < ApplicationController
    def search
        str = params[:friend]
        if(str.present?)
            @friends = User.search_user(str, current_user.id)
            if @friends.count>0
                respond_to do |format|
                    format.js { render partial: 'users/friend_info'}
                end
            else
                respond_to do |format|
                    flash.now[:alert] = "No user found."
                    format.js { render partial: 'users/friend_info'}
                end

            end
        else
            respond_to do |format|
                flash.now[:alert] = "Enter name or email to search."
                format.js { render partial: 'users/friend_info'}
            end
        end
    end
end
