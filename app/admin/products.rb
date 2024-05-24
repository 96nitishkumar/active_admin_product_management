ActiveAdmin.register Product do

  permit_params :product_name, :product_cost, :description, :categories_id, images: []
  
  menu parent: "User"

  index do
    selectable_column
    id_column
    column :product_name
    column :product_cost
    column :description
    column :images do |img|
      img.images.attached? ? img.images.each do |image|
        span do
          image_tag url_for(image), height: '30px', width: '30px'
        end
      end : 'No image available'
    end
    
    column :categories do |product|
      product.categories.category_name
    end
    column :created_at
    actions
  end

  index as: :grid do |product|
    link_to (product.product_name), admin_product_path(product)
  end

  filter :categories, as: :select, collection: Category.all.map { |c| [c.category_name, c.id] }
  filter :product_name
  filter :product_cost
  filter :description
  filter :created_at

  form do |f|
    f.inputs do
      f.input :categories, as: :select, collection: Category.all.map { |c| [c.category_name, c.id] }
      f.input :product_name
      f.input :product_cost
      f.input :description
      f.input :images, as: :file , input_html: { multiple: true }
    end
    f.actions
  end

  show do
    attributes_table do
      row :categories do |product|
        product.categories.category_name
      end
      row :product_name
      row :product_cost
      row :description
      row :images do |img|
        if img.images.attached?
          img.images.each do |image|
            span do
              image_tag url_for(image), height: '30px', width: '30px'
            end
          end
        else
          'No image available'
        end
      end
      
      row :created_at
    end
  end
  
end
