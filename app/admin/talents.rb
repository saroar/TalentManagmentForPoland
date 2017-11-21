ActiveAdmin.register Talent do
  permit_params :id, :surname, :given_name, :status, :place_of_birth, :date_of_birth,
                :date_of_issue, :date_of_expiry, :passport_copy,
                :starting_payment, :due_payment, :case_number, :casepassword, :user_id

  collection_action :download_pdf, method: :get do

    user = Talent.find(params[:id])
    fullname = "#{user.given_name}_#{user.surname}.pdf"

    pdf = WickedPdf.new.pdf_from_string(
      render_to_string('admin/talents/download_passport_pdf.html.erb', layout: false)
    )
    send_data pdf, :filename => fullname, :type => "application/pdf",
              :disposition => "attachment", :page_size=> "A4"
  end

  scope_to :current_user, unless: proc{ current_user.has_role? :admin && :consultant }

  index  download_links: proc{ current_user.has_role? :admin } do
    column "CouchName" do |resource|
      "#{resource.user.try(:name)}"
    end unless current_user.has_role? :admin

    column :status
    column :given_name
    column :surname
    column :date_of_expiry
    column :case_number
    column :casepassword

    column "Download" do |resource|
      links = ''.html_safe
      links += link_to 'Download PDF ', download_pdf_admin_talents_path(id: resource, format: :pdf)
      links
    end

    actions
  end

  form do |f|
    f.inputs 'User Details' do
      f.input :surname, label: "Given Name/First Name"
      f.input :given_name, label: "Surname/Last Name"
      f.input :place_of_birth
      f.input :date_of_birth, start_year: 1970
      f.input :date_of_issue, start_year: 1970, label: "Passport Date Of Issue"
      f.input :date_of_expiry, start_year: 1970, label: "Passport Date Of Expiry"
      f.input :passport_copy, :as => :file
      f.input :starting_payment unless current_user.has_role? :consultant
      f.input :due_payment unless current_user.has_role? :consultant
      f.input :case_number
      f.input :casepassword
      f.input :status, as: :select, collection: Talent.statuses.keys, selected: "pending"
      f.input :user_id, :label => 'User', :as => :select,
              :collection => User.all.map{|u| ["#{u.surname} #{u.name}", u.id]},
              selected: current_user.id , :input_html => { class: 'hideinput'}
    end
    f.actions
  end
end

