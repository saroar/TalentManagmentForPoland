ActiveAdmin.register User do
  permit_params :id, :name, :surname, :birthday, :email,
                :password, :password_confirmation, role_ids: []


  index download_links: false do
    column :name
    column :surname
    column :roles do | user |
      user.roles.first unless user.roles.blank?
    end
    actions
  end

  form do |f|
    f.inputs 'User Details' do
      f.input :name, label: "Given Name/First Name"
      f.input :surname, label: "Surname/Last Name"
      f.input :birthday, start_year: 1940
      f.input :roles, as: :check_boxes
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end

