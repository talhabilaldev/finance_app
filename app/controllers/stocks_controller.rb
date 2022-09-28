class StocksController < ApplicationController
    def search
        if(params[:stock].present?)
            @stock = Stock.new_lookup(params[:stock])
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