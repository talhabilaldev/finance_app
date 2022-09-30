class UserFriendshipsController < ApplicationController
    def destroy
        redirect_to my_friends_path
    end
end
