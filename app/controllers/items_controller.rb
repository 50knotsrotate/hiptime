class ItemsController < ApplicationController
    before_action :find_item, only: [:show, :edit, :update, :destroy]
    def index 
        @items = Item.all.order('created_at DESC')
    end

    def new
        @item = Item.new
    end

    def create
         @item = Item.new(item_params)
         if @item.save
            redirect_to root_path

         else 
            render 'new'
         end
    end

    def show
        @item = Item.find(params[:id])
    end

    def edit
        @item = Item.find(params[:id])
    end

    def update
        if @item.update(item_params)
            redirect_to root_path
        else
            render 'edit'
        end
    end

    def destroy
        if @item.destroy
            redirect_to root_path
        end
    end

    private 

    def item_params
        return params.require(:item).permit(:title, :description)
    end

    def find_item
        @item = Item.find(params[:id])
    end
end
