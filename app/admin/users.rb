ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :name, :mobile_number, :location, :image, :status
   scope :enabled

  def authenticate_user!
    redirect_to new_user_session_path unless current_user.enabled?
  end

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :mobile_number
    column :location
    column :image do |user|
      user.image.attached? ? image_tag(url_for(user.image), height: '50px', width: '50px') : "Image not available"   
    end
    column :created_at
    actions
  end

  controller do 
    def update 
      params = resource_params.first
      if  params[:password].blank?
         resource.update_without_password(params)
         redirect_to admin_user_path
      else 
        if resource.update(params)
          redirect_to admin_user_path
        else
          render :edit
        end  
      end 
    end 
  end


  filter :name
  filter :email
  filter :mobile_number
  filter :location
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :mobile_number
      f.input :location
      f.input :status
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :mobile_number
      row :location
      row :image do |user|
        user.image.attached? ? image_tag(url_for(user.image), height: '50px', width: '50px') : "Image not available"   
      end
      row :created_at
    end
  end

  scope :all_users #do |users|
  #   users.all_users
  # end
    
  # scope :sellers do |projects|
  #   projects.seller
  # end

  # scope :buyers do |projects|
  #   projects.buyer
  # end
  

end
