ActiveAdmin.register User do
  permit_params :name, :email, :password, :phone_number, :street_address, :city, :state, :zip, 
                :service, :appointment, :second_appointment, :third_appointment, :unit_size, :paid

  preserve_default_filters!

  remove_filter :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, 
                :sign_in_count, :last_sign_in_at, :current_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, 
                :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :payments

  filter :service, as: :select, collection: {'Starter Package' => 'Starter', 'Standard Package' => 'Standard', 'Premium Package' => 'Premium'}
  filter :unit_size, as: :select, collection: {'Studio' => 'Studio', '1 Bedroom' => '1 Bedroom', '2 Bedrooms' => '2 Bedrooms', 
                                               '3 Bedrooms' => '3 Bedrooms', '4 Bedrooms' => '4 Bedrooms', '5 Bedrooms' => '5 Bedrooms'}
  filter :paid, as: :select, collection: {'YES' => true, 'NO' => false}

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :created_at do |date|
      date.created_at.strftime('%b %e %Y %l:%M %P') if date.created_at
    end
    column :updated_at do |date|
      date.updated_at.strftime('%b %e %Y %l:%M %P') if date.updated_at
    end
    column :phone_number
    column :street_address
    column :city
    column :state
    column "Zip Code", :zip
    column :unit_size
    column :service
    column :paid
    column "First Appointment", :appointment do |date|
      date.appointment.strftime('%a %b %e %Y %l:%M %P') if date.appointment
    end
    column :second_appointment do |date|
      date.second_appointment.strftime('%a %b %e %Y %l:%M %P') if date.second_appointment
    end
    column :third_appointment do |date|
      date.third_appointment.strftime('%a %b %e %Y %l:%M %P') if date.third_appointment
    end
    actions
  end

  form do |f|
    f.inputs "Users" do 
      f.input :name
      f.input :email
      f.input :password
      f.input :phone_number
      f.input :street_address
      f.input :city
      f.input :state
      f.input :zip
      f.input :unit_size, as: :select, collection: {'Studio' => 'Studio', '1 Bedroom' => '1 Bedroom', '2 Bedrooms' => '2 Bedrooms', 
                                                    '3 Bedrooms' => '3 Bedrooms', '4 Bedrooms' => '4 Bedrooms', '5 Bedrooms' => '5 Bedrooms'}
      f.input :service, as: :select, collection: {'Starter Package' => 'Starter', 'Standard Package' => 'Standard', 'Premium Package' => 'Premium'}
      f.input :paid, as: :select, collection: {'YES' => true, 'NO' => false}
      f.input :appointment
      f.input :second_appointment
      f.input :third_appointment
    end
    f.actions
  end

  controller do
    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
  end

end
