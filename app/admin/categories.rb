ActiveAdmin.register Category do

  permit_params :category_name
 
  menu parent: "User"


  index do
    selectable_column
    id_column
    column :category_name
    column :created_at
    actions
  end

  filter :category_name
  filter :created_at

  form do |f|
    f.inputs do
      f.input :category_name
    end
    f.actions
  end

  show do
    attributes_table do
      row :category_name
      row :created_at
    end
  end
end
