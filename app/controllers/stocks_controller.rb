class StocksController < ApplicationController
    def search
        str = params[:friend]
        if(str.present?)
            @stock = Stock.new_lookup(str)
            if @stock
                respond_to do |format|
                    format.js { render partial: 'users/stock_info'}
                end
            else
                respond_to do |format|
                    flash.now[:alert] = "Enter valid symbol for stock to search."
                    format.js { render partial: 'users/stock_info'}
                end

            end
        else
            respond_to do |format|
                flash.now[:alert] = "Enter symbol for stock to search."
                format.js { render partial: 'users/stock_info'}
            end
        end
    end
end