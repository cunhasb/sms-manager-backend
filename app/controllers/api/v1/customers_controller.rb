require 'faker'
class Api::V1::CustomersController < ApplicationController
  def index
    # byebug
    user=User.all.first
    render json: user.customers
  end

  def show
    byebug
  end
def create
  user= User.all.first
  customer=Customer.new(customer_params)
  customer[:user_id] = user[:id]
  customer[:image_url]= Faker::Avatar.image
  customer.save
  render json: customer
  # ActionCable.server.broadcast "CustomersChannel#{user.id}",customer
end
def destroy
  # debugger;
  customer = Customer.find(params[:id])
  customer.destroy
  customer.destroyed? ? (render json: customer) : (render json:{customer:customer, failed:"Cannot delete, customer is referenced in other tables. Delete all associations, then try again."})

end

private

  def customer_params
    params.require(:customer).permit(:id,:name, :email, :phone,:carrier)
  end
end
