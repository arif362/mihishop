module Admin
  class StockItemsController < BaseController
    before_action :set_stock_item, only: [:update, :destroy]

    def create
      begin
        product = Product.find(params[:product_id])
        stock_location = StockLocation.find(params[:stock_location_id])

        # Build stock movement with quantity
        stock_movement = stock_location.stock_movements.build(stock_movement_params)

        # Set up or find existing stock item for this product and location
        stock_movement.stock_item = stock_location.set_up_stock_item(product)

        # Set the originator (the current user who is adding the stock)
        # current_user is provided by Devise and represents the logged-in admin
        stock_movement.originator = current_user

        if stock_movement.save
          flash[:success] = 'Stock successfully added.'
        else
          flash[:error] = "Unable to add stock: #{stock_movement.errors.full_messages.join(', ')}"
        end
        redirect_to stock_admin_product_path(product)
      rescue ActiveRecord::RecordNotFound => e
        flash[:error] = "Record not found: #{e.message}"
        redirect_back(fallback_location: admin_products_path)
      rescue StandardError => e
        flash[:error] = "Error adding stock: #{e.message}"
        Rails.logger.error "Stock creation error: #{e.message}\n#{e.backtrace.join("\n")}"
        redirect_back(fallback_location: admin_products_path)
      end
    end

    def update
      respond_to do |format|
        if @stock_item.update(stock_item_params)
          format.html { redirect_to stock_admin_product_path(@stock_item.product), notice: 'Stock changed successfully.' }
        else
          format.html { redirect_to stock_admin_product_path(@stock_item.product), error: 'Unable to changed stock.' }
        end
      end
    end

    def destroy
      respond_to do |format|
        @product = @stock_item.product.master? ? @stock_item.product : @stock_item.product.product
        if @stock_item.destroy
          format.html { redirect_to stock_admin_product_path(@product), notice: 'Stock changed successfully.' }
        else
          format.html { redirect_to stock_admin_product_path(@product), error: 'Unable to changed stock.' }
        end
      end
    end

    private

    def set_stock_item
      @stock_item = StockItem.find(params[:id])
    end

    def stock_item_params
      params.require(:stock_item).permit!
    end

    def stock_movement_params
      params.require(:stock_movement).permit!
    end
  end
end
