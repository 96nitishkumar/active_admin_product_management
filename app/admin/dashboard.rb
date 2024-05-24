# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      h1 "WELCOME TO ADMIN DASHBOARD"
      # span class: "blank_slate" do
      #   span I18n.t("active_admin.dashboard_welcome.welcome")
      #   small I18n.t("active_admin.dashboard_welcome.call_to_action")
      # end
    end

    columns do
      column do
        panel "Product Chart" do
          div do
            bar_chart Product.group_by_day(:created_at).count, height:'100'
          end
        end
      end
    end

    columns do
      column do
        panel "Product Chart" do
          div do
            line_chart Product.group_by_day(:created_at).count, height:'100'
          end
        end
      end
    end

      #   div id:"bar" do 
      #   panel "Order Chart" do
      #     div do
      #       pie_chart Order.group_by_day(:created_at).count
      #     end
      #     panel "Product Chart" do
      #      div do
      #       pie_chart Product.group_by_day(:created_at).count
      #     end
      #   end
      # end
      #
      div id: "big" do 
      panel 'Revenue generated' do
        div class: "panel" do
           div class: "panel_contents" do
            h4 "Total Revenue Generated  : #{Product.count*30} $",style:"color:red"
            div id: "bar" do
             bar_chart Order.group("date_trunc('month', created_at)::date ").count
            end
          end
        end
    end


    panel 'Product most orders' do
      div class: "panel" do
         div class: "panel_contents" do
          h4 "Total Revenue Generated  : #{Order.count*30} $",style:"color:red"
          div id: "posts_chart" do
           pie_chart Product.group(:created_at).count
          end
        end
      end
  end
    
    

    # Here is an example of a simple dashboard with columns and panels.
    
    # columns do
    #   column do
    #     panel "Recent Products" do
    #       ul do
    #         Product.all.map do |product|
    #           li link_to(product.product_name, admin_user_path(product))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Recent Order" do
    #       ul do
    #         Order.all.map do |order|
    #           li link_to(order.order_id, admin_user_path(order))
    #         end
    #       end
    #     end       
    #   end
    # end
  end
end
end
