class ItemsController < ApplicationController
    before_action :find_item, only: [:show, :edit, :update, :destroy]
    def index 
        if user_signed_in?
         @items = Item.where(:user_id => current_user.id).order("created_at DESC")
        end
    end

    def new
        @item = current_user.items.build
    end

    def create
         @item = current_user.items.build(item_params)
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
