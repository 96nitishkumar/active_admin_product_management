ActiveAdmin.register Order do
  permit_params :order_id, :status, :amount, :users_id, :products_id
  config.batch_actions = false
  menu parent: "User"

  index do
    id_column
    column :order_id
    column "Status" do |order|
      form_tag(update_status_admin_order_path([order.id]), method: :put) do
        if order.status== true
          select_tag :status, options_for_select(["Yes", "No"], order.status), onchange: 'this.form.submit();'
        else
          select_tag :status, options_for_select(["No", "Yes"], order.status), onchange: 'this.form.submit();'
        end
      end
    end

    column :amount
    column :users do |order|
      order.users.name
    end
    column :products do |order|
      order.products.product_name
    end

    column :created_at
    actions
  end

  filter :users, as: :select, collection: User.all.map { |u| [u.name, u.id] }
  filter :products, as: :select, collection: Product.all.map { |prod| [prod.product_name, prod.id] }
  filter :order_id
  filter :status
  filter :amount
  filter :created_at

  form do |f|
    f.inputs do
      f.input :users, as: :select, collection: User.all.map { |u| [u.name, u.id] }
      f.input :products, as: :select, collection: Product.all.map { |prod| [prod.product_name, prod.id] }
      f.input :order_id
      f.input :status
      f.input :amount
    end
    f.actions
  end

  show do
    attributes_table do
      row :users do |order|
        order.users.name
      end
      row :order_id
      row :status
      row :amount
      row :created_at
    end
  end

  member_action :update_status, method: :put do
      @order = Order.find(params[:id])
      @order.update_column("status", "false") if params[:status]=='No'
      @order.update_column("status", "true") if params[:status]=='Yes'
      redirect_to admin_orders_path, notice: "Status updated successfully."
  end
end
