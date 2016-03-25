json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :address, :email, :phone_num, :cc_type, :cc_num, :cc_exp
  json.url customer_url(customer, format: :json)
end
